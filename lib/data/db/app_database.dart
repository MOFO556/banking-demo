import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class Profiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get displayName => text().withDefault(const Constant('Learner'))();
  TextColumn get handle => text().withDefault(const Constant('learner'))();
  TextColumn get homeMarketId => text()();
  IntColumn get xp => integer().withDefault(const Constant(0))();
  IntColumn get boostSpendMinor => integer().withDefault(const Constant(0))();
  RealColumn get accuracySum => real().withDefault(const Constant(0))();
  IntColumn get accuracyCount => integer().withDefault(const Constant(0))();
  BoolColumn get onboarded => boolean().withDefault(const Constant(false))();
  IntColumn get hintsOwned => integer().withDefault(const Constant(0))();
  IntColumn get retriesOwned => integer().withDefault(const Constant(0))();
  BoolColumn get themeBadge => boolean().withDefault(const Constant(false))();
  BoolColumn get biometricsEnabled =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

/// kind: wallet | card | deposit
class Accounts extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get currencyCode => text()();
  IntColumn get balanceMinor => integer().withDefault(const Constant(0))();
  TextColumn get kind => text().withDefault(const Constant('wallet'))();

  /// null = current user; otherwise peer handle for directory accounts
  TextColumn get ownerHandle => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class BankCards extends Table {
  TextColumn get id => text()();
  TextColumn get accountId => text()();
  TextColumn get token => text()();
  TextColumn get lastFour => text()();
  TextColumn get label => text()();
  BoolColumn get frozen => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

/// Mock vault - PAN/CVV never returned except via CardVaultApi.
class CardVaultSecrets extends Table {
  TextColumn get token => text()();
  TextColumn get pan => text()();
  TextColumn get expiryMmYy => text()();
  TextColumn get cvv => text()();

  @override
  Set<Column<Object>> get primaryKey => {token};
}

class DepositAccounts extends Table {
  TextColumn get id => text()();
  TextColumn get accountId => text()();
  TextColumn get productId => text()();
  DateTimeColumn get openedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get lastAccrualAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class DirectoryUsers extends Table {
  TextColumn get handle => text()();
  TextColumn get displayName => text()();
  TextColumn get accountId => text()();

  @override
  Set<Column<Object>> get primaryKey => {handle};
}

class LedgerEntries extends Table {
  TextColumn get id => text()();
  TextColumn get accountId => text()();
  IntColumn get amountMinor => integer()();
  TextColumn get currencyCode => text()();
  TextColumn get type => text()();
  TextColumn get description => text()();
  TextColumn get idempotencyKey => text().nullable()();
  TextColumn get counterparty => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class MissionProgress extends Table {
  TextColumn get missionId => text()();
  BoolColumn get unlocked => boolean().withDefault(const Constant(false))();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
  RealColumn get bestPerformance => real().withDefault(const Constant(0))();
  DateTimeColumn get completedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {missionId};
}

class FxCache extends Table {
  TextColumn get baseCurrency => text()();
  TextColumn get quoteCurrency => text()();
  RealColumn get rate => real()();
  DateTimeColumn get fetchedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {baseCurrency, quoteCurrency};
}

class BudgetItems extends Table {
  TextColumn get id => text()();
  TextColumn get category => text()();
  IntColumn get amountMinor => integer()();
  BoolColumn get isIncome => boolean()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class SavingsGoals extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  IntColumn get targetMinor => integer()();
  IntColumn get savedMinor => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DriftDatabase(
  tables: [
    Profiles,
    Accounts,
    BankCards,
    CardVaultSecrets,
    DepositAccounts,
    DirectoryUsers,
    LedgerEntries,
    MissionProgress,
    FxCache,
    BudgetItems,
    SavingsGoals,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openExecutor());

  static QueryExecutor _openExecutor() {
    return driftDatabase(
      name: 'mofobank',
      web: DriftWebOptions(
        sqlite3Wasm: Uri.parse('sqlite3.wasm'),
        driftWorker: Uri.parse('drift_worker.js'),
      ),
    );
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async => m.createAll(),
    onUpgrade: (m, from, to) async {
      if (from == to) {
        return;
      }
    },
  );
}
