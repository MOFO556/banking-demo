/// Minimum-payment trap simulation.
class CreditSimStep {
  const CreditSimStep({
    required this.month,
    required this.balanceMinor,
    required this.interestMinor,
    required this.paymentMinor,
  });

  final int month;
  final int balanceMinor;
  final int interestMinor;
  final int paymentMinor;
}

class CreditSimResult {
  const CreditSimResult({
    required this.steps,
    required this.monthsToZero,
    required this.totalInterestMinor,
    required this.paidOff,
  });

  final List<CreditSimStep> steps;
  final int monthsToZero;
  final int totalInterestMinor;
  final bool paidOff;
}

/// Simulate paying only minimum % of balance each month (or fixed floor).
CreditSimResult simulateMinPaymentTrap({
  required int startingBalanceMinor,
  required double annualApr,
  required double minPaymentRate,
  required int minPaymentFloorMinor,
  int maxMonths = 120,
}) {
  final monthlyRate = annualApr / 12;
  var balance = startingBalanceMinor;
  var totalInterest = 0;
  final steps = <CreditSimStep>[];

  for (var month = 1; month <= maxMonths && balance > 0; month++) {
    final interest = (balance * monthlyRate).round();
    totalInterest += interest;
    balance += interest;
    var payment = (balance * minPaymentRate).round();
    if (payment < minPaymentFloorMinor) {
      payment = minPaymentFloorMinor;
    }
    if (payment > balance) {
      payment = balance;
    }
    balance -= payment;
    steps.add(
      CreditSimStep(
        month: month,
        balanceMinor: balance,
        interestMinor: interest,
        paymentMinor: payment,
      ),
    );
  }

  return CreditSimResult(
    steps: steps,
    monthsToZero: balance <= 0 ? steps.length : maxMonths,
    totalInterestMinor: totalInterest,
    paidOff: balance <= 0,
  );
}
