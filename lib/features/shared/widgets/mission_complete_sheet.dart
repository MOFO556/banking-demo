import 'package:flutter/material.dart';
import 'package:mofobank/core/money/format.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:mofobank/domain/ledger/ledger_models.dart';
import 'package:mofobank/l10n/l10n_ext.dart';

Future<void> showMissionCompleteSheet(
  BuildContext context, {
  required SettlementResult settlement,
  required String currencyCode,
  required String missionTitle,
}) {
  final l10n = context.l10n;
  final colors = MofoColors.of(context);
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: colors.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      final c = MofoColors.of(context);
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                settlement.isReplay
                    ? l10n.missionReplaySettled
                    : l10n.missionSettled,
                style: Theme.of(context).textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(missionTitle, style: TextStyle(color: c.textSecondary)),
              if (settlement.isReplay) ...[
                const SizedBox(height: 8),
                Text(
                  l10n.missionCompletedHint,
                  style: TextStyle(color: c.textSecondary, fontSize: 13),
                ),
              ],
              const SizedBox(height: 20),
              _row(
                context,
                l10n.performance,
                '${(settlement.performanceRatio * 100).toStringAsFixed(0)}%',
              ),
              _row(
                context,
                l10n.stake,
                formatMinor(settlement.stakeMinor, currencyCode),
              ),
              _row(
                context,
                l10n.paidToWallet,
                formatMinor(settlement.paidMinor, currencyCode),
                highlight: true,
              ),
              if (!settlement.isReplay)
                _row(context, l10n.xp, '+${settlement.xpAwarded}'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(l10n.continueBtn),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _row(
  BuildContext context,
  String label,
  String value, {
  bool highlight = false,
}) {
  final c = MofoColors.of(context);
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: c.textSecondary)),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: highlight ? c.accent : c.textPrimary,
            fontSize: highlight ? 18 : 16,
          ),
        ),
      ],
    ),
  );
}
