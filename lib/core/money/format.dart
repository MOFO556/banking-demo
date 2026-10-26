import 'package:mofobank/core/money/money.dart';

String formatMinor(int minor, String currencyCode, {int decimals = 2}) {
  return Money(minor, currencyCode).format(decimals: decimals);
}
