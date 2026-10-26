import 'package:flutter/widgets.dart';
import 'package:mofobank/core/errors/app_failure.dart';
import 'package:mofobank/domain/boosts/boost_catalog.dart';
import 'package:mofobank/domain/deposits/deposit_products.dart';
import 'package:mofobank/domain/missions/mission_def.dart';
import 'package:mofobank/l10n/app_localizations.dart';

extension MofoL10nX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

String localizedError(AppLocalizations l10n, Object error) {
  if (error is AppFailure) {
    return switch (error.code) {
      AppFailureCode.notOnboarded => l10n.errorNotOnboarded,
      AppFailureCode.principalMustBePositive => l10n.errorPrincipalPositive,
      AppFailureCode.amountMustBePositive => l10n.errorAmountPositive,
      AppFailureCode.insufficientFunds => l10n.errorInsufficientFunds,
      AppFailureCode.insufficientFundsBoost => l10n.errorInsufficientFundsBoost,
      AppFailureCode.chooseDifferentAccounts =>
        l10n.errorChooseDifferentAccounts,
      AppFailureCode.crossCurrencyUnsupported => l10n.errorCrossCurrency,
      AppFailureCode.sourceCardFrozen => l10n.errorSourceCardFrozen,
      AppFailureCode.userNotFound => l10n.errorUserNotFound(error.param ?? ''),
      AppFailureCode.cardTokenNotFound => l10n.errorCardTokenNotFound,
      AppFailureCode.invalidDepositProduct => l10n.errorInvalidDepositProduct,
      AppFailureCode.invalidAccountNameKey => l10n.errorInvalidAccountNameKey,
      AppFailureCode.invalidLedgerType => l10n.errorInvalidLedgerType,
      AppFailureCode.invalidLedgerDescription =>
        l10n.errorInvalidLedgerDescription,
      AppFailureCode.invalidAtmPack => l10n.errorInvalidAtmPack,
      AppFailureCode.invalidMoney => l10n.errorCurrencyMismatch,
      _ => l10n.errorUnknown,
    };
  }
  // UI may throw StateError with an already-localized message.
  if (error is StateError) return error.message;
  return l10n.errorUnknown;
}

(String title, String subtitle) localizedMission(
  AppLocalizations l10n,
  MissionId id,
) {
  return switch (id) {
    MissionId.cards => (l10n.missionCardsTitle, l10n.missionCardsSubtitle),
    MissionId.deposits => (
      l10n.missionDepositsTitle,
      l10n.missionDepositsSubtitle,
    ),
    MissionId.fx => (l10n.missionFxTitle, l10n.missionFxSubtitle),
    MissionId.atm => (l10n.missionAtmTitle, l10n.missionAtmSubtitle),
    MissionId.budgeting => (
      l10n.missionBudgetingTitle,
      l10n.missionBudgetingSubtitle,
    ),
    MissionId.transfers => (
      l10n.missionTransfersTitle,
      l10n.missionTransfersSubtitle,
    ),
    MissionId.credit => (l10n.missionCreditTitle, l10n.missionCreditSubtitle),
    MissionId.security => (
      l10n.missionSecurityTitle,
      l10n.missionSecuritySubtitle,
    ),
    MissionId.savingsGoals => (
      l10n.missionSavingsTitle,
      l10n.missionSavingsSubtitle,
    ),
  };
}

String localizedMarketName(AppLocalizations l10n, String marketId) {
  return switch (marketId) {
    'ru' => l10n.marketRu,
    'us' => l10n.marketUs,
    'eu' => l10n.marketEu,
    'uk' => l10n.marketUk,
    'uz' => l10n.marketUz,
    'jp' => l10n.marketJp,
    'tr' => l10n.marketTr,
    'kz' => l10n.marketKz,
    _ => marketId,
  };
}

(String title, String description) localizedBoost(
  AppLocalizations l10n,
  BoostId id,
) {
  return switch (id) {
    BoostId.hintPack => (l10n.boostHintTitle, l10n.boostHintDescription),
    BoostId.quizRetry => (l10n.boostRetryTitle, l10n.boostRetryDescription),
    BoostId.themeBadge => (l10n.boostBadgeTitle, l10n.boostBadgeDescription),
  };
}

