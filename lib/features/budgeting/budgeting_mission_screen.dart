import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mofobank/core/money/format.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:mofobank/data/repositories/providers.dart';
import 'package:mofobank/domain/missions/mission_def.dart';
import 'package:mofobank/domain/missions/quiz_models.dart';
import 'package:mofobank/l10n/quiz_l10n.dart';
import 'package:mofobank/features/shared/mission_progress_ui.dart';
import 'package:mofobank/features/shared/widgets/mission_complete_sheet.dart';
import 'package:mofobank/features/shared/widgets/mission_quiz_panel.dart';
import 'package:mofobank/features/shared/widgets/mission_scaffold.dart';
import 'package:mofobank/features/shared/widgets/section_header.dart';
import 'package:mofobank/l10n/l10n_ext.dart';

class BudgetingMissionScreen extends ConsumerStatefulWidget {
  const BudgetingMissionScreen({super.key});

  @override
  ConsumerState<BudgetingMissionScreen> createState() =>
      _BudgetingMissionScreenState();
}

class _BudgetingMissionScreenState
    extends ConsumerState<BudgetingMissionScreen> {
  late MissionQuizBank _bank;
  late List<int?> _answers;
  bool _quizInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_quizInitialized) {
      _bank = localizedQuizBank(context.l10n, MissionId.budgeting);
      _answers = List<int?>.filled(_bank.length, null, growable: false);
      _quizInitialized = true;
    }
  }

  int _qIndex = 0;
  final _category = TextEditingController();
  final _amount = TextEditingController();
  bool _isIncome = false;

  bool get _quizComplete => _answers.every((a) => a != null);

  @override
  void dispose() {
    _category.dispose();
    _amount.dispose();
    super.dispose();
  }

  Future<void> _finish(
    int income,
    int expense,
    String missionBudgetingTitle,
  ) async {
    var score = _bank.scoreRatio(_answers) * 0.7;
    if (income + expense > 0) {
      score += 0.15;
    }
    if (income > expense) {
      score += 0.15;
    }

    final settlement = await ref
        .read(bankRepositoryProvider)
        .completeMission(
          missionId: MissionId.budgeting,
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
      missionTitle: missionBudgetingTitle,
    );
    if (mounted) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final snapAsync = ref.watch(bankSnapshotProvider);
    final itemsAsync = ref.watch(budgetRepositoryProvider).watchItems();

    return snapAsync.when(
      loading: () => MissionScaffold(
        title: l10n.budgeting,
        body: Center(child: CircularProgressIndicator()),
        bottomBar: SizedBox.shrink(),
      ),
      error: (e, _) => MissionScaffold(
        title: l10n.budgeting,
        body: Center(child: Text(localizedError(context.l10n, e))),
        bottomBar: const SizedBox.shrink(),
      ),
      data: (snap) {
        if (snap == null) {
          return MissionScaffold(
            title: l10n.budgeting,
            body: SizedBox.shrink(),
            bottomBar: SizedBox.shrink(),
          );
        }
        final c = snap.account.currencyCode;
        return StreamBuilder(
          stream: itemsAsync,
          builder: (context, snapshot) {
            final items = snapshot.data ?? [];
            final income = items
                .where((i) => i.isIncome)
                .fold<int>(0, (a, b) => a + b.amountMinor);
            final expense = items
                .where((i) => !i.isIncome)
                .fold<int>(0, (a, b) => a + b.amountMinor);

            final completed = missionIsCompleted(snap, MissionId.budgeting);
            return MissionScaffold(
              title: l10n.budgeting,
              statusSlot: Text(
                completed
                    ? l10n.missionCompletedHint
                    : l10n.incomeExpenses(
                        formatMinor(income, c),
                        formatMinor(expense, c),
                      ),
                style: TextStyle(
                  color: completed
                      ? MofoColors.of(context).success
                      : MofoColors.of(context).textSecondary,
                  fontSize: 13,
                ),
              ),
              bottomBar: ElevatedButton(
                onPressed: _quizComplete && items.isNotEmpty
                    ? () => _finish(income, expense, l10n.missionBudgetingTitle)
                    : null,
                child: Text(missionFinishLabel(l10n, completed: completed)),
              ),
              body: ListView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                children: [
                  SectionHeader(l10n.cashflow, subtitle: l10n.cashflowSubtitle),
                  SizedBox(
                    height: 160,
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 2,
                        centerSpaceRadius: 32,
                        sections: [
                          if (income > 0)
                            PieChartSectionData(
                              value: income.toDouble(),
                              color: MofoColors.of(context).success,
                              title: l10n.inLabel,
                              radius: 44,
                            ),
                          if (expense > 0)
                            PieChartSectionData(
                              value: expense.toDouble(),
                              color: MofoColors.of(context).danger,
                              title: l10n.outLabel,
                              radius: 44,
                            ),
                          if (income == 0 && expense == 0)
                            PieChartSectionData(
                              value: 1,
                              color: MofoColors.of(context).border,
                              title: '',
                              radius: 44,
                            ),
                        ],
                      ),
                    ),
                  ),
                  TextField(
                    controller: _category,
                    decoration: InputDecoration(labelText: l10n.category),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _amount,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: l10n.amountCurrencyMajor(c),
                    ),
                  ),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(_isIncome ? l10n.income : l10n.expense),
                    value: _isIncome,
                    onChanged: (v) => setState(() => _isIncome = v),
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      final major = double.tryParse(_amount.text) ?? 0;
                      if (_category.text.isEmpty || major <= 0) return;
                      await ref
                          .read(budgetRepositoryProvider)
                          .addItem(
                            category: _category.text.trim(),
                            amountMinor: (major * 100).round(),
                            isIncome: _isIncome,
                          );
                      _category.clear();
                      _amount.clear();
                      setState(() {});
                    },
                    child: Text(l10n.addItem),
                  ),
                  ...items
                      .take(6)
                      .map(
                        (i) => ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: Text(i.category),
                          trailing: Text(
                            formatMinor(i.amountMinor, c),
                            style: TextStyle(
                              color: i.isIncome
                                  ? MofoColors.of(context).success
                                  : MofoColors.of(context).danger,
                            ),
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
      },
    );
  }
}
