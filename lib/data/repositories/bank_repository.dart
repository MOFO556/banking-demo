import 'dart:math';

import 'package:drift/drift.dart';
import 'package:mofobank/data/db/app_database.dart';
import 'package:mofobank/domain/boosts/boost_catalog.dart';
import 'package:mofobank/domain/deposits/deposit_products.dart';
import 'package:mofobank/domain/ledger/ledger_models.dart' as domain;
import 'package:mofobank/domain/ledger/settlement.dart';
import 'package:mofobank/domain/markets/market.dart';
import 'package:mofobank/domain/missions/mission_def.dart';
import 'package:mofobank/domain/rpg/leveling.dart';
import 'package:uuid/uuid.dart';
import 'package:mofobank/core/errors/app_failure.dart';

class BankSnapshot {
  const BankSnapshot({
    required this.profile,
    required this.account,
    required this.accounts,
    required this.cards,
    required this.deposits,
    required this.directory,
    required this.entries,
    required this.missionProgress,
    required this.market,
    required this.level,
    required this.efficiencyScore,
  });

  final Profile profile;

  /// Primary wallet (ownerHandle == null, kind == wallet).
  final Account account;
  final List<Account> accounts;
  final List<BankCard> cards;
  final List<DepositAccount> deposits;
  final List<DirectoryUser> directory;
  final List<LedgerEntry> entries;
  final List<MissionProgressData> missionProgress;
  final Market market;
  final int level;
  final double efficiencyScore;
}

class BankRepository {
  BankRepository(this._db);

  final AppDatabase _db;
  final _uuid = const Uuid();
  final _rng = Random();

  static const walletAccountId = 'wallet_main';

  Stream<BankSnapshot?> watchSnapshot() async* {
    yield await loadSnapshot();
    await for (final _ in _db.select(_db.accounts).watch()) {
      yield await loadSnapshot();
    }
  }

  Future<BankSnapshot?> loadSnapshot() async {
    final profile = await (_db.select(
      _db.profiles,
    )..limit(1)).getSingleOrNull();
    if (profile == null || !profile.onboarded) return null;

    await accrueAllDeposits();

    return _db.transaction(() async {
      final accounts = await (_db.select(
        _db.accounts,
      )..where((t) => t.ownerHandle.isNull())).get();
      final wallet = accounts.firstWhere(
        (a) => a.id == walletAccountId,
        orElse: () => accounts.first,
      );
      final cards = await _db.select(_db.bankCards).get();
      final deposits = await _db.select(_db.depositAccounts).get();
      final directory = await _db.select(_db.directoryUsers).get();
      final entries =
          await (_db.select(_db.ledgerEntries)
                ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
                ..limit(80))
              .get();
      final progress = await _db.select(_db.missionProgress).get();
      final market = MarketsCatalog.byId(profile.homeMarketId);
      final level = Leveling.levelForXp(profile.xp);
      final avgAccuracy = profile.accuracyCount == 0
          ? 0.0
          : profile.accuracySum / profile.accuracyCount;
      final efficiency = computeEfficiencyScore(
        totalXp: profile.xp,
        averageAccuracy: avgAccuracy,
        boostSpendMinor: profile.boostSpendMinor,
        minorUnitsPerEuroLike: BoostCatalog.costMinor(wallet.currencyCode, 1),
      );

      return BankSnapshot(
        profile: profile,
        account: wallet,
        accounts: accounts,
        cards: cards,
        deposits: deposits,
        directory: directory,
        entries: entries,
        missionProgress: progress,
        market: market,
        level: level,
        efficiencyScore: efficiency,
      );
    });
  }

  Future<bool> isOnboarded() async {
    final profile = await (_db.select(
      _db.profiles,
    )..limit(1)).getSingleOrNull();
    return profile?.onboarded ?? false;
  }

