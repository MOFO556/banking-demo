///Major-unit note denominations by currency
abstract final class CurrencyNotes {
  static List<int> majorNotesFor(String currencyCode) {
    return switch (currencyCode) {
      'RUB' => const [10, 50, 100, 200, 500, 1000, 2000, 5000],
      'USD' => const [1, 5, 10, 20, 50, 100],
      'EUR' => const [5, 10, 20, 50, 100, 200],
      'GBP' => const [5, 10, 20, 50],
      'UZS' => const [1000, 5000, 10000, 50000, 100000],
      'JPY' => const [1000, 2000, 5000, 10000],
      'TRY' => const [5, 10, 20, 50, 100, 200],
      'KZT' => const [200, 500, 1000, 2000, 5000, 10000, 20000],
      _ => const [1, 5, 10, 20, 50, 100],
    };
  }

  static int smallestNote(String currencyCode) =>
      majorNotesFor(currencyCode).first;

  /// Snap a major amount down to a multiple of the smallest note.
  static int snapToDispensable(int majorAmount, String currencyCode) {
    final step = smallestNote(currencyCode);
    if (step <= 0) {
      return majorAmount;
    }
    return (majorAmount ~/ step) * step;
  }
}
