import 'package:intl/intl.dart';
import 'package:mofobank/core/errors/app_failure.dart';

/// Money stored as integer minor units (cents / копейки).
class Money {
  const Money(this.minorUnits, this.currencyCode);

  final int minorUnits;
  final String currencyCode;

  factory Money.fromMajor(
    double major,
    String currencyCode, {
    int decimals = 2,
  }) {
    final factor = _pow10(decimals);
    return Money((major * factor).round(), currencyCode);
  }

  double toMajor({int decimals = 2}) => minorUnits / _pow10(decimals);

  Money operator +(Money other) {
    _assertSameCurrency(other);
    return Money(minorUnits + other.minorUnits, currencyCode);
  }

  Money operator -(Money other) {
    _assertSameCurrency(other);
    return Money(minorUnits - other.minorUnits, currencyCode);
  }

  Money scale(double factor) =>
      Money((minorUnits * factor).round(), currencyCode);

  Money clampNonNegative() =>
      Money(minorUnits < 0 ? 0 : minorUnits, currencyCode);

  bool get isZero => minorUnits == 0;
  bool get isNegative => minorUnits < 0;

  String format({int decimals = 2}) {
    final fmt = NumberFormat.currency(
      name: currencyCode,
      symbol: _symbol(currencyCode),
      decimalDigits: decimals,
    );
    return fmt.format(toMajor(decimals: decimals));
  }

  void _assertSameCurrency(Money other) {
    if (currencyCode != other.currencyCode) {
      throw const AppFailure(AppFailureCode.invalidMoney);
    }
  }

  static int _pow10(int n) {
    var v = 1;
    for (var i = 0; i < n; i++) {
      v *= 10;
    }
    return v;
  }

  static String _symbol(String code) {
    return switch (code) {
      'USD' => '\$',
      'EUR' => '€',
      'GBP' => '£',
      'RUB' => '₽',
      'UZS' => "so'm",
      'JPY' => '¥',
      'TRY' => '₺',
      'KZT' => '₸',
      _ => code,
    };
  }

  @override
  String toString() => format();

  @override
  bool operator ==(Object other) =>
      other is Money &&
      other.minorUnits == minorUnits &&
      other.currencyCode == currencyCode;

  @override
  int get hashCode => Object.hash(minorUnits, currencyCode);
}
