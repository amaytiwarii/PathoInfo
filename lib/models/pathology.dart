class PathologyTest {
  final String id;
  final String name;
  final String category;
  final String shortDescription;

  /// Which diseases it helps detect
  final List<String> helpsDetect;

  /// How the test helps
  final List<String> howItHelps;

  /// When doctor recommends it
  final List<String> recommendedWhen;

  /// Meaning of results
  final List<String> resultMeaning;

  /// Normal range
  final String normalRange;

  final bool isPopular;

  PathologyTest({
    required this.id,
    required this.name,
    required this.category,
    required this.shortDescription,
    required this.helpsDetect,
    required this.howItHelps,
    required this.recommendedWhen,
    required this.resultMeaning,
    required this.normalRange,
    this.isPopular = false,
  });
}
