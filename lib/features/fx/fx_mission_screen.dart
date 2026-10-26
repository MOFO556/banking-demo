import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mofobank/core/money/format.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:mofobank/data/repositories/fx_repository.dart';
import 'package:mofobank/data/repositories/providers.dart';
import 'package:mofobank/domain/ledger/ledger_models.dart';
import 'package:mofobank/domain/markets/market.dart';
import 'package:mofobank/domain/missions/mission_def.dart';
import 'package:mofobank/domain/missions/quiz_models.dart';
import 'package:mofobank/l10n/quiz_l10n.dart';
import 'package:mofobank/features/shared/mission_progress_ui.dart';
import 'package:mofobank/features/shared/widgets/mission_complete_sheet.dart';
import 'package:mofobank/features/shared/widgets/mission_quiz_panel.dart';
import 'package:mofobank/features/shared/widgets/mission_scaffold.dart';
import 'package:mofobank/features/shared/widgets/section_header.dart';
import 'package:mofobank/l10n/app_localizations.dart';
import 'package:mofobank/l10n/l10n_ext.dart';

class FxMissionScreen extends ConsumerStatefulWidget {
  const FxMissionScreen({super.key});

  @override
  ConsumerState<FxMissionScreen> createState() => _FxMissionScreenState();
}

class _FxMissionScreenState extends ConsumerState<FxMissionScreen> {
  late MissionQuizBank _bank;
  late List<int?> _answers;
  bool _quizInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_quizInitialized) {
      _bank = localizedQuizBank(context.l10n, MissionId.fx);
      _answers = List<int?>.filled(_bank.length, null, growable: false);
      _quizInitialized = true;
    }
  }

  int _qIndex = 0;

  String _quote = 'USD';
  String? _loadedPair;
  final _amountController = TextEditingController(text: '100');
  FxQuote? _quoteData;
  String? _error;
  bool _loading = false;
  bool _converted = false;

  bool get _quizComplete => _answers.every((a) => a != null);

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _ensureRate(String base) async {
    final pair = '$base:$_quote';
    if (_loadedPair == pair && _quoteData != null) {
      return;
    }
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final q = await ref
          .read(fxRepositoryProvider)
          .getRate(base: base, quote: _quote);
      if (!mounted) {
        return;
      }
      setState(() {
        _quoteData = q;
        _loadedPair = pair;
      });
    } catch (e) {
      if (!mounted) {
        return;
      }
      setState(() => _error = context.l10n.couldNotLoadRate);
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  Future<void> _finish(String base, AppLocalizations l10n) async {
    var score = _bank.scoreRatio(_answers) * 0.7;
    if (_quoteData != null) {
      score += 0.15;
    }
    if (_converted) {
      score += 0.15;
    }

    if (_quoteData != null) {
      final amountMajor = double.tryParse(_amountController.text) ?? 0;
      final amountMinor = (amountMajor * 100).round();
      if (amountMinor > 0) {
        final fee = (amountMinor * _quoteData!.markup).round();
        try {
          await ref
              .read(bankRepositoryProvider)
              .applyBalanceDelta(
                deltaMinor: -fee,
                type: LedgerEntryType.fxConvert,
                description: 'l10n:fx|$base→$_quote',
              );
          ref.invalidate(bankSnapshotProvider);
          _converted = true;
        } catch (_) {}
      }
    }

    final settlement = await ref
        .read(bankRepositoryProvider)
        .completeMission(
          missionId: MissionId.fx,
          performanceRatio: score.clamp(0.05, 1.0),
        );
    ref.invalidate(bankSnapshotProvider);
    final snap = await ref.read(bankRepositoryProvider).loadSnapshot();
    if (!mounted || snap == null) {
      return;
    }
    await showMissionCompleteSheet(
      context,
      settlement: settlement,
      currencyCode: snap.account.currencyCode,
      missionTitle: l10n.missionFxTitle,
    );
    if (mounted) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final async = ref.watch(bankSnapshotProvider);
    return async.when(
      loading: () => MissionScaffold(
        title: l10n.fx,
        body: Center(child: CircularProgressIndicator()),
        bottomBar: SizedBox.shrink(),
      ),
      error: (e, _) => MissionScaffold(
        title: l10n.fx,
        body: Center(child: Text(localizedError(context.l10n, e))),
        bottomBar: const SizedBox.shrink(),
      ),
      data: (snap) {
        if (snap == null) {
          return MissionScaffold(
            title: l10n.fx,
            body: SizedBox.shrink(),
            bottomBar: SizedBox.shrink(),
          );
        }
        final base = snap.account.currencyCode;
        final majors = MarketsCatalog.all
            .map((m) => m.currencyCode)
            .where((c) => c != base)
            .toList();
        if (!majors.contains(_quote)) {
          _quote = majors.first;
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _ensureRate(base);
          }
        });

        final amountMajor = double.tryParse(_amountController.text) ?? 0;
        final amountMinor = (amountMajor * 100).round();
        final converted = _quoteData == null
            ? null
            : ref
                  .read(fxRepositoryProvider)
                  .convertMinor(
                    amountMinor: amountMinor,
                    bankRate: _quoteData!.bankRate,
                  );

        final completed = missionIsCompleted(snap, MissionId.fx);
        return MissionScaffold(
          title: l10n.fx,
          statusSlot: Text(
            completed
                ? l10n.missionCompletedHint
                : _loading
                ? l10n.updatingRate
                : (_error ??
                      (_quoteData?.synthetic == true
                          ? l10n.showingEstimatedRate
                          : _quoteData?.fromCache == true
                          ? l10n.showingCachedRate
                          : l10n.ratesReady)),
            style: TextStyle(
              color: completed
                  ? MofoColors.of(context).success
                  : _error != null
                  ? MofoColors.of(context).danger
                  : MofoColors.of(context).textSecondary,
              fontSize: 13,
            ),
          ),
          bottomBar: ElevatedButton(
            onPressed: _quizComplete ? () => _finish(base, l10n) : null,
            child: Text(missionFinishLabel(l10n, completed: completed)),
          ),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            children: [
              SectionHeader(l10n.exchange, subtitle: l10n.exchangeSubtitle),
              TextField(
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  labelText: l10n.amountCurrency(base),
                ),
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                // ignore: deprecated_member_use
                value: _quote,
                items: majors
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (v) {
                  if (v == null) {
                    return;
                  }
                  setState(() {
                    _quote = v;
                    _loadedPair = null;
                  });
                  _ensureRate(base);
                },
                decoration: InputDecoration(labelText: l10n.convertTo),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 88,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _loading && _quoteData == null
                      ? const CircularProgressIndicator()
                      : _error != null
                      ? Text(
                          _error!,
                          style: TextStyle(
                            color: MofoColors.of(context).danger,
                          ),
                        )
                      : _quoteData == null
                      ? const SizedBox.shrink()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '1 $base = ${_quoteData!.bankRate.toStringAsFixed(4)} $_quote',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '${l10n.includesBankSpread} '
                              '(${(_quoteData!.markup * 100).toStringAsFixed(1)}%)',
                              style: TextStyle(
                                color: MofoColors.of(context).textSecondary,
                                fontSize: 12,
                              ),
                            ),
                            if (converted != null)
                              Text(
                                l10n.youReceive(formatMinor(converted, _quote)),
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: MofoColors.of(context).accent,
                                ),
                              ),
                          ],
                        ),
                ),
              ),
              const SizedBox(height: 12),
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
}
