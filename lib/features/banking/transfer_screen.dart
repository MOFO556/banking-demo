import 'package:flutter/material.dart';
import 'package:mofobank/l10n/l10n_ext.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:mofobank/data/db/app_database.dart';
import 'package:mofobank/data/repositories/providers.dart';
import 'package:mofobank/features/shared/widgets/mission_scaffold.dart';
import 'package:mofobank/features/shared/widgets/section_header.dart';

class TransferScreen extends ConsumerStatefulWidget {
  const TransferScreen({super.key});

  @override
  ConsumerState<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends ConsumerState<TransferScreen> {
  String? _fromId;
  String? _toOwnId;
  String? _toHandle;
  final _amount = TextEditingController(text: '25');
  bool _toPeer = false;
  String? _status;

  @override
  void dispose() {
    _amount.dispose();
    super.dispose();
  }

  void _syncSelections(List<Account> own, List<String> handles) {
    if (own.isEmpty) {
      _fromId = null;
      _toOwnId = null;
    } else {
      if (_fromId == null || !own.any((a) => a.id == _fromId)) {
        _fromId = own.first.id;
      }
      final destinations = own.where((a) => a.id != _fromId).toList();
      if (_toOwnId == null ||
          _toOwnId == _fromId ||
          !destinations.any((a) => a.id == _toOwnId)) {
        _toOwnId = destinations.firstOrNull?.id;
      }
    }
    if (handles.isEmpty) {
      _toHandle = null;
    } else if (_toHandle == null || !handles.contains(_toHandle)) {
      _toHandle = handles.first;
    }
  }

  Future<void> _send() async {
    final snap = ref.read(bankSnapshotProvider).valueOrNull;
    if (snap == null || _fromId == null) {
      return;
    }
    final major = double.tryParse(_amount.text) ?? 0;
    final minor = (major * 100).round();
    try {
      if (_toPeer) {
        final handle = _toHandle;
        if (handle == null) {
          throw StateError(context.l10n.pickMofoUser);
        }
        await ref
            .read(bankRepositoryProvider)
            .transferToHandle(
              fromAccountId: _fromId!,
              toHandle: handle,
              amountMinor: minor,
            );
      } else {
        if (_toOwnId == null) {
          throw StateError(context.l10n.pickDestination);
        }
        await ref
            .read(bankRepositoryProvider)
            .transfer(
              fromAccountId: _fromId!,
              toAccountId: _toOwnId!,
              amountMinor: minor,
            );
      }
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
    final own = snap?.accounts ?? const <Account>[];
    final handles =
        snap?.directory.map((d) => d.handle).toList() ?? const <String>[];
    _syncSelections(own, handles);

    final destinations = own.where((a) => a.id != _fromId).toList();

    return MissionScaffold(
      title: l10n.transfer,
      statusSlot: Text(
        _status ?? l10n.transferSubtitle,
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
        onPressed: _send,
        child: Text(l10n.sendTransfer),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
        children: [
          SectionHeader(l10n.from),
          DropdownButtonFormField<String>(
            // ignore: deprecated_member_use
            value: _fromId,
            items: own
                .map(
                  (a) => DropdownMenuItem(
                    value: a.id,
                    child: Text(localizedAccountName(l10n, a.name)),
                  ),
                )
                .toList(),
            onChanged: (v) => setState(() {
              _fromId = v;
              if (_toOwnId == v) {
                _toOwnId = own.where((a) => a.id != v).firstOrNull?.id;
              }
            }),
            decoration: InputDecoration(labelText: l10n.sourceAccount),
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(_toPeer ? l10n.toMofoUser : l10n.betweenMyAccounts),
            value: _toPeer,
            activeThumbColor: MofoColors.of(context).accent,
            onChanged: (v) => setState(() => _toPeer = v),
          ),
          if (_toPeer)
            DropdownButtonFormField<String>(
              // ignore: deprecated_member_use
              value: _toHandle,
              items: (snap?.directory ?? [])
                  .map(
                    (d) => DropdownMenuItem(
                      value: d.handle,
                      child: Text('${d.displayName} (@${d.handle})'),
                    ),
                  )
                  .toList(),
              onChanged: (v) => setState(() => _toHandle = v),
              decoration: InputDecoration(labelText: l10n.recipient),
            )
          else
            DropdownButtonFormField<String>(
              // ignore: deprecated_member_use
              value: destinations.isEmpty ? null : _toOwnId,
              items: destinations
                  .map(
                    (a) => DropdownMenuItem(
                      value: a.id,
                      child: Text(localizedAccountName(l10n, a.name)),
                    ),
                  )
                  .toList(),
              onChanged: destinations.isEmpty
                  ? null
                  : (v) => setState(() => _toOwnId = v),
              decoration: InputDecoration(labelText: l10n.destination),
            ),
          const SizedBox(height: 12),
          TextField(
            controller: _amount,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
            ],
            decoration: InputDecoration(labelText: l10n.amountMajor),
          ),
        ],
      ),
    );
  }
}
