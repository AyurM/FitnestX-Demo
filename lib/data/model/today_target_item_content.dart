class TodayTargetItemContent {
  final String name;
  final int value;
  final String? unit;
  final String imagePath;

  const TodayTargetItemContent({
    required this.name,
    required this.value,
    this.unit,
    required this.imagePath,
  });
}
