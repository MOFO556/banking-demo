import 'package:mofobank/data/db/app_database.dart';
import 'package:uuid/uuid.dart';

class BudgetRepository {
  BudgetRepository(this._db);
  final AppDatabase _db;
  final _uuid = const Uuid();

  Stream<List<BudgetItem>> watchItems() => _db.select(_db.budgetItems).watch();

  Future<void> addItem({
    required String category,
    required int amountMinor,
    required bool isIncome,
  }) async {
    await _db
        .into(_db.budgetItems)
        .insert(
          BudgetItemsCompanion.insert(
            id: _uuid.v4(),
            category: category,
            amountMinor: amountMinor,
            isIncome: isIncome,
          ),
        );
  }

  Future<void> clearAll() => _db.delete(_db.budgetItems).go();
}
