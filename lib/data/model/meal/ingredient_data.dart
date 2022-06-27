class IngredientData {
  final String name;
  final String assetPath;
  final int amount;
  final String? units;

  const IngredientData({
    required this.name,
    required this.assetPath,
    required this.amount,
    this.units,
  });
}
