import 'package:fitnest_x/data/model/meal/meal_data.dart';

class TodayMealContent {
  final MealData meal;
  final DateTime date;
  final bool showNotification;

  const TodayMealContent({
    required this.meal,
    required this.date,
    required this.showNotification,
  });
}
