import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mofobank/core/money/format.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:mofobank/data/repositories/providers.dart';
import 'package:mofobank/domain/credit/min_payment_trap.dart';
import 'package:mofobank/domain/missions/mission_def.dart';
import 'package:mofobank/domain/missions/quiz_models.dart';
import 'package:mofobank/l10n/quiz_l10n.dart';
import 'package:mofobank/features/shared/mission_progress_ui.dart';
import 'package:mofobank/features/shared/widgets/mission_complete_sheet.dart';
import 'package:mofobank/features/shared/widgets/mission_quiz_panel.dart';
import 'package:mofobank/features/shared/widgets/mission_scaffold.dart';
import 'package:mofobank/features/shared/widgets/section_header.dart';
import 'package:mofobank/l10n/l10n_ext.dart';

class CreditMissionScreen extends ConsumerStatefulWidget {
  const CreditMissionScreen({super.key});

  @override
  ConsumerState<CreditMissionScreen> createState() =>
      _CreditMissionScreenState();
}

class _CreditMissionScreenState extends ConsumerState<CreditMissionScreen> {
  late MissionQuizBank _bank;
  late List<int?> _answers;
  bool _quizInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_quizInitialized) {
      _bank = localizedQuizBank(context.l10n, MissionId.credit);
      _answers = List<int?>.filled(_bank.length, null, growable: false);
      _quizInitialized = true;
    }
  }

  int _qIndex = 0;

  bool get _quizComplete => _answers.every((a) => a != null);

  Future<void> _finish(String missionTitle) async {
    final score = _bank.scoreRatio(_answers).clamp(0.05, 1.0);
    final settlement = await ref
        .read(bankRepositoryProvider)
        .completeMission(missionId: MissionId.credit, performanceRatio: score);
    ref.invalidate(bankSnapshotProvider);
    final snap = await ref.read(bankRepositoryProvider).loadSnapshot();
    if (!mounted || snap == null) {
      return;
    }
    await showMissionCompleteSheet(
      context,
      settlement: settlement,
      currencyCode: snap.account.currencyCode,
      missionTitle: missionTitle,
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
        title: l10n.credit,
        body: Center(child: CircularProgressIndicator()),
        bottomBar: SizedBox.shrink(),
      ),
      error: (e, _) => MissionScaffold(
        title: l10n.credit,
        body: Center(child: Text(localizedError(context.l10n, e))),
        bottomBar: const SizedBox.shrink(),
      ),
      data: (snap) {
        if (snap == null) {
          return MissionScaffold(
            title: l10n.credit,
            body: SizedBox.shrink(),
            bottomBar: SizedBox.shrink(),
          );
        }
        final c = snap.account.currencyCode;
        const start = 100000;
        final sim = simulateMinPaymentTrap(
          startingBalanceMinor: start,
          annualApr: 0.22,
          minPaymentRate: 0.02,
          minPaymentFloorMinor: 2500,
          maxMonths: 60,
        );
        final spots = <FlSpot>[
          for (final s in sim.steps.take(36))
            FlSpot(s.month.toDouble(), s.balanceMinor / 100.0),
        ];

        final completed = missionIsCompleted(snap, MissionId.credit);
        return MissionScaffold(
          title: l10n.credit,
          statusSlot: Text(
            completed
                ? l10n.missionCompletedHint
                : l10n.interestPaid(formatMinor(sim.totalInterestMinor, c)),
            style: TextStyle(
              color: completed
                  ? MofoColors.of(context).success
                  : MofoColors.of(context).warning,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottomBar: ElevatedButton(
            onPressed: _quizComplete
                ? () => _finish(l10n.missionCreditTitle)
                : null,
            child: Text(missionFinishLabel(l10n, completed: completed)),
          ),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            children: [
              SectionHeader(
                l10n.minimumPaymentTrap,
                subtitle: l10n.minimumPaymentTrapSubtitle,
              ),
              Text(
                l10n.creditStartSummary(formatMinor(start, c)),
                style: TextStyle(color: MofoColors.of(context).textSecondary),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 180,
                child: LineChart(
                  LineChartData(
                    gridData: const FlGridData(show: false),
                    titlesData: const FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        isCurved: true,
                        color: MofoColors.of(context).danger,
                        barWidth: 3,
                        dotData: const FlDotData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                sim.paidOff
                    ? l10n.paidOffMonths(sim.monthsToZero)
                    : l10n.stillOpenMonths(sim.monthsToZero),
              ),
              const SizedBox(height: 16),
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