  Future<void> resetAllData() async {
    await _db.transaction(() async {
      await _db.delete(_db.profiles).go();
      await _db.delete(_db.accounts).go();
      await _db.delete(_db.bankCards).go();
      await _db.delete(_db.cardVaultSecrets).go();
      await _db.delete(_db.depositAccounts).go();
      await _db.delete(_db.directoryUsers).go();
      await _db.delete(_db.ledgerEntries).go();
      await _db.delete(_db.missionProgress).go();
      await _db.delete(_db.budgetItems).go();
      await _db.delete(_db.savingsGoals).go();
      await _db.delete(_db.fxCache).go();
    });
  }

  Future<void> completeOnboarding({
    required String marketId,
    required String displayName,
    required String handle,
  }) async {
    final market = MarketsCatalog.byId(marketId);
    final startingBalance = _startingBalance(market.currencyCode);
    final cleanHandle = _normalizeHandle(handle);

    await resetAllData();

    await _db.transaction(() async {
      await _db
          .into(_db.profiles)
          .insert(
            ProfilesCompanion.insert(
              homeMarketId: marketId,
              displayName: Value(displayName),
              handle: Value(cleanHandle),
              onboarded: const Value(true),
              xp: const Value(0),
            ),
          );

      await _db
          .into(_db.accounts)
          .insert(
            AccountsCompanion.insert(
              id: walletAccountId,
              name: 'l10n:mainWallet',
              currencyCode: market.currencyCode,
              balanceMinor: Value(startingBalance),
              kind: const Value('wallet'),
            ),
          );

      await _issueCard(
        label: 'l10n:debitPrimary',
        currencyCode: market.currencyCode,
      );

      await _postLedger(
        accountId: walletAccountId,
        amountMinor: startingBalance,
        currencyCode: market.currencyCode,
        type: domain.LedgerEntryType.stipend,
        description: 'l10n:welcome',
        idempotencyKey: 'welcome_$marketId',
      );

      await _seedDirectory(market.currencyCode);

      for (final m in Curriculum.missions) {
        await _db
            .into(_db.missionProgress)
            .insert(
              MissionProgressCompanion.insert(
                missionId: m.id.name,
                unlocked: Value(m.order == 0),
                completed: const Value(false),
              ),
            );
      }
    });
  }

  Future<void> setBiometricsEnabled(bool enabled) async {
    final profile = await (_db.select(_db.profiles)..limit(1)).getSingle();
    await (_db.update(_db.profiles)..where((t) => t.id.equals(profile.id)))
        .write(ProfilesCompanion(biometricsEnabled: Value(enabled)));
  }

  Future<BankCard> createCard({required String label}) async {
    final snap = await loadSnapshot();
    if (snap == null) throw const AppFailure(AppFailureCode.notOnboarded);
    return _issueCard(label: label, currencyCode: snap.account.currencyCode);
  }

  Future<void> freezeCard({
    required String cardId,
    required bool frozen,
  }) async {
    await (_db.update(_db.bankCards)..where((t) => t.id.equals(cardId))).write(
      BankCardsCompanion(frozen: Value(frozen)),
    );
  }

  Future<DepositAccount> openDeposit({
    required String productId,
    required int principalMinor,
    required String fromAccountId,
  }) async {
    final snap = await loadSnapshot();
    if (snap == null) throw const AppFailure(AppFailureCode.notOnboarded);
    DepositCatalog.byId(productId); // validates product exists
    if (principalMinor <= 0) {
      throw const AppFailure(AppFailureCode.principalMustBePositive);
    }

    final from = snap.accounts.firstWhere((a) => a.id == fromAccountId);
    if (from.balanceMinor < principalMinor) {
      throw const AppFailure(AppFailureCode.insufficientFunds);
    }

    final depositAccountId = 'dep_${_uuid.v4().substring(0, 8)}';
    final depositId = _uuid.v4();

    await _db.transaction(() async {
      await _applyDelta(
        accountId: fromAccountId,
        deltaMinor: -principalMinor,
        currencyCode: from.currencyCode,
        type: domain.LedgerEntryType.other,
        description: 'l10n:openDeposit|$productId',
      );

      await _db
          .into(_db.accounts)
          .insert(
            AccountsCompanion.insert(
              id: depositAccountId,
              name: 'l10n:deposit|$productId',
              currencyCode: from.currencyCode,
              balanceMinor: Value(principalMinor),
              kind: const Value('deposit'),
            ),
          );

      await _db
          .into(_db.depositAccounts)
          .insert(
            DepositAccountsCompanion.insert(
              id: depositId,
              accountId: depositAccountId,
              productId: productId,
            ),
          );

      await _postLedger(
        accountId: depositAccountId,
        amountMinor: principalMinor,
        currencyCode: from.currencyCode,
        type: domain.LedgerEntryType.other,
        description: 'l10n:depositOpened',
      );
    });

    return (await (_db.select(
      _db.depositAccounts,
    )..where((t) => t.id.equals(depositId))).getSingle());
  }

