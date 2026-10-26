import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:http/http.dart' as http;
import 'package:mofobank/data/db/app_database.dart';

class FxQuote {
  const FxQuote({
    required this.base,
    required this.quote,
    required this.midMarketRate,
    required this.bankRate,
    required this.markup,
    required this.fetchedAt,
    required this.fromCache,
    this.synthetic = false,
  });

  final String base;
  final String quote;
  final double midMarketRate;

  final double bankRate;
  final double markup;
  final DateTime fetchedAt;

  /// True only when this quote was read from [FxCache].
  final bool fromCache;

  /// True when no live or cached rate existed and the educational USD pivot was used.
  final bool synthetic;
}

class FxRepository {
  FxRepository(this._db, {http.Client? client, this.markup = 0.015})
    : _client = client ?? http.Client();

  final AppDatabase _db;
  final http.Client _client;

  /// Educational bank spread on top of mid-market (1.5% default).
  final double markup;

  Future<FxQuote> getRate({required String base, required String quote}) async {
    if (base == quote) {
      return FxQuote(
        base: base,
        quote: quote,
        midMarketRate: 1,
        bankRate: 1,
        markup: 0,
        fetchedAt: DateTime.now(),
        fromCache: false,
      );
    }

    try {
      final uri = Uri.parse(
        'https://api.frankfurter.app/latest?from=$base&to=$quote',
      );
      final res = await _client.get(uri).timeout(const Duration(seconds: 8));
      if (res.statusCode != 200) {
        return await _fromCacheOrFallback(base, quote);
      }
      final json = jsonDecode(res.body) as Map<String, dynamic>;
      final rates = json['rates'] as Map<String, num>;
      final mid = (rates[quote])?.toDouble() ?? 0;
      final bank = mid * (1 + markup);
      final now = DateTime.now();

      await _db
          .into(_db.fxCache)
          .insertOnConflictUpdate(
            FxCacheCompanion.insert(
              baseCurrency: base,
              quoteCurrency: quote,
              rate: mid,
              fetchedAt: now,
            ),
          );

      return FxQuote(
        base: base,
        quote: quote,
        midMarketRate: mid,
        bankRate: bank,
        markup: markup,
        fetchedAt: now,
        fromCache: false,
      );
    } catch (_) {
      return _fromCacheOrFallback(base, quote);
    }
  }

  Future<FxQuote> _fromCacheOrFallback(String base, String quote) async {
    final cached =
        await (_db.select(_db.fxCache)..where(
              (t) =>
                  t.baseCurrency.equals(base) & t.quoteCurrency.equals(quote),
            ))
            .getSingleOrNull();

    if (cached != null) {
      return FxQuote(
        base: base,
        quote: quote,
        midMarketRate: cached.rate,
        bankRate: cached.rate * (1 + markup),
        markup: markup,
        fetchedAt: cached.fetchedAt,
        fromCache: true,
      );
    }

    final fallback = _fallbackRate(base, quote);
    return FxQuote(
      base: base,
      quote: quote,
      midMarketRate: fallback,
      bankRate: fallback * (1 + markup),
      markup: markup,
      fetchedAt: DateTime.now(),
      fromCache: false,
      synthetic: true,
    );
  }

  /// Rough educational fallbacks when offline / unsupported pairs.
  double _fallbackRate(String base, String quote) {
    const usd = {
      'RUB': 92.0,
      'USD': 1.0,
      'EUR': 0.92,
      'GBP': 0.79,
      'UZS': 12600.0,
      'JPY': 150.0,
      'TRY': 32.0,
      'KZT': 450.0,
    };
    final b = usd[base] ?? 1.0;
    final q = usd[quote] ?? 1.0;
    // Convert base→USD→quote using USD table as pivot.
    return q / b;
  }

  int convertMinor({required int amountMinor, required double bankRate}) {
    return (amountMinor * bankRate).round();
  }
}
