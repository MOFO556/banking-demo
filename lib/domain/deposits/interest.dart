/// Deposit interest helpers (simple annual model).
class InterestBreakdown {
  const InterestBreakdown({
    required this.principalMinor,
    required this.grossInterestMinor,
    required this.taxMinor,
    required this.netInterestMinor,
    required this.apy,
    required this.taxRate,
  });

  final int principalMinor;
  final int grossInterestMinor;
  final int taxMinor;
  final int netInterestMinor;
  final double apy;
  final double taxRate;
}

InterestBreakdown computeAnnualInterest({
  required int principalMinor,
  required double apy,
  required double withholdingTaxRate,
}) {
  final gross = (principalMinor * apy).round();
  final tax = (gross * withholdingTaxRate).round();
  final net = gross - tax;
  return InterestBreakdown(
    principalMinor: principalMinor,
    grossInterestMinor: gross,
    taxMinor: tax,
    netInterestMinor: net,
    apy: apy,
    taxRate: withholdingTaxRate,
  );
}
