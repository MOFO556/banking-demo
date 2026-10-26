import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:mofobank/data/api/card_vault_api.dart';
import 'package:mofobank/data/repositories/providers.dart';
import 'package:mofobank/domain/missions/mission_def.dart';
import 'package:mofobank/domain/missions/quiz_models.dart';
import 'package:mofobank/l10n/quiz_l10n.dart';
import 'package:mofobank/features/cards/bank_card_flip.dart';
import 'package:mofobank/features/shared/mission_progress_ui.dart';
import 'package:mofobank/features/shared/widgets/mission_complete_sheet.dart';
import 'package:mofobank/features/shared/widgets/mission_quiz_panel.dart';
import 'package:mofobank/features/shared/widgets/mission_scaffold.dart';
import 'package:mofobank/features/shared/widgets/section_header.dart';
import 'package:mofobank/l10n/l10n_ext.dart';

class CardsMissionScreen extends ConsumerStatefulWidget {
  const CardsMissionScreen({super.key});

  @override
  ConsumerState<CardsMissionScreen> createState() => _CardsMissionScreenState();
}

class _CardsMissionScreenState extends ConsumerState<CardsMissionScreen> {
  late MissionQuizBank _bank;
  late List<int?> _answers;
  bool _quizInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_quizInitialized) {
      _bank = localizedQuizBank(context.l10n, MissionId.cards);
      _answers = List<int?>.filled(_bank.length, null, growable: false);
      _quizInitialized = true;
    }
  }

  int _qIndex = 0;
  int? _hintedIndex;
  CardSensitiveDetails? _secrets;
  bool _loadingSecrets = false;
  String? _loadedToken;

  bool get _quizComplete => _answers.every((a) => a != null);

  Future<void> _ensureSecrets(String token) async {
    if (_loadedToken == token && _secrets != null) {
      return;
    }
    setState(() => _loadingSecrets = true);
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
    } finally {
      if (mounted) {
        setState(() => _loadingSecrets = false);
      }
    }
  }

  Future<void> _useHint() async {
    final ok = await ref.read(bankRepositoryProvider).consumeHint();
    if (!ok) {
      return;
    }
    ref.invalidate(bankSnapshotProvider);
    setState(() => _hintedIndex = _bank.questions[_qIndex].correctIndex);
  }

  Future<void> _useRetry() async {
    final ok = await ref.read(bankRepositoryProvider).consumeRetry();
    if (!ok) {
      return;
    }
    ref.invalidate(bankSnapshotProvider);
    setState(() {
      for (var i = 0; i < _answers.length; i++) {
        _answers[i] = null;
      }
      _qIndex = 0;
      _hintedIndex = null;
    });
    if (mounted) {
      context.go('/home');
    }
  }

  Future<void> _finish(String missionCardsTitle) async {
    var score = _bank.scoreRatio(_answers) * 0.75;
    if (_secrets != null) {
      score += 0.25;
    }

    final settlement = await ref
        .read(bankRepositoryProvider)
        .completeMission(
          missionId: MissionId.cards,
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
      missionTitle: missionCardsTitle,
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
        title: l10n.cards,
        body: Center(child: CircularProgressIndicator()),
        bottomBar: SizedBox.shrink(),
      ),
      error: (e, _) => MissionScaffold(
        title: l10n.cards,
        body: Center(child: Text(localizedError(context.l10n, e))),
        bottomBar: const SizedBox.shrink(),
      ),
      data: (snap) {
        if (snap == null) {
          return MissionScaffold(
            title: l10n.cards,
            body: SizedBox.shrink(),
            bottomBar: SizedBox.shrink(),
          );
        }
        final card = snap.cards.isNotEmpty ? snap.cards.first : null;
        if (card != null && _loadedToken != card.token) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              _ensureSecrets(card.token);
            }
          });
        }

        final completed = missionIsCompleted(snap, MissionId.cards);
        return MissionScaffold(
          title: l10n.cards,
          statusSlot: Text(
            completed
                ? l10n.missionCompletedHint
                : card == null
                ? l10n.openAccountsFirst
                : (_loadingSecrets
                      ? l10n.loadingYourCard
                      : l10n.exploreCardChallenge),
            style: TextStyle(
              color: completed
                  ? MofoColors.of(context).success
                  : MofoColors.of(context).textSecondary,
              fontSize: 13,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          bottomBar: ElevatedButton(
            onPressed: _quizComplete && card != null
                ? () => _finish(l10n.missionCardsTitle)
                : null,
            child: Text(missionFinishLabel(l10n, completed: completed)),
          ),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            children: [
              SectionHeader(
                l10n.yourDebitCard,
                subtitle: l10n.yourDebitCardSubtitle,
              ),
              if (card != null) ...[
                if (_loadingSecrets && _secrets == null)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Center(child: CircularProgressIndicator()),
                  )
                else
                  BankCardFlip(
                    holderName: snap.profile.displayName,
                    maskedPan: '•••• •••• •••• ${card.lastFour}',
                    fullPan: _secrets?.pan ?? '••••••••••••${card.lastFour}',
                    expiry: _secrets?.expiryMmYy ?? '••/••',
                    cvv: _secrets?.cvv ?? '•••',
                    frozen: card.frozen,
                    currencyCode: snap.account.currencyCode,
                    maxWidth: 320,
                    revealEnabled: _secrets != null,
                  ),
              ],
              const SizedBox(height: 16),
              MissionQuizPanel(
                bank: _bank,
                answers: _answers,
                currentIndex: _qIndex,
                hintedIndex: _hintedIndex,
                hintsLeft: snap.profile.hintsOwned,
                retriesLeft: snap.profile.retriesOwned,
                onUseHint: _useHint,
                onUseRetry: _useRetry,
                onSelect: (i) => setState(() {
                  _answers[_qIndex] = i;
                  _hintedIndex = null;
                }),
                onPrev: () => setState(() {
                  _qIndex--;
                  _hintedIndex = null;
                }),
                onNext: () => setState(() {
                  _qIndex++;
                  _hintedIndex = null;
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
