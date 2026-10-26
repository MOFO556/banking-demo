enum LedgerEntryType {
  stipend,
  missionSettle,
  transferOut,
  transferIn,
  fxConvert,
  atmWithdraw,
  boostPurchase,
  goalFund,
  depositInterest,
  creditCharge,
  creditPayment,
  other,
}

class LedgerEntry {
  const LedgerEntry({
    required this.id,
    required this.accountId,
    required this.amountMinor,
    required this.currencyCode,
    required this.type,
    required this.description,
    required this.createdAt,
    this.idempotencyKey,
    this.counterparty,
  });

  final String id;
  final String accountId;

  /// Signed: positive = credit (in), negative = debit (out).
  final int amountMinor;
  final String currencyCode;
  final LedgerEntryType type;
  final String description;
  final DateTime createdAt;
  final String? idempotencyKey;
  final String? counterparty;
}

class Account {
  const Account({
    required this.id,
    required this.name,
    required this.currencyCode,
    required this.balanceMinor,
  });

  final String id;
  final String name;
  final String currencyCode;
  final int balanceMinor;
}

/// Settlement outcome for a lesson sandbox stake.
class SettlementResult {
  const SettlementResult({
    required this.stakeMinor,
    required this.paidMinor,
    required this.performanceRatio,
    required this.xpAwarded,
    this.isReplay = false,
  });

  final int stakeMinor;
  final int paidMinor;

  /// 0.0-1.0 performance used to scale stake.
  final double performanceRatio;
  final int xpAwarded;
  final bool isReplay;
}
