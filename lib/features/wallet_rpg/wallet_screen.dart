import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mofobank/core/money/format.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:mofobank/data/repositories/providers.dart';
import 'package:mofobank/domain/rpg/leveling.dart';
import 'package:mofobank/features/shared/widgets/mofo_scaffold.dart';
import 'package:mofobank/features/shared/widgets/section_header.dart';
import 'package:mofobank/l10n/l10n_ext.dart';

class WalletScreen extends ConsumerWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final async = ref.watch(bankSnapshotProvider);

    return MofoScaffold(
      title: l10n.walletTitle,
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(localizedError(context.l10n, e))),
        data: (snap) {
          if (snap == null) return const SizedBox.shrink();
          final c = snap.account.currencyCode;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeader(l10n.balance, subtitle: l10n.balanceSubtitle),
                    Text(
                      formatMinor(snap.account.balanceMinor, c),
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        _stat(context, l10n.level, '${snap.level}'),
                        _stat(context, l10n.xp, '${snap.profile.xp}'),
                        _stat(
                          context,
                          l10n.next,
                          '${Leveling.xpToNextLevel(snap.profile.xp)} ${l10n.xp}',
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.efficiencyScore(
                        snap.efficiencyScore.toStringAsFixed(1),
                      ),
                      style: TextStyle(
                        color: MofoColors.of(context).textSecondary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SectionHeader(l10n.ledger, subtitle: l10n.ledgerSubtitle),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                  itemCount: snap.entries.length,
                  itemBuilder: (context, index) {
                    final e = snap.entries[index];
                    final positive = e.amountMinor >= 0;
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        localizedLedgerDescription(l10n, e.description),
                      ),
                      subtitle: Text(
                        localizedLedgerType(l10n, e.type),
                        style: TextStyle(
                          color: MofoColors.of(context).textSecondary,
                          fontSize: 12,
                        ),
                      ),
                      trailing: Text(
                        formatMinor(e.amountMinor.abs(), e.currencyCode),
                        style: TextStyle(
                          color: positive
                              ? MofoColors.of(context).success
                              : MofoColors.of(context).danger,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _stat(BuildContext context, String label, String value) {
    final c = MofoColors.of(context);
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: c.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: c.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(color: c.textSecondary, fontSize: 12)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}
