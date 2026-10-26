import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mofobank/core/money/format.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:mofobank/data/repositories/providers.dart';
import 'package:mofobank/domain/deposits/deposit_products.dart';
import 'package:mofobank/features/shared/widgets/mofo_scaffold.dart';
import 'package:mofobank/features/shared/widgets/section_header.dart';
import 'package:mofobank/l10n/l10n_ext.dart';

class AccountsHubScreen extends ConsumerWidget {
  const AccountsHubScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final async = ref.watch(bankSnapshotProvider);
    return MofoScaffold(
      title: l10n.accountsTitle,
      actions: [
        IconButton(
          icon: const Icon(Icons.settings_outlined),
          onPressed: () => context.push('/settings'),
        ),
      ],
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(localizedError(context.l10n, e))),
        data: (snap) {
          if (snap == null) {
            return const SizedBox.shrink();
          }
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              SectionHeader(l10n.yourPots, subtitle: l10n.yourPotsSubtitle),
              ...snap.accounts.map((a) {
                return Card(
                  child: ListTile(
                    title: Text(localizedAccountName(l10n, a.name)),
                    subtitle: Text('${a.kind} · ${a.currencyCode}'),
                    trailing: Text(
                      formatMinor(a.balanceMinor, a.currencyCode),
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 16),
              SectionHeader(l10n.cards),
              ...snap.cards.map((c) {
                final acct = snap.accounts.firstWhere(
                  (a) => a.id == c.accountId,
                );
                return Card(
                  child: ListTile(
                    leading: Icon(
                      c.frozen ? Icons.ac_unit : Icons.credit_card,
                      color: c.frozen
                          ? MofoColors.of(context).danger
                          : MofoColors.of(context).accent,
                    ),
                    title: Text(localizedAccountName(l10n, c.label)),
                    subtitle: Text('•••• ${c.lastFour}'),
                    trailing: Text(
                      formatMinor(acct.balanceMinor, acct.currencyCode),
                    ),
                    onTap: () => context.push('/banking/card/${c.id}'),
                  ),
                );
              }),
              OutlinedButton.icon(
                onPressed: () async {
                  final label = await _prompt(
                    context,
                    l10n.cardLabel,
                    l10n.virtualDebit,
                  );
                  if (label == null || label.isEmpty) {
                    return;
                  }
                  // Default suggestion is a stable key; custom text stays as-is.
                  final stored = label == l10n.virtualDebit
                      ? 'l10n:virtualDebit'
                      : label;
                  await ref
                      .read(bankRepositoryProvider)
                      .createCard(label: stored);
                  ref.invalidate(bankSnapshotProvider);
                },
                icon: const Icon(Icons.add),
                label: Text(l10n.issueNewCard),
              ),
              const SizedBox(height: 16),
              SectionHeader(l10n.deposits),
              ...snap.deposits.map((d) {
                final product = DepositCatalog.byId(d.productId);
                final acct = snap.accounts.firstWhere(
                  (a) => a.id == d.accountId,
                );
                return Card(
                  child: ListTile(
                    title: Text(localizedDeposit(l10n, product.id).$1),
                    subtitle: Text(localizedDepositRate(l10n, product)),
                    trailing: Text(
                      formatMinor(acct.balanceMinor, acct.currencyCode),
                    ),
                  ),
                );
              }),
              OutlinedButton.icon(
                onPressed: () => context.push('/banking/open-deposit'),
                icon: const Icon(Icons.savings_outlined),
                label: Text(l10n.openDeposit),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => context.push('/banking/transfer'),
                icon: const Icon(Icons.swap_horiz),
                label: Text(l10n.transferMoney),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<String?> _prompt(
    BuildContext context,
    String title,
    String initial,
  ) async {
    final l10n = context.l10n;
    final ctrl = TextEditingController(text: initial);
    return showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: TextField(controller: ctrl, autofocus: true),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, ctrl.text.trim()),
            child: Text(l10n.create),
          ),
        ],
      ),
    );
  }
}
