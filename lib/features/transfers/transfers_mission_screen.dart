import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:mofobank/data/repositories/providers.dart';
import 'package:mofobank/domain/ledger/ledger_models.dart';
import 'package:mofobank/domain/missions/mission_def.dart';
import 'package:mofobank/domain/missions/quiz_models.dart';
import 'package:mofobank/l10n/quiz_l10n.dart';
import 'package:mofobank/domain/transfers/iban.dart';
import 'package:mofobank/features/shared/mission_progress_ui.dart';
import 'package:mofobank/features/shared/widgets/mission_complete_sheet.dart';
import 'package:mofobank/features/shared/widgets/mission_quiz_panel.dart';
import 'package:mofobank/features/shared/widgets/mission_scaffold.dart';
import 'package:mofobank/features/shared/widgets/section_header.dart';
import 'package:mofobank/l10n/l10n_ext.dart';

class TransfersMissionScreen extends ConsumerStatefulWidget {
  const TransfersMissionScreen({super.key});

  @override
  ConsumerState<TransfersMissionScreen> createState() =>
      _TransfersMissionScreenState();
}

class _TransfersMissionScreenState
    extends ConsumerState<TransfersMissionScreen> {
  late MissionQuizBank _bank;
  late List<int?> _answers;
  bool _quizInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_quizInitialized) {
      _bank = localizedQuizBank(context.l10n, MissionId.transfers);
      _answers = List<int?>.filled(_bank.length, null, growable: false);
      _quizInitialized = true;
    }
  }

  int _qIndex = 0;

  final _iban = TextEditingController(text: 'DE89370400440532013000');
  final _amount = TextEditingController(text: '10');
  String? _ibanMsg;
  String? _amountMsg;
  bool _sent = false;

  bool get _quizComplete => _answers.every((a) => a != null);

  @override
  void dispose() {
    _iban.dispose();
    _amount.dispose();
    super.dispose();
  }

  Future<void> _send(int available) async {
    final iban = validateIbanLike(_iban.text);
    final major = double.tryParse(_amount.text) ?? 0;
    final minor = (major * 100).round();
    final amt = validateAmountMinor(minor, available);
    setState(() {
      _ibanMsg = iban.valid ? null : iban.message;
      _amountMsg = amt.valid ? null : amt.message;
    });
    if (!iban.valid || !amt.valid) {
      return;
    }

    await ref
        .read(bankRepositoryProvider)
        .applyBalanceDelta(
          deltaMinor: -minor,
          type: LedgerEntryType.transferOut,
          description: 'l10n:p2pTransfer',
          counterparty: _iban.text.replaceAll(' ', '').toUpperCase(),
        );
    ref.invalidate(bankSnapshotProvider);
    setState(() => _sent = true);
  }

  Future<void> _finish(String misssionTitle) async {
    var score = _bank.scoreRatio(_answers) * 0.7;
    if (_sent) {
      score += 0.3;
    }

    final settlement = await ref
        .read(bankRepositoryProvider)
        .completeMission(
          missionId: MissionId.transfers,
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
      missionTitle: misssionTitle,
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
        title: l10n.transfers,
        body: Center(child: CircularProgressIndicator()),
        bottomBar: SizedBox.shrink(),
      ),
      error: (e, _) => MissionScaffold(
        title: l10n.transfers,
        body: Center(child: Text(localizedError(context.l10n, e))),
        bottomBar: const SizedBox.shrink(),
      ),
      data: (snap) {
        if (snap == null) {
          return MissionScaffold(
            title: l10n.transfers,
            body: SizedBox.shrink(),
            bottomBar: SizedBox.shrink(),
          );
        }
        final completed = missionIsCompleted(snap, MissionId.transfers);
        return MissionScaffold(
          title: l10n.transfers,
          statusSlot: Text(
            completed
                ? l10n.missionCompletedHint
                : _sent
                ? l10n.transferPosted
                : l10n.validateThenSend,
            style: TextStyle(
              color: completed || _sent
                  ? MofoColors.of(context).success
                  : MofoColors.of(context).textSecondary,
              fontSize: 13,
            ),
          ),
          bottomBar: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _sent
                      ? null
                      : () => _send(snap.account.balanceMinor),
                  child: Text(l10n.send),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: _quizComplete
                      ? () => _finish(l10n.missionTransfersTitle)
                      : null,
                  child: Text(missionFinishLabel(l10n, completed: completed)),
                ),
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            children: [
              SectionHeader(
                l10n.simulatedP2p,
                subtitle: l10n.simulatedP2pSubtitle,
              ),
              TextField(
                controller: _iban,
                decoration: InputDecoration(
                  labelText: l10n.beneficiaryIban,
                  errorText: _ibanMsg,
                ),
                onChanged: (_) {
                  final v = validateIbanLike(_iban.text);
                  setState(() => _ibanMsg = v.valid ? null : v.message);
                },
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _amount,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  labelText: l10n.amountCurrency(snap.account.currencyCode),
                  errorText: _amountMsg,
                ),
              ),
              // Reserved error/status height already in scaffold slot
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
}
