import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mofobank/core/money/format.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:mofobank/data/repositories/providers.dart';
import 'package:mofobank/domain/deposits/interest.dart';
import 'package:mofobank/domain/markets/market.dart';
import 'package:mofobank/domain/missions/mission_def.dart';
import 'package:mofobank/domain/missions/quiz_models.dart';
import 'package:mofobank/l10n/quiz_l10n.dart';
import 'package:mofobank/features/shared/mission_progress_ui.dart';
import 'package:mofobank/features/shared/widgets/country_flag.dart';
import 'package:mofobank/features/shared/widgets/mission_complete_sheet.dart';
import 'package:mofobank/features/shared/widgets/mission_quiz_panel.dart';
import 'package:mofobank/features/shared/widgets/mission_scaffold.dart';
import 'package:mofobank/features/shared/widgets/section_header.dart';
import 'package:mofobank/l10n/l10n_ext.dart';

class DepositsMissionScreen extends ConsumerStatefulWidget {
  const DepositsMissionScreen({super.key});

  @override
  ConsumerState<DepositsMissionScreen> createState() =>
      _DepositsMissionScreenState();
}

class _DepositsMissionScreenState extends ConsumerState<DepositsMissionScreen> {
  late MissionQuizBank _bank;
  late List<int?> _answers;
  bool _quizInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_quizInitialized) {
      _bank = localizedQuizBank(context.l10n, MissionId.deposits);
      _answers = List<int?>.filled(_bank.length, null, growable: false);
      _quizInitialized = true;
    }
  }

  int _qIndex = 0;
  String? _compareMarketId;

  bool get _quizComplete => _answers.every((a) => a != null);

  Future<void> _finish(Market home, int principal, String missionTitle) async {
    var bestId = home.id;
    var bestNet = computeAnnualInterest(
      principalMinor: principal,
      apy: home.depositApyExample,
      withholdingTaxRate: home.interestWithholdingTaxRate,
    ).netInterestMinor;

    for (final m in MarketsCatalog.all) {
      final net = computeAnnualInterest(
        principalMinor: principal,
        apy: home.depositApyExample,
        withholdingTaxRate: m.interestWithholdingTaxRate,
      ).netInterestMinor;
      if (net > bestNet) {
        bestNet = net;
        bestId = m.id;
      }
    }

    final pickCorrect = _compareMarketId == bestId;
    var score = _bank.scoreRatio(_answers) * 0.7;
    if (pickCorrect) {
      score += 0.3;
    }

    final settlement = await ref
        .read(bankRepositoryProvider)
        .completeMission(
          missionId: MissionId.deposits,
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
        title: l10n.deposits,
        body: Center(child: CircularProgressIndicator()),
        bottomBar: SizedBox.shrink(),
      ),
      error: (e, _) => MissionScaffold(
        title: l10n.deposits,
        body: Center(child: Text(localizedError(context.l10n, e))),
        bottomBar: const SizedBox.shrink(),
      ),
      data: (snap) {
        if (snap == null) {
          return MissionScaffold(
            title: l10n.deposits,
            body: SizedBox.shrink(),
            bottomBar: SizedBox.shrink(),
          );
        }
        final home = snap.market;
        final principal = (snap.account.balanceMinor * 0.5).round().clamp(
          10000,
          snap.account.balanceMinor,
        );
        final homeBreakdown = computeAnnualInterest(
          principalMinor: principal,
          apy: home.depositApyExample,
          withholdingTaxRate: home.interestWithholdingTaxRate,
        );
        final bars = MarketsCatalog.all
            .map(
              (m) => (
                m,
                computeAnnualInterest(
                  principalMinor: principal,
                  apy: home.depositApyExample,
                  withholdingTaxRate: m.interestWithholdingTaxRate,
                ),
              ),
            )
            .toList();

        final completed = missionIsCompleted(snap, MissionId.deposits);
        return MissionScaffold(
          title: l10n.depositsAndTax,
          statusSlot: Text(
            completed
                ? l10n.missionCompletedHint
                : _compareMarketId == null
                ? l10n.compareTaxDrag
                : l10n.marketPickedQuiz,
            style: TextStyle(
              color: completed
                  ? MofoColors.of(context).success
                  : MofoColors.of(context).textSecondary,
              fontSize: 13,
            ),
          ),
          bottomBar: ElevatedButton(
            onPressed: _quizComplete && _compareMarketId != null
                ? () => _finish(home, principal, l10n.missionDepositsTitle)
                : null,
            child: Text(missionFinishLabel(l10n, completed: completed)),
          ),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            children: [
              SectionHeader(
                l10n.lodgementSandbox,
                subtitle: l10n.lodgementSandboxSubtitle,
              ),
              Text(
                l10n.principalApy(
                  formatMinor(principal, home.currencyCode),
                  (home.depositApyExample * 100).toStringAsFixed(1),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                l10n.homeNetTax(
                  formatMinor(
                    homeBreakdown.netInterestMinor,
                    home.currencyCode,
                  ),
                  formatMinor(homeBreakdown.taxMinor, home.currencyCode),
                ),
                style: TextStyle(color: MofoColors.of(context).textSecondary),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: BarChart(
                  BarChartData(
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      leftTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (v, _) {
                            final i = v.toInt();
                            if (i < 0 || i >= bars.length) {
                              return const SizedBox.shrink();
                            }
                            return Text(
                              bars[i].$1.currencyCode,
                              style: const TextStyle(fontSize: 10),
                            );
                          },
                        ),
                      ),
                    ),
                    barGroups: [
                      for (var i = 0; i < bars.length; i++)
                        BarChartGroupData(
                          x: i,
                          barRods: [
                            BarChartRodData(
                              toY: bars[i].$2.netInterestMinor.toDouble(),
                              color: bars[i].$1.id == home.id
                                  ? MofoColors.of(context).accent
                                  : MofoColors.of(context).accentDim,
                              width: 14,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SectionHeader(
                l10n.lowestTaxDrag,
                subtitle: l10n.lowestTaxDragSubtitle,
              ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: MarketsCatalog.all.map((m) {
                  final selected = _compareMarketId == m.id;
                  return ChoiceChip(
                    avatar: CountryFlag(marketId: m.id, size: 14),
                    label: Text(m.currencyCode),
                    selected: selected,
                    onSelected: (_) => setState(() => _compareMarketId = m.id),
                  );
                }).toList(),
              ),
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
