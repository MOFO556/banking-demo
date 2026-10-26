import 'package:flutter_test/flutter_test.dart';
import 'package:mofobank/domain/ledger/settlement.dart';

void main() {
  test('full performance pays full stake', () {
    final r = settleLessonStake(
      stakeMinor: 10000,
      performanceRatio: 1,
      baseXp: 100,
    );
    expect(r.paidMinor, 10000);
    expect(r.xpAwarded, 100);
  });

  test('zero performance pays near-zero', () {
    final r = settleLessonStake(
      stakeMinor: 10000,
      performanceRatio: 0,
      baseXp: 100,
    );
    expect(r.paidMinor, 0);
    expect(r.xpAwarded, 0);
  });

  test('never pays more than stake', () {
    final r = settleLessonStake(
      stakeMinor: 5000,
      performanceRatio: 1.5,
      baseXp: 50,
    );
    expect(r.paidMinor, 5000);
  });

  test('replay stake is half of max', () {
    expect(replayStakeMinor(10000), 5000);
    expect(replayStakeMinor(5001), 2500);
  });

  test('zero baseXp awards no XP', () {
    final r = settleLessonStake(
      stakeMinor: 5000,
      performanceRatio: 1,
      baseXp: 0,
    );
    expect(r.paidMinor, 5000);
    expect(r.xpAwarded, 0);
  });

  test('efficiency score penalizes boost spend', () {
    final high = computeEfficiencyScore(
      totalXp: 100,
      averageAccuracy: 1,
      boostSpendMinor: 0,
      minorUnitsPerEuroLike: 100,
    );
    final low = computeEfficiencyScore(
      totalXp: 100,
      averageAccuracy: 1,
      boostSpendMinor: 500,
      minorUnitsPerEuroLike: 100,
    );
    expect(high, 100);
    expect(low, 50);
  });

  test('boost penalty is the same for a high-nominal currency', () {
    final usd = computeEfficiencyScore(
      totalXp: 100,
      averageAccuracy: 1,
      boostSpendMinor: 500,
      minorUnitsPerEuroLike: 100,
    );
    final rub = computeEfficiencyScore(
      totalXp: 100,
      averageAccuracy: 1,
      boostSpendMinor: 50000,
      minorUnitsPerEuroLike: 10000,
    );
    expect(rub, usd);
  });
}
