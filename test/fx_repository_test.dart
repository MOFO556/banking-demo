import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mofobank/data/db/app_database.dart';
import 'package:mofobank/data/repositories/fx_repository.dart';

class _OfflineClient extends http.BaseClient {
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    throw Exception('offline');
  }
}

void main() {
  test('uncached offline quote is not reported as a cached rate', () async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
    final repo = FxRepository(db, client: _OfflineClient());

    final quote = await repo.getRate(base: 'USD', quote: 'EUR');

    // USD-pivot fallback: EUR 0.92 / USD 1.0.
    expect(quote.midMarketRate, closeTo(0.92, 0.0001));
    // Empty FxCache. The screen treats fromCache as "Showing last known rate".
    expect(quote.fromCache, isFalse);
    expect(quote.synthetic, isTrue);
  });

  test('same currency is an identity quote, not a cached rate', () async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
    final repo = FxRepository(db, client: _OfflineClient());

    final quote = await repo.getRate(base: 'USD', quote: 'USD');

    expect(quote.midMarketRate, 1);
    expect(quote.fromCache, isFalse);
    expect(quote.synthetic, isFalse);
  });

  test('a stored FxCache row stays a cached rate', () async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
    await db
        .into(db.fxCache)
        .insert(
          FxCacheCompanion.insert(
            baseCurrency: 'USD',
            quoteCurrency: 'EUR',
            rate: 0.5,
            fetchedAt: DateTime.utc(2026, 1, 1),
          ),
        );
    final repo = FxRepository(db, client: _OfflineClient());

    final quote = await repo.getRate(base: 'USD', quote: 'EUR');

    expect(quote.midMarketRate, 0.5);
    expect(quote.fromCache, isTrue);
    expect(quote.synthetic, isFalse);
  });
}
