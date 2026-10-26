import 'package:flutter_test/flutter_test.dart';
import 'package:mofobank/domain/deposits/deposit_products.dart';

void main() {
  test('daily accrual scales with days', () {
    final product = DepositCatalog.byId('flex_daily');
    final interest = DepositCatalog.accrueMinor(
      principalMinor: 100000,
      product: product,
      lastAccrual: DateTime(2026, 1, 1),
      now: DateTime(2026, 1, 11),
    );
    // 10 days * 0.0003 * 100000 = 300
    expect(interest, 300);
  });

  test('monthly accrual scales with months', () {
    final product = DepositCatalog.byId('term_monthly');
    final interest = DepositCatalog.accrueMinor(
      principalMinor: 100000,
      product: product,
      lastAccrual: DateTime(2026, 1, 1),
      now: DateTime(2026, 2, 1),
    );
    // ~1 month * 1.5% = 1500
    expect(interest, greaterThan(1400));
    expect(interest, lessThan(1600));
  });
}
