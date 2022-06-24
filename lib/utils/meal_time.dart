enum MealTime {
  breakfast,
  lunch,
  snacks,
  dinner,
  supper;

  String get title => name[0].toUpperCase() + name.substring(1);
}
