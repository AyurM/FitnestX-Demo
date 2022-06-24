import 'package:fitnest_x/data/model/meal_data.dart';

class MealScheduleData {
  final MealData meal;
  final DateTime dateTime;

  const MealScheduleData({
    required this.meal,
    required this.dateTime,
  });
}
