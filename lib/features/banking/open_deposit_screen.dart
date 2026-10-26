import 'package:flutter/material.dart';
import 'package:mofobank/l10n/l10n_ext.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:mofobank/data/repositories/providers.dart';
import 'package:mofobank/domain/deposits/deposit_products.dart';
import 'package:mofobank/features/shared/widgets/mission_scaffold.dart';
import 'package:mofobank/features/shared/widgets/section_header.dart';

class OpenDepositScreen extends ConsumerStatefulWidget {
  const OpenDepositScreen({super.key});

  @override
  ConsumerState<OpenDepositScreen> createState() => _OpenDepositScreenState();
}

class _OpenDepositScreenState extends ConsumerState<OpenDepositScreen> {
  String _productId = DepositCatalog.products.first.id;
  String? _fromAccountId;
  final _amount = TextEditingController(text: '100');
  String? _status;

  @override
  void dispose() {
    _amount.dispose();
    super.dispose();
  }

  Future<void> _open() async {
    final snap = ref.read(bankSnapshotProvider).valueOrNull;
    if (snap == null) {
      return;
    }
    final from = _fromAccountId ?? snap.account.id;
    final major = double.tryParse(_amount.text) ?? 0;
    final minor = (major * 100).round();
    try {
      await ref
          .read(bankRepositoryProvider)
          .openDeposit(
            productId: _productId,
            principalMinor: minor,
            fromAccountId: from,
          );
      ref.invalidate(bankSnapshotProvider);
      if (mounted) {
        context.pop();
      }
    } catch (e) {
      setState(() => _status = localizedError(context.l10n, e));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final snap = ref.watch(bankSnapshotProvider).valueOrNull;
    final sources =
        snap?.accounts
            .where((a) => a.kind == 'wallet' || a.kind == 'card')
            .toList() ??
        [];
    if (_fromAccountId == null ||
        !sources.any((a) => a.id == _fromAccountId)) {
      _fromAccountId = sources.firstOrNull?.id;
    }

    return MissionScaffold(
      title: l10n.openDeposit,
      statusSlot: Text(
        _status ?? l10n.pickDepositProduct,
        style: TextStyle(
          color: _status != null
              ? MofoColors.of(context).danger
              : MofoColors.of(context).textSecondary,
          fontSize: 13,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      bottomBar: ElevatedButton(
        onPressed: _open,
        child: Text(l10n.openDeposit),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
        children: [
          SectionHeader(l10n.depositProducts),
          ...DepositCatalog.products.map((p) {
            final selected = _productId == p.id;
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Material(
                color: selected
                    ? MofoColors.of(context).accentDim.withValues(alpha: 0.4)
                    : MofoColors.of(context).surface,
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => setState(() => _productId = p.id),
                  child: ListTile(
                    title: Text(localizedDeposit(l10n, p.id).$1),
                    subtitle: Text(
                      '${localizedDeposit(l10n, p.id).$2}\n'
                      '${localizedDepositRate(l10n, p)}',
                    ),
                    isThreeLine: true,
                    trailing: Icon(
                      selected
                          ? Icons.radio_button_checked
                          : Icons.radio_button_off,
                      color: MofoColors.of(context).accent,
                    ),
                  ),
                ),
              ),
            );
          }),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            // ignore: deprecated_member_use
            value: _fromAccountId,
            items: sources
                .map(
                  (a) => DropdownMenuItem(
                    value: a.id,
                    child: Text(localizedAccountName(l10n, a.name)),
                  ),
                )
                .toList(),
            onChanged: (v) => setState(() => _fromAccountId = v),
            decoration: InputDecoration(labelText: l10n.fundFrom),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _amount,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
            ],
            decoration: InputDecoration(labelText: l10n.principalMajor),
          ),
        ],
      ),
    );
  }
}
