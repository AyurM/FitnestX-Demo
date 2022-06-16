enum ExerciseDifficulty {
  easy,
  medium,
  hard;

  @override
  String toString() => name[0].toUpperCase() + name.substring(1);
}

class ExerciseData {
  final int id;
  final int caloriesBurn;
  final ExerciseDifficulty difficulty;
  final String title;
  final String assetPath;
  final String subtitle;

  const ExerciseData({
    required this.id,
    required this.caloriesBurn,
    required this.difficulty,
    required this.title,
    required this.assetPath,
    required this.subtitle,
  });
}