  Future<void> accrueAllDeposits() async {
    final rows = await _db.select(_db.depositAccounts).get();
    final now = DateTime.now();
    for (final dep in rows) {
      final product = DepositCatalog.byId(dep.productId);
      final acct = await (_db.select(
        _db.accounts,
      )..where((t) => t.id.equals(dep.accountId))).getSingle();
      final interest = DepositCatalog.accrueMinor(
        principalMinor: acct.balanceMinor,
        product: product,
        lastAccrual: dep.lastAccrualAt,
        now: now,
      );
      if (interest <= 0) {
        continue;
      }
      await _db.transaction(() async {
        await (_db.update(
          _db.accounts,
        )..where((t) => t.id.equals(acct.id))).write(
          AccountsCompanion(balanceMinor: Value(acct.balanceMinor + interest)),
        );
        await (_db.update(_db.depositAccounts)
              ..where((t) => t.id.equals(dep.id)))
            .write(DepositAccountsCompanion(lastAccrualAt: Value(now)));
        await _postLedger(
          accountId: acct.id,
          amountMinor: interest,
          currencyCode: acct.currencyCode,
          type: domain.LedgerEntryType.depositInterest,
          description: 'l10n:accrued|${dep.productId}',
          idempotencyKey:
              'accrual_${dep.id}_${now.millisecondsSinceEpoch ~/ 60000}',
        );
      });
    }
  }

  Future<void> transfer({
    required String fromAccountId,
    required String toAccountId,
    required int amountMinor,
    String? note,
  }) async {
    if (amountMinor <= 0)
      throw const AppFailure(AppFailureCode.amountMustBePositive);
    if (fromAccountId == toAccountId) {
      throw const AppFailure(AppFailureCode.chooseDifferentAccounts);
    }

    final from = await (_db.select(
      _db.accounts,
    )..where((t) => t.id.equals(fromAccountId))).getSingle();
    final to = await (_db.select(
      _db.accounts,
    )..where((t) => t.id.equals(toAccountId))).getSingle();
    if (from.currencyCode != to.currencyCode) {
      throw const AppFailure(AppFailureCode.crossCurrencyUnsupported);
    }
    if (from.balanceMinor < amountMinor) {
      throw const AppFailure(AppFailureCode.insufficientFunds);
    }

    // Frozen card check
    final fromCard = await (_db.select(
      _db.bankCards,
    )..where((t) => t.accountId.equals(fromAccountId))).getSingleOrNull();
    if (fromCard?.frozen == true) {
      throw const AppFailure(AppFailureCode.sourceCardFrozen);
    }

    await _db.transaction(() async {
      await _applyDelta(
        accountId: fromAccountId,
        deltaMinor: -amountMinor,
        currencyCode: from.currencyCode,
        type: domain.LedgerEntryType.transferOut,
        description: note ?? 'l10n:transferOut',
        counterparty: toAccountId,
      );
      await _applyDelta(
        accountId: toAccountId,
        deltaMinor: amountMinor,
        currencyCode: to.currencyCode,
        type: domain.LedgerEntryType.transferIn,
        description: note ?? 'l10n:transferIn',
        counterparty: fromAccountId,
      );
    });
  }

  Future<void> transferToHandle({
    required String fromAccountId,
    required String toHandle,
    required int amountMinor,
  }) async {
    final peer =
        await (_db.select(_db.directoryUsers)
              ..where((t) => t.handle.equals(_normalizeHandle(toHandle))))
            .getSingleOrNull();
    if (peer == null) {
      throw AppFailure(AppFailureCode.userNotFound, toHandle);
    }
    await transfer(
      fromAccountId: fromAccountId,
      toAccountId: peer.accountId,
      amountMinor: amountMinor,
      note: 'l10n:p2p|$toHandle',
    );
  }

