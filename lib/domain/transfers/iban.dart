/// Lightweight IBAN / account validation (not full ISO 13616).
class TransferValidation {
  const TransferValidation({required this.valid, this.message});
  final bool valid;
  final String? message;
}

TransferValidation validateIbanLike(String input) {
  final cleaned = input.replaceAll(RegExp(r'\s+'), '').toUpperCase();
  if (cleaned.length < 15 || cleaned.length > 34) {
    return const TransferValidation(
      valid: false,
      message: 'IBAN-like ids are usually 15-34 characters',
    );
  }
  if (!RegExp(r'^[A-Z]{2}[0-9]{2}[A-Z0-9]+$').hasMatch(cleaned)) {
    return const TransferValidation(
      valid: false,
      message: 'Expected country code + check digits + account body',
    );
  }
  return const TransferValidation(valid: true);
}

TransferValidation validateAmountMinor(int amountMinor, int availableMinor) {
  if (amountMinor <= 0) {
    return const TransferValidation(
      valid: false,
      message: 'Amount must be positive',
    );
  }
  if (amountMinor > availableMinor) {
    return const TransferValidation(
      valid: false,
      message: 'Insufficient funds',
    );
  }
  return const TransferValidation(valid: true);
}
