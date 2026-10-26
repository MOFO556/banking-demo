import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mofobank/core/money/format.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:mofobank/data/repositories/providers.dart';
import 'package:mofobank/domain/atm/coin_change.dart';
import 'package:mofobank/domain/atm/currency_notes.dart';
import 'package:mofobank/domain/ledger/ledger_models.dart';
import 'package:mofobank/domain/missions/mission_def.dart';
import 'package:mofobank/domain/missions/quiz_models.dart';
import 'package:mofobank/l10n/quiz_l10n.dart';
import 'package:mofobank/features/shared/mission_progress_ui.dart';
import 'package:mofobank/features/shared/widgets/mission_complete_sheet.dart';
import 'package:mofobank/features/shared/widgets/mission_quiz_panel.dart';
import 'package:mofobank/features/shared/widgets/mission_scaffold.dart';
import 'package:mofobank/features/shared/widgets/section_header.dart';
import 'package:mofobank/l10n/l10n_ext.dart';

enum _AtmPack { largeBills, fewestNotes, smallChange }

class AtmMissionScreen extends ConsumerStatefulWidget {
  const AtmMissionScreen({super.key});

  @override
  ConsumerState<AtmMissionScreen> createState() => _AtmMissionScreenState();
}

class _AtmMissionScreenState extends ConsumerState<AtmMissionScreen> {
  late MissionQuizBank _bank;
  late List<int?> _answers;
  bool _quizInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_quizInitialized) {
      _bank = localizedQuizBank(context.l10n, MissionId.atm);
      _answers = List<int?>.filled(_bank.length, null, growable: false);
      _quizInitialized = true;
    }
  }

  int _qIndex = 0;

  final _amountCtrl = TextEditingController();
  int _amountMajor = 0;
  _AtmPack? _selectedPack;
  bool _withdrawn = false;
  bool _seededAmount = false;

  bool get _quizComplete => _answers.every((a) => a != null);

  @override
  void dispose() {
    _amountCtrl.dispose();
    super.dispose();
  }

  void _syncAmount(String currency, int balanceMinor) {
    final raw = int.tryParse(_amountCtrl.text.replaceAll(' ', '')) ?? 0;
    final maxMajor = balanceMinor ~/ 100;
    final snapped = CurrencyNotes.snapToDispensable(
      raw,
      currency,
    ).clamp(0, maxMajor);
    setState(() {
      _amountMajor = snapped;
      _selectedPack = null;
    });
  }

  CoinChangeResult _resultFor(_AtmPack pack, List<int> dens) {
    return switch (pack) {
      _AtmPack.largeBills => greedyChange(_amountMajor, dens),
      _AtmPack.fewestNotes => dpChange(_amountMajor, dens),
      _AtmPack.smallChange => changeFriendlyGreedy(_amountMajor, dens),
    };
  }

  Future<void> _withdraw(String currency) async {
    if (_selectedPack == null || _amountMajor <= 0) return;
    final dens = CurrencyNotes.majorNotesFor(currency);
    final result = _resultFor(_selectedPack!, dens);
    if (!result.feasible) return;

    final minor = _amountMajor * 100;
    await ref
        .read(bankRepositoryProvider)
        .applyBalanceDelta(
          deltaMinor: -minor,
          type: LedgerEntryType.atmWithdraw,
          description:
              'l10n:atmCash|${_selectedPack!.name}|${result.formatBreakdown(dens)}',
        );
    ref.invalidate(bankSnapshotProvider);
    setState(() => _withdrawn = true);
  }

  Future<void> _finish() async {
    var score = _bank.scoreRatio(_answers) * 0.65;
    if (_withdrawn) {
      score += 0.25;
    }
    if (_selectedPack != null) {
      score += 0.1;
    }

    final settlement = await ref
        .read(bankRepositoryProvider)
        .completeMission(
          missionId: MissionId.atm,
          performanceRatio: score.clamp(0.05, 1.0),
        );
    ref.invalidate(bankSnapshotProvider);
    final after = await ref.read(bankRepositoryProvider).loadSnapshot();
    if (!mounted || after == null) {
      return;
    }
    await showMissionCompleteSheet(
      context,
      settlement: settlement,
      currencyCode: after.account.currencyCode,
      missionTitle: localizedMission(context.l10n, MissionId.atm).$1,
    );
    if (mounted) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(bankSnapshotProvider);
    final l10n = context.l10n;
    return async.when(
      loading: () => MissionScaffold(
        title: l10n.atm,
        body: Center(child: CircularProgressIndicator()),
        bottomBar: SizedBox.shrink(),
      ),
      error: (e, _) => MissionScaffold(
        title: l10n.atm,
        body: Center(child: Text(localizedError(context.l10n, e))),
        bottomBar: const SizedBox.shrink(),
      ),
      data: (snap) {
        if (snap == null) {
          return MissionScaffold(
            title: l10n.atm,
            body: SizedBox.shrink(),
            bottomBar: SizedBox.shrink(),
          );
        }
        final currency = snap.account.currencyCode;
        final dens = CurrencyNotes.majorNotesFor(currency);
        final balanceMajor = snap.account.balanceMinor ~/ 100;
        final step = CurrencyNotes.smallestNote(currency);

        if (!_seededAmount && balanceMajor > 0) {
          final preset = CurrencyNotes.snapToDispensable(
            (balanceMajor * 0.2).round().clamp(step, balanceMajor),
            currency,
          );
          _seededAmount = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            _amountCtrl.text = '$preset';
            setState(() => _amountMajor = preset);
          });
        }

        final large = _amountMajor > 0
            ? greedyChange(_amountMajor, dens)
            : null;
        final fewest = _amountMajor > 0 ? dpChange(_amountMajor, dens) : null;
        final small = _amountMajor > 0
            ? changeFriendlyGreedy(_amountMajor, dens)
            : null;

        final completed = missionIsCompleted(snap, MissionId.atm);
        return MissionScaffold(
          title: l10n.atm,
          statusSlot: Text(
            completed
                ? l10n.missionCompletedHint
                : _withdrawn
                ? l10n.cashDispensed
                : l10n.availableAmount(
                    formatMinor(snap.account.balanceMinor, currency),
                  ),
            style: TextStyle(
              color: completed
                  ? MofoColors.of(context).success
                  : MofoColors.of(context).textSecondary,
              fontSize: 13,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          bottomBar: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed:
                      _selectedPack == null || _amountMajor <= 0 || _withdrawn
                      ? null
                      : () => _withdraw(currency),
                  child: Text(l10n.dispense),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: _quizComplete ? _finish : null,
                  child: Text(missionFinishLabel(l10n, completed: completed)),
                ),
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            children: [
              SectionHeader(
                l10n.withdrawCash,
                subtitle: l10n.withdrawCashSubtitle,
              ),
              Text(
                l10n.notesInCassette(dens.join(', '), currency),
                style: TextStyle(
                  color: MofoColors.of(context).textSecondary,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _amountCtrl,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: l10n.amountCurrency(currency),
                  helperText: l10n.multiplesMax(step, balanceMajor),
                ),
                onChanged: (_) =>
                    _syncAmount(currency, snap.account.balanceMinor),
              ),
              const SizedBox(height: 14),
              if (large != null && fewest != null && small != null) ...[
                _packTile(
                  pack: _AtmPack.largeBills,
                  title: l10n.largeBills,
                  subtitle: l10n.largeBillsSubtitle,
                  result: large,
                  dens: dens,
                ),
                _packTile(
                  pack: _AtmPack.fewestNotes,
                  title: l10n.fewestNotes,
                  subtitle: l10n.fewestNotesSubtitle,
                  result: fewest,
                  dens: dens,
                ),
                _packTile(
                  pack: _AtmPack.smallChange,
                  title: l10n.smallerNotes,
                  subtitle: l10n.smallerNotesSubtitle,
                  result: small,
                  dens: dens,
                ),
                if (_selectedPack != null) ...[
                  const SizedBox(height: 8),
                  _NoteDispense(
                    dens: dens,
                    counts: _resultFor(_selectedPack!, dens).counts,
                  ),
                ],
              ],
              const SizedBox(height: 20),
              MissionQuizPanel(
                bank: _bank,
                answers: _answers,
                currentIndex: _qIndex,
                onSelect: (i) => setState(() => _answers[_qIndex] = i),
                onPrev: () => setState(() => _qIndex--),
                onNext: () => setState(() => _qIndex++),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _packTile({
    required _AtmPack pack,
    required String title,
    required String subtitle,
    required CoinChangeResult result,
    required List<int> dens,
  }) {
    final l10n = context.l10n;
    final selected = _selectedPack == pack;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: selected
            ? MofoColors.of(context).accentDim.withValues(alpha: 0.4)
            : MofoColors.of(context).surface,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: result.feasible
              ? () => setState(() => _selectedPack = pack)
              : null,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      selected
                          ? Icons.radio_button_checked
                          : Icons.radio_button_off,
                      color: selected
                          ? MofoColors.of(context).accent
                          : MofoColors.of(context).textSecondary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      '${result.elapsedMicroseconds} �s',
                      style: TextStyle(
                        fontSize: 11,
                        color: MofoColors.of(context).textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: MofoColors.of(context).textSecondary,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  result.feasible
                      ? l10n.noteCountBreakdown(
                          result.totalNotes,
                          result.formatBreakdown(dens),
                        )
                      : l10n.cannotMakeAmount,
                  style: TextStyle(
                    color: result.feasible
                        ? MofoColors.of(context).textPrimary
                        : MofoColors.of(context).danger,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NoteDispense extends StatelessWidget {
  const _NoteDispense({required this.dens, required this.counts});

  final List<int> dens;
  final List<int> counts;

  @override
  Widget build(BuildContext context) {
    final notes = <int>[];
    final n = dens.length < counts.length ? dens.length : counts.length;
    for (var i = 0; i < n; i++) {
      for (var k = 0; k < counts[i] && notes.length < 24; k++) {
        notes.add(dens[i]);
      }
    }
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (var i = 0; i < notes.length; i++)
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: Duration(milliseconds: 280 + i * 40),
            curve: Curves.easeOutCubic,
            builder: (context, t, child) => Opacity(
              opacity: t.clamp(0.0, 1.0),
              child: Transform.translate(
                offset: Offset(0, (1 - t) * 16),
                child: child,
              ),
            ),
            child: Container(
              width: 72,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: MofoColors.of(context).accentDim,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: MofoColors.of(context).accent),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                '${notes[i]}',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
      ],
    );
  }
}
