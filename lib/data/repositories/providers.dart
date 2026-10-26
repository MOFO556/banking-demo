import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mofobank/data/api/card_vault_api.dart';
import 'package:mofobank/data/db/database_provider.dart';
import 'package:mofobank/data/repositories/bank_repository.dart';
import 'package:mofobank/data/repositories/budget_repository.dart';
import 'package:mofobank/data/repositories/fx_repository.dart';
import 'package:mofobank/data/repositories/goals_repository.dart';
import 'package:mofobank/data/repositories/security_repository.dart';

final bankRepositoryProvider = Provider<BankRepository>((ref) {
  return BankRepository(ref.watch(databaseProvider));
});

final cardVaultApiProvider = Provider<CardVaultApi>((ref) {
  return CardVaultApi(ref.watch(databaseProvider));
});

final fxRepositoryProvider = Provider<FxRepository>((ref) {
  return FxRepository(ref.watch(databaseProvider));
});

final budgetRepositoryProvider = Provider<BudgetRepository>((ref) {
  return BudgetRepository(ref.watch(databaseProvider));
});

final goalsRepositoryProvider = Provider<GoalsRepository>((ref) {
  return GoalsRepository(ref.watch(databaseProvider));
});

final securityRepositoryProvider = Provider<SecurityRepository>((ref) {
  return SecurityRepository();
});

final bankSnapshotProvider = StreamProvider((ref) {
  return ref.watch(bankRepositoryProvider).watchSnapshot();
});

final onboardedProvider = FutureProvider<bool>((ref) {
  return ref.watch(bankRepositoryProvider).isOnboarded();
});
