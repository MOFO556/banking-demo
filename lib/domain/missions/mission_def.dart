enum MissionId {
  cards,
  deposits,
  fx,
  atm,
  budgeting,
  transfers,
  credit,
  security,
  savingsGoals,
}

class MissionDef {
  const MissionDef({
    required this.id,
    required this.routePath,
    required this.order,
    required this.baseStakeMajor,
    required this.xpReward,
  });

  final MissionId id;
  final String routePath;
  final int order;

  /// Lesson sandbox stake in major currency units (scaled by level later).
  final double baseStakeMajor;
  final int xpReward;
}

abstract final class Curriculum {
  static const List<MissionDef> missions = [
    MissionDef(
      id: MissionId.cards,
      routePath: '/mission/cards',
      order: 0,
      baseStakeMajor: 50,
      xpReward: 100,
    ),
    MissionDef(
      id: MissionId.deposits,
      routePath: '/mission/deposits',
      order: 1,
      baseStakeMajor: 200,
      xpReward: 120,
    ),
    MissionDef(
      id: MissionId.fx,
      routePath: '/mission/fx',
      order: 2,
      baseStakeMajor: 150,
      xpReward: 140,
    ),
    MissionDef(
      id: MissionId.atm,
      routePath: '/mission/atm',
      order: 3,
      baseStakeMajor: 100,
      xpReward: 150,
    ),
    MissionDef(
      id: MissionId.budgeting,
      routePath: '/mission/budgeting',
      order: 4,
      baseStakeMajor: 80,
      xpReward: 110,
    ),
    MissionDef(
      id: MissionId.transfers,
      routePath: '/mission/transfers',
      order: 5,
      baseStakeMajor: 120,
      xpReward: 120,
    ),
    MissionDef(
      id: MissionId.credit,
      routePath: '/mission/credit',
      order: 6,
      baseStakeMajor: 100,
      xpReward: 130,
    ),
    MissionDef(
      id: MissionId.security,
      routePath: '/mission/security',
      order: 7,
      baseStakeMajor: 60,
      xpReward: 140,
    ),
    MissionDef(
      id: MissionId.savingsGoals,
      routePath: '/mission/savings',
      order: 8,
      baseStakeMajor: 90,
      xpReward: 100,
    ),
  ];

  static MissionDef byId(MissionId id) =>
      missions.firstWhere((m) => m.id == id);

  static MissionDef? byPath(String path) {
    for (final m in missions) {
      if (m.routePath == path) return m;
    }
    return null;
  }
}
