/// Educational market profile (tax rates are approximations for learning).
class Market {
  const Market({
    required this.id,
    required this.countryName,
    required this.currencyCode,
    required this.interestWithholdingTaxRate,
    required this.flagEmoji,
    required this.depositApyExample,
  });

  final String id;
  final String countryName;
  final String currencyCode;

  /// Fraction 0-1 of deposit interest withheld as tax (educational).
  final double interestWithholdingTaxRate;
  final String flagEmoji;

  /// Example annual percentage yield for deposit lessons.
  final double depositApyExample;
}

/// Curated markets: RUB, USD, EUR, GBP, UZS, JPY, TRY, KZT.
/// Approximated example values
abstract final class MarketsCatalog {
  static const List<Market> all = [
    Market(
      id: 'ru',
      countryName: 'Russia',
      currencyCode: 'RUB',
      interestWithholdingTaxRate: 0.13,
      flagEmoji: '🇷🇺',
      depositApyExample: 0.16,
    ),
    Market(
      id: 'us',
      countryName: 'United States',
      currencyCode: 'USD',
      interestWithholdingTaxRate: 0.24,
      flagEmoji: '🇺🇸',
      depositApyExample: 0.05,
    ),
    Market(
      id: 'eu',
      countryName: 'Eurozone',
      currencyCode: 'EUR',
      interestWithholdingTaxRate: 0.26,
      flagEmoji: '🇪🇺',
      depositApyExample: 0.035,
    ),
    Market(
      id: 'uk',
      countryName: 'United Kingdom',
      currencyCode: 'GBP',
      interestWithholdingTaxRate: 0.20,
      flagEmoji: '🇬🇧',
      depositApyExample: 0.045,
    ),
    Market(
      id: 'uz',
      countryName: 'Uzbekistan',
      currencyCode: 'UZS',
      interestWithholdingTaxRate: 0.10,
      flagEmoji: '🇺🇿',
      depositApyExample: 0.18,
    ),
    Market(
      id: 'jp',
      countryName: 'Japan',
      currencyCode: 'JPY',
      interestWithholdingTaxRate: 0.20315,
      flagEmoji: '🇯🇵',
      depositApyExample: 0.002,
    ),
    Market(
      id: 'tr',
      countryName: 'Türkiye',
      currencyCode: 'TRY',
      interestWithholdingTaxRate: 0.15,
      flagEmoji: '🇹🇷',
      depositApyExample: 0.40,
    ),
    Market(
      id: 'kz',
      countryName: 'Kazakhstan',
      currencyCode: 'KZT',
      interestWithholdingTaxRate: 0.10,
      flagEmoji: '🇰🇿',
      depositApyExample: 0.14,
    ),
  ];

  static Market byId(String id) => all.firstWhere((m) => m.id == id);

  static Market? tryById(String id) {
    for (final m in all) {
      if (m.id == id) {
        return m;
      }
    }
    return null;
  }
}
