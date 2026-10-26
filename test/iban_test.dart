import 'package:flutter_test/flutter_test.dart';
import 'package:mofobank/domain/transfers/iban.dart';

void main() {
  test('accepts well-formed IBAN-like id', () {
    final v = validateIbanLike('DE89 3704 0044 0532 0130 00');
    expect(v.valid, isTrue);
  });

  test('rejects short input', () {
    final v = validateIbanLike('DE89');
    expect(v.valid, isFalse);
  });

  test('amount validation', () {
    expect(validateAmountMinor(100, 50).valid, isFalse);
    expect(validateAmountMinor(100, 200).valid, isTrue);
  });
}
