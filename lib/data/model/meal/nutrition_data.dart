enum NutritionType {
  calories('kCal', 'assets/images/icon_burn.png'),
  fats('g', 'assets/images/icon_fat.png'),
  proteins('g', 'assets/images/icon_protein.png'),
  carbs('g', 'assets/images/icon_carbo.png');

  final String units;
  final String iconPath;
  const NutritionType(this.units, this.iconPath);
}

class NutritionData {
  final NutritionType type;
  final int value;

  const NutritionData({
    required this.type,
    required this.value,
  });
}