  Future<domain.SettlementResult> completeMission({
    required MissionId missionId,
    required double performanceRatio,
  }) async {
    final snap = await loadSnapshot();
    if (snap == null) throw const AppFailure(AppFailureCode.notOnboarded);
    final def = Curriculum.byId(missionId);
    final alreadyDone = snap.missionProgress.any(
      (p) => p.missionId == missionId.name && p.completed,
    );
    final fullStake = Leveling.stakeForMission(
      baseStakeMajor: def.baseStakeMajor,
      level: snap.level,
      decimals: 2,
    );
    final stake = alreadyDone ? replayStakeMinor(fullStake) : fullStake;
    final raw = settleLessonStake(
      stakeMinor: stake,
      performanceRatio: performanceRatio,
      baseXp: alreadyDone ? 0 : def.xpReward,
    );
    final settlement = domain.SettlementResult(
      stakeMinor: raw.stakeMinor,
      paidMinor: raw.paidMinor,
      performanceRatio: raw.performanceRatio,
      xpAwarded: raw.xpAwarded,
      isReplay: alreadyDone,
    );
    final oldLevel = snap.level;

    await _db.transaction(() async {
      final descKey = alreadyDone ? 'missionReplay' : 'missionSettle';
      await _applyDelta(
        accountId: walletAccountId,
        deltaMinor: settlement.paidMinor,
        currencyCode: snap.account.currencyCode,
        type: domain.LedgerEntryType.missionSettle,
        description:
            'l10n:$descKey|${missionId.name}|${(performanceRatio * 100).toStringAsFixed(0)}',
      );

      if (!alreadyDone) {
        final newXp = snap.profile.xp + settlement.xpAwarded;
        await (_db.update(
          _db.profiles,
        )..where((t) => t.id.equals(snap.profile.id))).write(
          ProfilesCompanion(
            xp: Value(newXp),
            accuracySum: Value(snap.profile.accuracySum + performanceRatio),
            accuracyCount: Value(snap.profile.accuracyCount + 1),
          ),
        );

        final next = Curriculum.missions.where((m) => m.order == def.order + 1);
        if (next.isNotEmpty) {
          await (_db.update(_db.missionProgress)
                ..where((t) => t.missionId.equals(next.first.id.name)))
              .write(const MissionProgressCompanion(unlocked: Value(true)));
        }

        final newLevel = Leveling.levelForXp(newXp);
        if (newLevel > oldLevel) {
          final stipend = Leveling.stipendForLevel(
            newLevel,
            baseStipendMinor: _baseStipend(snap.account.currencyCode),
          );
          await _applyDelta(
            accountId: walletAccountId,
            deltaMinor: stipend,
            currencyCode: snap.account.currencyCode,
            type: domain.LedgerEntryType.stipend,
            description: 'l10n:levelStipend|$newLevel',
            idempotencyKey: 'stipend_level_$newLevel',
          );
        }
      }

      final prevBest = await _bestPerf(missionId);
      await (_db.update(
        _db.missionProgress,
      )..where((t) => t.missionId.equals(missionId.name))).write(
        MissionProgressCompanion(
          completed: const Value(true),
          bestPerformance: Value(
            performanceRatio > prevBest ? performanceRatio : prevBest,
          ),
          completedAt: Value(DateTime.now()),
        ),
      );
    });

    return settlement;
  }

