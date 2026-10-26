import 'package:mofobank/domain/ledger/ledger_models.dart';

/// Settle lesson sandbox stake into the real wallet.
SettlementResult settleLessonStake({
  required int stakeMinor,
  required double performanceRatio,
  required int baseXp,
}) {
  final ratio = performanceRatio.clamp(0.0, 1.0);
  final paid = (stakeMinor * ratio).round().clamp(0, stakeMinor);
  final xp = (baseXp * ratio).round();
  return SettlementResult(
    stakeMinor: stakeMinor,
    paidMinor: paid,
    performanceRatio: ratio,
    xpAwarded: xp,
    isReplay: false,
  );
}

int replayStakeMinor(int fullStakeMinor) => fullStakeMinor ~/ 2;

/// Efficiency: XP × accuracy − 10 points per euro-like unit spent on boosts.
double computeEfficiencyScore({
  required int totalXp,
  required double averageAccuracy,
  required int boostSpendMinor,
  required int minorUnitsPerEuroLike,
}) {
  final accuracy = averageAccuracy.clamp(0.0, 1.0);
  final euroLikeSpent = minorUnitsPerEuroLike <= 0
      ? 0.0
      : boostSpendMinor / minorUnitsPerEuroLike;
  return (totalXp * accuracy) - (euroLikeSpent * 10);
}
