import 'package:flutter_test/flutter_test.dart';
import 'package:mofobank/domain/deposits/interest.dart';

void main() {
  test('net = gross - tax', () {
    final b = computeAnnualInterest(
      principalMinor: 100000,
      apy: 0.10,
      withholdingTaxRate: 0.20,
    );
    expect(b.grossInterestMinor, 10000);
    expect(b.taxMinor, 2000);
    expect(b.netInterestMinor, 8000);
  });
}