  Future<void> purchaseBoost(BoostId boostId) async {
    final snap = await loadSnapshot();
    if (snap == null) throw const AppFailure(AppFailureCode.notOnboarded);
    final offer = BoostCatalog.offers.firstWhere((o) => o.id == boostId);
    final cost = BoostCatalog.costMinor(
      snap.account.currencyCode,
      offer.euroLikeCost,
    );
    if (snap.account.balanceMinor < cost) {
      throw const AppFailure(AppFailureCode.insufficientFundsBoost);
    }

    await _db.transaction(() async {
      await _applyDelta(
        accountId: walletAccountId,
        deltaMinor: -cost,
        currencyCode: snap.account.currencyCode,
        type: domain.LedgerEntryType.boostPurchase,
        description: 'l10n:boost|${boostId.name}',
      );

      final p = snap.profile;
      final patch = switch (boostId) {
        BoostId.hintPack => ProfilesCompanion(
          hintsOwned: Value(p.hintsOwned + 3),
          boostSpendMinor: Value(p.boostSpendMinor + cost),
        ),
        BoostId.quizRetry => ProfilesCompanion(
          retriesOwned: Value(p.retriesOwned + 1),
          boostSpendMinor: Value(p.boostSpendMinor + cost),
        ),
        BoostId.themeBadge => ProfilesCompanion(
          themeBadge: const Value(true),
          boostSpendMinor: Value(p.boostSpendMinor + cost),
        ),
      };
      await (_db.update(
        _db.profiles,
      )..where((t) => t.id.equals(p.id))).write(patch);
    });
  }

  Future<bool> consumeHint() async {
    final profile = await (_db.select(_db.profiles)..limit(1)).getSingle();
    if (profile.hintsOwned <= 0) return false;
    await (_db.update(_db.profiles)..where((t) => t.id.equals(profile.id)))
        .write(ProfilesCompanion(hintsOwned: Value(profile.hintsOwned - 1)));
    return true;
  }

  Future<bool> consumeRetry() async {
    final profile = await (_db.select(_db.profiles)..limit(1)).getSingle();
    if (profile.retriesOwned <= 0) return false;
    await (_db.update(
      _db.profiles,
    )..where((t) => t.id.equals(profile.id))).write(
      ProfilesCompanion(retriesOwned: Value(profile.retriesOwned - 1)),
    );
    return true;
  }

  Future<void> applyBalanceDelta({
    required int deltaMinor,
    required domain.LedgerEntryType type,
    required String description,
    String? counterparty,
    String? idempotencyKey,
    String accountId = walletAccountId,
  }) async {
    final acct = await (_db.select(
      _db.accounts,
    )..where((t) => t.id.equals(accountId))).getSingle();
    final next = acct.balanceMinor + deltaMinor;
    if (next < 0) throw const AppFailure(AppFailureCode.insufficientFunds);
    await _db.transaction(() async {
      await _applyDelta(
        accountId: accountId,
        deltaMinor: deltaMinor,
        currencyCode: acct.currencyCode,
        type: type,
        description: description,
        counterparty: counterparty,
        idempotencyKey: idempotencyKey,
      );
    });
  }

  /// Freezes the first (primary) card - used by security mission.
  Future<void> freezePrimaryCard(bool frozen) async {
    final cards = await _db.select(_db.bankCards).get();
    if (cards.isEmpty) return;
    await freezeCard(cardId: cards.first.id, frozen: frozen);
  }

  /// Imitation of new card creation
  Future<BankCard> _issueCard({
    required String label,
    required String currencyCode,
  }) async {
    final accountId = 'card_${_uuid.v4().substring(0, 8)}';
    final cardId = _uuid.v4();
    final token = 'tok_${_uuid.v4().replaceAll('-', '').substring(0, 16)}';
    final pan = _generatePan();
    final lastFour = pan.substring(pan.length - 4);
    final expiry =
        '${(DateTime.now().month).toString().padLeft(2, '0')}/${(DateTime.now().year + 4) % 100}';
    final cvv = (_rng.nextInt(900) + 100).toString();

    await _db
        .into(_db.accounts)
        .insert(
          AccountsCompanion.insert(
            id: accountId,
            name: label,
            currencyCode: currencyCode,
            balanceMinor: const Value(0),
            kind: const Value('card'),
          ),
        );
    await _db
        .into(_db.bankCards)
        .insert(
          BankCardsCompanion.insert(
            id: cardId,
            accountId: accountId,
            token: token,
            lastFour: lastFour,
            label: label,
          ),
        );
    await _db
        .into(_db.cardVaultSecrets)
        .insert(
          CardVaultSecretsCompanion.insert(
            token: token,
            pan: pan,
            expiryMmYy: expiry,
            cvv: cvv,
          ),
        );
    return (await (_db.select(
      _db.bankCards,
    )..where((t) => t.id.equals(cardId))).getSingle());
  }

