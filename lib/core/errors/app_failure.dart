/// Resolve with [localizedError] / ARB keys at the UI boundary.
class AppFailure implements Exception {
  const AppFailure(this.code, [this.param]);

  final String code;
  final String? param;

  @override
  String toString() => param == null ? code : '$code:$param';
}

abstract final class AppFailureCode {
  static const notOnboarded = 'notOnboarded';
  static const principalMustBePositive = 'principalMustBePositive';
  static const amountMustBePositive = 'amountMustBePositive';
  static const insufficientFunds = 'insufficientFunds';
  static const insufficientFundsBoost = 'insufficientFundsBoost';
  static const chooseDifferentAccounts = 'chooseDifferentAccounts';
  static const crossCurrencyUnsupported = 'crossCurrencyUnsupported';
  static const sourceCardFrozen = 'sourceCardFrozen';
  static const userNotFound = 'userNotFound';
  static const cardTokenNotFound = 'cardTokenNotFound';
  static const invalidDepositProduct = 'invalidDepositProduct';
  static const invalidAccountNameKey = 'invalidAccountNameKey';
  static const invalidLedgerType = 'invalidLedgerType';
  static const invalidLedgerDescription = 'invalidLedgerDescription';
  static const invalidAtmPack = 'invalidAtmPack';
  static const invalidMoney = 'invalidMoney';
  static const unknown = 'unknown';
}
