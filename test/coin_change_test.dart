import 'package:flutter_test/flutter_test.dart';
import 'package:mofobank/domain/atm/coin_change.dart';
import 'package:mofobank/domain/atm/currency_notes.dart';

void main() {
  group('coin change', () {
    test('DP beats greedy on weird denominations for amount 6', () {
      const dens = [1, 3, 4];
      const amount = 6;
      final greedy = greedyChange(amount, dens);
      final dp = dpChange(amount, dens);

      expect(greedy.feasible, isTrue);
      expect(dp.feasible, isTrue);
      expect(greedy.totalNotes, 3); // 4+1+1
      expect(dp.totalNotes, 2); // 3+3
      expect(dp.totalNotes < greedy.totalNotes, isTrue);
    });

    test('greedy and DP agree on RUB-like for 6000', () {
      final dens = CurrencyNotes.majorNotesFor('RUB');
      final greedy = greedyChange(6000, dens);
      final dp = dpChange(6000, dens);
      expect(greedy.feasible, isTrue);
      expect(dp.feasible, isTrue);
      expect(greedy.totalNotes, dp.totalNotes);
    });

    test('withdrawal snaps to note step', () {
      expect(CurrencyNotes.snapToDispensable(1234, 'RUB'), 1230);
      expect(CurrencyNotes.snapToDispensable(99, 'USD'), 99);
    });

    test('change-friendly counts align with full denomination list', () {
      final dens = CurrencyNotes.majorNotesFor('RUB');
      final result = changeFriendlyGreedy(6000, dens);
      expect(result.counts.length, dens.length);
      expect(result.feasible, isTrue);
      expect(result.formatBreakdown(dens), isNot(contains('error')));
      // Top two notes are excluded from the friendly pack.
      expect(result.counts[dens.length - 1], 0);
      expect(result.counts[dens.length - 2], 0);
    });
  });
}
