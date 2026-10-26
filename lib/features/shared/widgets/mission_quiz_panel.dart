import 'package:flutter/material.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:mofobank/domain/missions/quiz_models.dart';
import 'package:mofobank/l10n/l10n_ext.dart';

/// Multi-question quiz
class MissionQuizPanel extends StatelessWidget {
  const MissionQuizPanel({
    super.key,
    required this.bank,
    required this.answers,
    required this.currentIndex,
    required this.onSelect,
    required this.onPrev,
    required this.onNext,
    this.hintedIndex,
    this.onUseHint,
    this.onUseRetry,
    this.hintsLeft = 0,
    this.retriesLeft = 0,
  });

  final MissionQuizBank bank;
  final List<int?> answers;
  final int currentIndex;
  final ValueChanged<int> onSelect;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final int? hintedIndex;
  final VoidCallback? onUseHint;
  final VoidCallback? onUseRetry;
  final int hintsLeft;
  final int retriesLeft;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final q = bank.questions[currentIndex];
    final selected = answers[currentIndex];
    final answeredCount = answers.where((a) => a != null).length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text(
              l10n.challengeProgress(currentIndex, bank.length),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: MofoColors.of(context).accent,
              ),
            ),
            const Spacer(),
            Text(
              l10n.answeredCount(answeredCount),
              style: TextStyle(
                color: MofoColors.of(context).textSecondary,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: (currentIndex + 1) / bank.length,
            minHeight: 6,
            backgroundColor: MofoColors.of(context).surfaceElevated,
            color: MofoColors.of(context).accent,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          q.prompt,
          style: Theme.of(context).textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w600, height: 1.3),
        ),
        const SizedBox(height: 12),
        for (var i = 0; i < q.options.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Material(
              color: hintedIndex == i
                  ? MofoColors.of(context).success.withValues(alpha: 0.25)
                  : selected == i
                  ? MofoColors.of(context).accentDim.withValues(alpha: 0.45)
                  : MofoColors.of(context).surfaceElevated,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => onSelect(i),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        selected == i
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                        size: 20,
                        color: selected == i
                            ? MofoColors.of(context).accent
                            : MofoColors.of(context).textSecondary,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          q.options[i],
                          style: const TextStyle(fontSize: 14, height: 1.3),
                        ),
                      ),
                      if (hintedIndex == i)
                        Icon(
                          Icons.lightbulb,
                          color: MofoColors.of(context).warning,
                          size: 18,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        Row(
          children: [
            TextButton(
              onPressed: currentIndex > 0 ? onPrev : null,
              child: Text(l10n.previous),
            ),
            TextButton(
              onPressed: hintsLeft > 0 ? onUseHint : null,
              child: Text(l10n.hint(hintsLeft)),
            ),
            TextButton(
              onPressed: retriesLeft > 0 ? onUseRetry : null,
              child: Text(l10n.retry(retriesLeft)),
            ),
            const Spacer(),
            TextButton(
              onPressed: currentIndex < bank.length - 1 ? onNext : null,
              child: Text(l10n.next),
            ),
          ],
        ),
      ],
    );
  }
}