  Future<void> _seedDirectory(String currency) async {
    final peers = [
      ('alex', 'Alex Rivera'),
      ('mina', 'Mina Chen'),
      ('samir', 'Samir Q.'),
    ];
    for (final p in peers) {
      final acctId = 'peer_${p.$1}';
      await _db
          .into(_db.accounts)
          .insert(
            AccountsCompanion.insert(
              id: acctId,
              name: '${p.$2} wallet',
              currencyCode: currency,
              balanceMinor: Value(_startingBalance(currency) ~/ 2),
              kind: const Value('wallet'),
              ownerHandle: Value(p.$1),
            ),
          );
      await _db
          .into(_db.directoryUsers)
          .insert(
            DirectoryUsersCompanion.insert(
              handle: p.$1,
              displayName: p.$2,
              accountId: acctId,
            ),
          );
    }
  }

  Future<void> _applyDelta({
    required String accountId,
    required int deltaMinor,
    required String currencyCode,
    required domain.LedgerEntryType type,
    required String description,
    String? counterparty,
    String? idempotencyKey,
  }) async {
    final acct = await (_db.select(
      _db.accounts,
    )..where((t) => t.id.equals(accountId))).getSingle();
    final next = acct.balanceMinor + deltaMinor;
    if (next < 0) {
      throw const AppFailure(AppFailureCode.insufficientFunds);
    }
    await (_db.update(_db.accounts)..where((t) => t.id.equals(accountId)))
        .write(AccountsCompanion(balanceMinor: Value(next)));
    await _postLedger(
      accountId: accountId,
      amountMinor: deltaMinor,
      currencyCode: currencyCode,
      type: type,
      description: description,
      counterparty: counterparty,
      idempotencyKey: idempotencyKey ?? _uuid.v4(),
    );
  }

  Future<double> _bestPerf(MissionId id) async {
    final row = await (_db.select(
      _db.missionProgress,
    )..where((t) => t.missionId.equals(id.name))).getSingleOrNull();
    return row?.bestPerformance ?? 0;
  }

  Future<void> _postLedger({
    required String accountId,
    required int amountMinor,
    required String currencyCode,
    required domain.LedgerEntryType type,
    required String description,
    String? idempotencyKey,
    String? counterparty,
  }) async {
    if (idempotencyKey != null) {
      final existing =
          await (_db.select(_db.ledgerEntries)
                ..where((t) => t.idempotencyKey.equals(idempotencyKey)))
              .getSingleOrNull();
      if (existing != null) {
        return;
      }
    }

    await _db
        .into(_db.ledgerEntries)
        .insert(
          LedgerEntriesCompanion.insert(
            id: _uuid.v4(),
            accountId: accountId,
            amountMinor: amountMinor,
            currencyCode: currencyCode,
            type: type.name,
            description: description,
            idempotencyKey: Value(idempotencyKey),
            counterparty: Value(counterparty),
          ),
        );
  }

  String _normalizeHandle(String raw) =>
      raw.trim().toLowerCase().replaceAll(RegExp(r'[^a-z0-9_]'), '');

  String _generatePan() {
    // Educational demo PAN (not a real issuer number).
    final buf = StringBuffer('4532');
    for (var i = 0; i < 12; i++) {
      buf.write(_rng.nextInt(10));
    }
    return buf.toString();
  }

  int _startingBalance(String currency) {
    return switch (currency) {
      'RUB' => 5000000,
      'UZS' => 150000000,
      'JPY' => 50000,
      'TRY' => 1000000,
      'KZT' => 20000000,
      _ => 50000,
    };
  }

  int _baseStipend(String currency) {
    return switch (currency) {
      'RUB' => 200000,
      'UZS' => 5000000,
      'JPY' => 2000,
      'TRY' => 50000,
      'KZT' => 1000000,
      _ => 2500,
    };
  }
}
