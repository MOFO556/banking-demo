import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mofobank/core/money/format.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:mofobank/data/repositories/providers.dart';
import 'package:mofobank/domain/ledger/ledger_models.dart';
import 'package:mofobank/domain/missions/mission_def.dart';
import 'package:mofobank/domain/missions/quiz_models.dart';
import 'package:mofobank/l10n/quiz_l10n.dart';
import 'package:mofobank/l10n/l10n_ext.dart';
import 'package:mofobank/features/shared/mission_progress_ui.dart';
import 'package:mofobank/features/shared/widgets/mission_complete_sheet.dart';
import 'package:mofobank/features/shared/widgets/mission_quiz_panel.dart';
import 'package:mofobank/features/shared/widgets/mission_scaffold.dart';
import 'package:mofobank/features/shared/widgets/section_header.dart';

class SavingsMissionScreen extends ConsumerStatefulWidget {
  const SavingsMissionScreen({super.key});

  @override
  ConsumerState<SavingsMissionScreen> createState() =>
      _SavingsMissionScreenState();
}

class _SavingsMissionScreenState extends ConsumerState<SavingsMissionScreen> {
  late MissionQuizBank _bank;
  late List<int?> _answers;
  bool _quizInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_quizInitialized) {
      _bank = localizedQuizBank(context.l10n, MissionId.savingsGoals);
      _answers = List<int?>.filled(_bank.length, null, growable: false);
      _title.text = context.l10n.emergencyPot;
      _quizInitialized = true;
    }
  }

  int _qIndex = 0;

  final _title = TextEditingController();
  final _target = TextEditingController(text: '200');
  bool _funded = false;

  bool get _quizComplete => _answers.every((a) => a != null);

  @override
  void dispose() {
    _title.dispose();
    _target.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    var score = _bank.scoreRatio(_answers) * 0.7;
    if (_funded) {
      score += 0.3;
    }

    final settlement = await ref
        .read(bankRepositoryProvider)
        .completeMission(
          missionId: MissionId.savingsGoals,
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
      missionTitle: localizedMission(context.l10n, MissionId.savingsGoals).$1,
    );
    if (mounted) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final snapAsync = ref.watch(bankSnapshotProvider);
    final goalsStream = ref.watch(goalsRepositoryProvider).watchGoals();

    return snapAsync.when(
      loading: () => MissionScaffold(
        title: l10n.savings,
        body: Center(child: CircularProgressIndicator()),
        bottomBar: SizedBox.shrink(),
      ),
      error: (e, _) => MissionScaffold(
        title: l10n.savings,
        body: Center(child: Text(localizedError(context.l10n, e))),
        bottomBar: const SizedBox.shrink(),
      ),
      data: (snap) {
        if (snap == null) {
          return MissionScaffold(
            title: l10n.savings,
            body: SizedBox.shrink(),
            bottomBar: SizedBox.shrink(),
          );
        }
        final c = snap.account.currencyCode;
        return StreamBuilder(
          stream: goalsStream,
          builder: (context, goalSnap) {
            final goals = goalSnap.data ?? [];
            final completed = missionIsCompleted(snap, MissionId.savingsGoals);
            return MissionScaffold(
              title: l10n.savingsGoals,
              statusSlot: Text(
                completed
                    ? l10n.missionCompletedHint
                    : _funded
                    ? l10n.goalFunded
                    : l10n.createThenFund,
                style: TextStyle(
                  color: completed || _funded
                      ? MofoColors.of(context).success
                      : MofoColors.of(context).textSecondary,
                  fontSize: 13,
                ),
              ),
              bottomBar: ElevatedButton(
                onPressed: _quizComplete && goals.isNotEmpty ? _finish : null,
                child: Text(missionFinishLabel(l10n, completed: completed)),
              ),
              body: ListView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                children: [
                  SectionHeader(
                    l10n.goalPots,
                    subtitle: l10n.savingsGoalsSubtitle,
                  ),
                  TextField(
                    controller: _title,
                    decoration: InputDecoration(labelText: l10n.goalName),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _target,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: l10n.targetCurrencyMajor(c),
                    ),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton(
                    onPressed: () async {
                      final major = double.tryParse(_target.text) ?? 0;
                      if (major <= 0) return;
                      await ref
                          .read(goalsRepositoryProvider)
                          .createGoal(
                            title: _title.text.trim(),
                            targetMinor: (major * 100).round(),
                          );
                      setState(() {});
                    },
                    child: Text(l10n.createGoal),
                  ),
                  const SizedBox(height: 12),
                  ...goals.map((g) {
                    final progress = g.targetMinor == 0
                        ? 0.0
                        : (g.savedMinor / g.targetMinor).clamp(0.0, 1.0);
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 56,
                              height: 56,
                              child: CircularProgressIndicator(
                                value: progress,
                                strokeWidth: 6,
                                color: MofoColors.of(context).accent,
                                backgroundColor: MofoColors.of(context)
                                    .surfaceElevated,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    g.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    '${formatMinor(g.savedMinor, c)} / ${formatMinor(g.targetMinor, c)}',
                                    style: TextStyle(
                                      color: MofoColors.of(context)
                                          .textSecondary,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      const fund = 2500;
                                      await ref
                                          .read(bankRepositoryProvider)
                                          .applyBalanceDelta(
                                            deltaMinor: -fund,
                                            type: LedgerEntryType.goalFund,
                                            description:
                                                'l10n:goalFund|${g.title}',
                                          );
                                      await ref
                                          .read(goalsRepositoryProvider)
                                          .fundGoal(
                                            goalId: g.id,
                                            amountMinor: fund,
                                          );
                                      ref.invalidate(bankSnapshotProvider);
                                      setState(() => _funded = true);
                                    },
                                    child: Text(l10n.fundAmount('25')),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
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
      },
    );
  }
}
