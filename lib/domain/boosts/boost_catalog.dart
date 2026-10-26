enum BoostId { hintPack, quizRetry, themeBadge }

class BoostOffer {
  const BoostOffer({
    required this.id,
    required this.title,
    required this.description,
    required this.euroLikeCost,
  });

  final BoostId id;
  final String title;
  final String description;
  final int euroLikeCost;
}

abstract final class BoostCatalog {
  static const offers = <BoostOffer>[
    BoostOffer(
      id: BoostId.hintPack,
      title: 'Hint pack',
      description: 'Highlights the correct quiz answer once (3 hints).',
      euroLikeCost: 5,
    ),
    BoostOffer(
      id: BoostId.quizRetry,
      title: 'Quiz retry',
      description: 'Clears your current quiz answers to try again (1 use).',
      euroLikeCost: 8,
    ),
    BoostOffer(
      id: BoostId.themeBadge,
      title: 'Teal badge',
      description: 'Cosmetic badge on Home - never gates lessons.',
      euroLikeCost: 15,
    ),
  ];

  static int costMinor(String currency, int euroLike) {
    return switch (currency) {
      'RUB' => euroLike * 10000,
      'UZS' => euroLike * 120000,
      'JPY' => euroLike * 150,
      'KZT' => euroLike * 5000,
      'TRY' => euroLike * 3000,
      _ => euroLike * 100,
    };
  }
}
