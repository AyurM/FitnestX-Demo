class MealData {
  final int id;
  final String name;
  final String assetPath;
  final String difficulty;
  final int calories;
  final Duration cookDuration;

  const MealData({
    required this.id,
    required this.name,
    required this.assetPath,
    required this.difficulty,
    required this.calories,
    required this.cookDuration,
  });
}
