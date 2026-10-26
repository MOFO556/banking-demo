/// Note dispense strategies: greedy (large bills first) vs DP (fewest notes).
class CoinChangeResult {
  const CoinChangeResult({
    required this.counts,
    required this.totalNotes,
    required this.feasible,
    this.elapsedMicroseconds = 0,
  });

  final List<int> counts;
  final int totalNotes;
  final bool feasible;
  final int elapsedMicroseconds;

  String formatBreakdown(List<int> dens) {
    if (!feasible) return 'Not possible with available notes';
    final parts = <String>[];
    final n = dens.length < counts.length ? dens.length : counts.length;
    for (var i = 0; i < n; i++) {
      if (counts[i] > 0) parts.add('${counts[i]}×${dens[i]}');
    }
    return parts.isEmpty ? 'No notes' : parts.join(' + ');
  }
}

/// Prefer largest notes first (ATM “large bills” path). Fast to compute.
CoinChangeResult greedyChange(int amount, List<int> denominations) {
  final sw = Stopwatch()..start();
  final dens = List<int>.from(denominations)..sort((a, b) => b.compareTo(a));
  final countsByDen = {for (final d in dens) d: 0};
  var remaining = amount;
  for (final d in dens) {
    countsByDen[d] = remaining ~/ d;
    remaining -= countsByDen[d]! * d;
  }
  final counts = [for (final d in denominations) countsByDen[d] ?? 0];
  final total = counts.fold<int>(0, (a, b) => a + b);
  sw.stop();
  return CoinChangeResult(
    counts: counts,
    totalNotes: total,
    feasible: remaining == 0,
    elapsedMicroseconds: sw.elapsedMicroseconds,
  );
}

/// Fewest notes (ATM “optimal cassette” path). Heavier for large amounts.
CoinChangeResult dpChange(int amount, List<int> denominations) {
  final sw = Stopwatch()..start();
  if (amount < 0) {
    sw.stop();
    return CoinChangeResult(
      counts: List.filled(denominations.length, 0),
      totalNotes: 0,
      feasible: false,
      elapsedMicroseconds: sw.elapsedMicroseconds,
    );
  }
  if (amount == 0) {
    sw.stop();
    return CoinChangeResult(
      counts: List.filled(denominations.length, 0),
      totalNotes: 0,
      feasible: true,
      elapsedMicroseconds: sw.elapsedMicroseconds,
    );
  }

  const inf = 1 << 28;
  final minNotes = List<int>.filled(amount + 1, inf);
  final pick = List<int>.filled(amount + 1, -1);
  minNotes[0] = 0;

  for (var a = 1; a <= amount; a++) {
    for (var i = 0; i < denominations.length; i++) {
      final d = denominations[i];
      if (d <= a && minNotes[a - d] + 1 < minNotes[a]) {
        minNotes[a] = minNotes[a - d] + 1;
        pick[a] = i;
      }
    }
  }

  if (minNotes[amount] >= inf) {
    sw.stop();
    return CoinChangeResult(
      counts: List.filled(denominations.length, 0),
      totalNotes: 0,
      feasible: false,
      elapsedMicroseconds: sw.elapsedMicroseconds,
    );
  }

  final counts = List<int>.filled(denominations.length, 0);
  var a = amount;
  while (a > 0) {
    final i = pick[a];
    if (i < 0) break;
    counts[i]++;
    a -= denominations[i];
  }

  sw.stop();
  return CoinChangeResult(
    counts: counts,
    totalNotes: minNotes[amount],
    feasible: true,
    elapsedMicroseconds: sw.elapsedMicroseconds,
  );
}

/// “Smaller notes for change” - greedy without the top denominations.
CoinChangeResult changeFriendlyGreedy(int amount, List<int> denominations) {
  if (denominations.length <= 2) {
    return greedyChange(amount, denominations);
  }
  final limited = denominations.sublist(0, denominations.length - 2);
  final result = greedyChange(amount, limited);
  final counts = List<int>.filled(denominations.length, 0);
  for (var i = 0; i < limited.length; i++) {
    counts[i] = result.counts[i];
  }
  return CoinChangeResult(
    counts: counts,
    totalNotes: result.totalNotes,
    feasible: result.feasible,
    elapsedMicroseconds: result.elapsedMicroseconds,
  );
}