(String title, String subtitle) localizedDeposit(
  AppLocalizations l10n,
  String productId,
) {
  return switch (productId) {
    'flex_daily' => (l10n.depositFlexTitle, l10n.depositFlexSubtitle),
    'saver_daily' => (l10n.depositSaverTitle, l10n.depositSaverSubtitle),
    'term_monthly' => (l10n.depositTermTitle, l10n.depositTermSubtitle),
    'premium_monthly' => (
      l10n.depositPremiumTitle,
      l10n.depositPremiumSubtitle,
    ),
    _ => throw const AppFailure(AppFailureCode.invalidDepositProduct),
  };
}

String localizedDepositRate(AppLocalizations l10n, DepositProduct product) {
  final pct = (product.rate * 100).toStringAsFixed(
    product.period == RatePeriod.perDay ? 2 : 1,
  );
  return product.period == RatePeriod.perDay
      ? l10n.ratePerDay(pct)
      : l10n.ratePerMonth(pct);
}

String localizedAccountName(AppLocalizations l10n, String name) {
  if (!name.startsWith('l10n:')) {
    return name;
  }
  final body = name.substring(5);
  final parts = body.split('|');
  return switch (parts.first) {
    'mainWallet' => l10n.accountMainWallet,
    'debitPrimary' => l10n.cardDebitPrimary,
    'virtualDebit' => l10n.virtualDebit,
    'deposit' => localizedDeposit(l10n, parts[1]).$1,
    _ => throw const AppFailure(AppFailureCode.invalidAccountNameKey),
  };
}

String localizedLedgerType(AppLocalizations l10n, String type) {
  return switch (type) {
    'stipend' => l10n.ledgerTypeStipend,
    'missionSettle' => l10n.ledgerTypeMission,
    'transferOut' => l10n.ledgerTypeTransferOut,
    'transferIn' => l10n.ledgerTypeTransferIn,
    'fxConvert' => l10n.ledgerTypeFx,
    'atmWithdraw' => l10n.ledgerTypeAtm,
    'boostPurchase' => l10n.ledgerTypeBoost,
    'goalFund' => l10n.ledgerTypeGoal,
    'depositInterest' => l10n.ledgerTypeDepositInterest,
    'creditCharge' => l10n.ledgerTypeCreditCharge,
    'creditPayment' => l10n.ledgerTypeCreditPayment,
    'other' => l10n.ledgerTypeOther,
    _ => throw const AppFailure(AppFailureCode.invalidLedgerType),
  };
}

String localizedLedgerDescription(AppLocalizations l10n, String raw) {
  if (!raw.startsWith('l10n:')) {
    throw const AppFailure(AppFailureCode.invalidLedgerDescription);
  }
  final parts = raw.substring(5).split('|');
  final key = parts.first;
  final args = parts.skip(1).toList();
  return switch (key) {
    'welcome' => l10n.ledgerWelcome,
    'depositOpened' => l10n.ledgerDepositOpened,
    'transferOut' => l10n.ledgerTransferOut,
    'transferIn' => l10n.ledgerTransferIn,
    'p2pTransfer' => l10n.p2pTransfer,
    'openDeposit' => l10n.ledgerOpenDeposit(localizedDeposit(l10n, args[0]).$1),
    'accrued' => l10n.ledgerAccrued(localizedDeposit(l10n, args[0]).$1),
    'levelStipend' => l10n.ledgerLevelStipend(args[0]),
    'boost' => l10n.ledgerBoost(
      localizedBoost(l10n, BoostId.values.byName(args[0])).$1,
    ),
    'p2p' => l10n.ledgerP2pTo(args[0]),
    'missionSettle' => l10n.ledgerMissionSettle(
      localizedMission(l10n, MissionId.values.byName(args[0])).$1,
      args[1],
    ),
    'missionReplay' => l10n.ledgerMissionReplay(
      localizedMission(l10n, MissionId.values.byName(args[0])).$1,
      args[1],
    ),
    'fx' => l10n.ledgerFxSpread(args[0]),
    'atmCash' => l10n.ledgerAtmCash(_atmPackLabel(l10n, args[0]), args[1]),
    'goalFund' => l10n.ledgerGoalFund(args[0]),
    _ => throw const AppFailure(AppFailureCode.invalidLedgerDescription),
  };
}

String _atmPackLabel(AppLocalizations l10n, String pack) {
  return switch (pack) {
    'largeBills' => l10n.largeBills,
    'fewestNotes' => l10n.fewestNotes,
    'smallChange' => l10n.smallerNotes,
    _ => throw const AppFailure(AppFailureCode.invalidAtmPack),
  };
}
