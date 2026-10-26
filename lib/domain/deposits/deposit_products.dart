enum RatePeriod { perDay, perMonth }

class DepositProduct {
  const DepositProduct({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.rate,
    required this.period,
  });

  final String id;
  final String title;
  final String subtitle;

  /// Fractional rate for [period] (e.g. 0.015 = 1.5% per month).
  final double rate;
  final RatePeriod period;

  String get rateLabel {
    final pct = (rate * 100).toStringAsFixed(
      period == RatePeriod.perDay ? 2 : 1,
    );
    return period == RatePeriod.perDay ? '$pct% / day' : '$pct% / month';
  }
}

abstract final class DepositCatalog {
  static const products = <DepositProduct>[
    DepositProduct(
      id: 'flex_daily',
      title: 'Flex Daily',
      subtitle: 'Spend-friendly pot · interest every day',
      rate: 0.0003,
      period: RatePeriod.perDay,
    ),
    DepositProduct(
      id: 'saver_daily',
      title: 'Saver Daily',
      subtitle: 'Higher daily rate · still liquid',
      rate: 0.0008,
      period: RatePeriod.perDay,
    ),
    DepositProduct(
      id: 'term_monthly',
      title: 'Term Monthly',
      subtitle: 'Classic term-style · paid monthly',
      rate: 0.015,
      period: RatePeriod.perMonth,
    ),
    DepositProduct(
      id: 'premium_monthly',
      title: 'Premium Monthly',
      subtitle: 'Best monthly rate · educational demo',
      rate: 0.022,
      period: RatePeriod.perMonth,
    ),
  ];

  static DepositProduct byId(String id) =>
      products.firstWhere((p) => p.id == id);

  /// Accrue interest for elapsed time since [lastAccrual].
  static int accrueMinor({
    required int principalMinor,
    required DepositProduct product,
    required DateTime lastAccrual,
    required DateTime now,
  }) {
    if (principalMinor <= 0) return 0;
    final elapsed = now.difference(lastAccrual);
    if (elapsed.isNegative || elapsed.inSeconds < 1) return 0;

    if (product.period == RatePeriod.perDay) {
      final days = elapsed.inSeconds / 86400.0;
      return (principalMinor * product.rate * days).round();
    }

    final months = elapsed.inSeconds / (86400.0 * 30.0);
    return (principalMinor * product.rate * months).round();
  }
}
