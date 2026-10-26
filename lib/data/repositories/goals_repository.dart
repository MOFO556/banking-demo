import 'package:drift/drift.dart';
import 'package:mofobank/data/db/app_database.dart';
import 'package:uuid/uuid.dart';

class GoalsRepository {
  GoalsRepository(this._db);
  final AppDatabase _db;
  final _uuid = const Uuid();

  Stream<List<SavingsGoal>> watchGoals() =>
      _db.select(_db.savingsGoals).watch();

  Future<void> createGoal({
    required String title,
    required int targetMinor,
  }) async {
    await _db
        .into(_db.savingsGoals)
        .insert(
          SavingsGoalsCompanion.insert(
            id: _uuid.v4(),
            title: title,
            targetMinor: targetMinor,
          ),
        );
  }

  Future<void> fundGoal({
    required String goalId,
    required int amountMinor,
  }) async {
    final goal = await (_db.select(
      _db.savingsGoals,
    )..where((t) => t.id.equals(goalId))).getSingle();
    await (_db.update(
      _db.savingsGoals,
    )..where((t) => t.id.equals(goalId))).write(
      SavingsGoalsCompanion(savedMinor: Value(goal.savedMinor + amountMinor)),
    );
  }
}
