import 'package:flutter/material.dart';
import 'package:mofobank/l10n/l10n_ext.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:mofobank/data/api/card_vault_api.dart';
import 'package:mofobank/data/repositories/providers.dart';
import 'package:mofobank/features/cards/bank_card_flip.dart';
import 'package:mofobank/features/shared/widgets/mission_scaffold.dart';
import 'package:mofobank/features/shared/widgets/section_header.dart';

class CardDetailScreen extends ConsumerStatefulWidget {
  const CardDetailScreen({super.key, required this.cardId});

  final String cardId;

  @override
  ConsumerState<CardDetailScreen> createState() => _CardDetailScreenState();
}

class _CardDetailScreenState extends ConsumerState<CardDetailScreen> {
  CardSensitiveDetails? _secrets;
  bool _loading = true;
  String? _error;
  String? _loadedToken;

  Future<void> _loadSecrets(String token) async {
    if (_loadedToken == token && _secrets != null) {
      return;
    }
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final details = await ref
          .read(cardVaultApiProvider)
          .fetchSensitiveDetails(token);
      if (!mounted) {
        return;
      }
      setState(() {
        _secrets = details;
        _loadedToken = token;
      });
    } catch (e) {
      if (!mounted) {
        return;
      }
      setState(() => _error = context.l10n.couldNotLoadCard);
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final snap = ref.watch(bankSnapshotProvider).valueOrNull;
    final card = snap?.cards.where((c) => c.id == widget.cardId).firstOrNull;
    final currency = snap?.account.currencyCode ?? 'USD';

    if (card == null) {
      return MissionScaffold(
        title: l10n.card,
        body: Center(child: Text(l10n.cardNotFound)),
        bottomBar: SizedBox.shrink(),
      );
    }

    if (_loadedToken != card.token) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _loadSecrets(card.token);
        }
      });
    }

    return MissionScaffold(
      title: localizedAccountName(l10n, card.label),
      statusSlot: Text(
        _error ??
            (_loading
                ? l10n.loadingCardDetails
                : (card.frozen ? l10n.cardFrozen : '')),
        style: TextStyle(
          color: _error != null
              ? MofoColors.of(context).danger
              : MofoColors.of(context).textSecondary,
          fontSize: 12,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      bottomBar: ElevatedButton(
        onPressed: () async {
          await ref
              .read(bankRepositoryProvider)
              .freezeCard(cardId: card.id, frozen: !card.frozen);
          ref.invalidate(bankSnapshotProvider);
        },
        child: Text(card.frozen ? l10n.unfreezeCard : l10n.freezeCard),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
        children: [
          SectionHeader(l10n.yourCard, subtitle: l10n.yourCardSubtitle),
          if (_loading && _secrets == null)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 48),
              child: Center(child: CircularProgressIndicator()),
            )
          else
            BankCardFlip(
              holderName: snap?.profile.displayName ?? l10n.learnerDefault,
              maskedPan: '•••• •••• •••• ${card.lastFour}',
              fullPan: _secrets?.pan ?? '••••••••••••${card.lastFour}',
              expiry: _secrets?.expiryMmYy ?? '••/••',
              cvv: _secrets?.cvv ?? '•••',
              frozen: card.frozen,
              currencyCode: currency,
              maxWidth: 320,
              revealEnabled: _secrets != null,
            ),
        ],
      ),
    );
  }
}
