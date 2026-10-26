/// RPG leveling for MOFOBank wallet economy.
abstract final class Leveling {
  static const int xpPerLevel = 200;

  static int levelForXp(int xp) => (xp ~/ xpPerLevel) + 1;

  static int xpIntoCurrentLevel(int xp) => xp % xpPerLevel;

  static int xpToNextLevel(int xp) => xpPerLevel - xpIntoCurrentLevel(xp);

  /// Stipend in minor units when reaching [newLevel], scaled by home currency.
  static int stipendForLevel(int newLevel, {required int baseStipendMinor}) {
    return baseStipendMinor + (newLevel - 1) * (baseStipendMinor ~/ 4);
  }

  /// Lesson stake scales with level.
  static int stakeForMission({
    required double baseStakeMajor,
    required int level,
    required int decimals,
  }) {
    final factor = 1.0 + (level - 1) * 0.1;
    final major = baseStakeMajor * factor;
    return (major * _pow10(decimals)).round();
  }

  static int _pow10(int n) {
    var v = 1;
    for (var i = 0; i < n; i++) {
      v *= 10;
    }
    return v;
  }
}
