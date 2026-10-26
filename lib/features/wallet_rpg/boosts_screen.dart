import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mofobank/core/money/format.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:mofobank/data/repositories/providers.dart';
import 'package:mofobank/domain/boosts/boost_catalog.dart';
import 'package:mofobank/features/shared/widgets/mofo_scaffold.dart';
import 'package:mofobank/features/shared/widgets/section_header.dart';
import 'package:mofobank/l10n/l10n_ext.dart';

class BoostsScreen extends ConsumerWidget {
  const BoostsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final async = ref.watch(bankSnapshotProvider);

    return MofoScaffold(
      title: l10n.boostStore,
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(localizedError(context.l10n, e))),
        data: (snap) {
          if (snap == null) return const SizedBox.shrink();
          final c = snap.account.currencyCode;
          final p = snap.profile;

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              SectionHeader(l10n.inventory, subtitle: l10n.inventorySubtitle),
              Text(
                l10n.inventorySummary(
                  p.hintsOwned,
                  p.retriesOwned,
                  p.themeBadge ? l10n.on : l10n.off,
                ),
                style: TextStyle(color: MofoColors.of(context).textSecondary),
              ),
              Text(
                l10n.walletAmount(formatMinor(snap.account.balanceMinor, c)),
                style: TextStyle(color: MofoColors.of(context).textSecondary),
              ),
              const SizedBox(height: 16),
              SectionHeader(l10n.buy),
              ...BoostCatalog.offers.map((offer) {
                final cost = BoostCatalog.costMinor(c, offer.euroLikeCost);
                final ownedBadge =
                    offer.id == BoostId.themeBadge && p.themeBadge;
                final (title, description) = localizedBoost(l10n, offer.id);
                return Card(
                  child: ListTile(
                    title: Text(title),
                    subtitle: Text(description),
                    trailing: Text(
                      ownedBadge ? l10n.owned : formatMinor(cost, c),
                    ),
                    onTap: ownedBadge
                        ? null
                        : () async {
                            try {
                              await ref
                                  .read(bankRepositoryProvider)
                                  .purchaseBoost(offer.id);
                              ref.invalidate(bankSnapshotProvider);
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(l10n.purchased(title)),
                                  ),
                                );
                              }
                            } catch (e) {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(localizedError(l10n, e)),
                                  ),
                                );
                              }
                            }
                          },
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
