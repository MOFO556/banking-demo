import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mofobank/data/api/card_vault_api.dart';
import 'package:mofobank/data/db/app_database.dart';

void main() {
  test('vault API returns secrets for token', () async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);

    await db.into(db.cardVaultSecrets).insert(
          CardVaultSecretsCompanion.insert(
            token: 'tok_test',
            pan: '4532015112830366',
            expiryMmYy: '12/28',
            cvv: '314',
          ),
        );

    final api = CardVaultApi(db);
    final details = await api.fetchSensitiveDetails('tok_test');
    expect(details.pan, '4532015112830366');
    expect(details.cvv, '314');
    expect(details.expiryMmYy, '12/28');
  });
}
