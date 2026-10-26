import 'package:mofobank/core/errors/app_failure.dart';
import 'package:mofobank/data/db/app_database.dart';

class CardSensitiveDetails {
  const CardSensitiveDetails({
    required this.token,
    required this.pan,
    required this.expiryMmYy,
    required this.cvv,
    required this.fetchedAt,
  });

  final String token;
  final String pan;
  final String expiryMmYy;
  final String cvv;
  final DateTime fetchedAt;
}

class CardVaultApi {
  CardVaultApi(this._db);

  final AppDatabase _db;

  Future<CardSensitiveDetails> fetchSensitiveDetails(String token) async {
    /// Simulates network latency + vault lookup
    await Future<void>.delayed(const Duration(milliseconds: 450));
    final row = await (_db.select(
      _db.cardVaultSecrets,
    )..where((t) => t.token.equals(token))).getSingleOrNull();
    if (row == null) {
      throw const AppFailure(AppFailureCode.cardTokenNotFound);
    }
    return CardSensitiveDetails(
      token: row.token,
      pan: row.pan,
      expiryMmYy: row.expiryMmYy,
      cvv: row.cvv,
      fetchedAt: DateTime.now(),
    );
  }
}
