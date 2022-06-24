import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/daily_action_card.dart';
import 'package:fitnest_x/res/views/meal_planner/find_meal_block.dart';
import 'package:fitnest_x/res/views/meal_planner/meal_nutritions_block.dart';
import 'package:fitnest_x/res/views/meal_planner/today_meals_block.dart';
import 'package:fitnest_x/res/views/simple_app_scaffold.dart';
import 'package:fitnest_x/screens/meal_schedule_screen/meal_schedule_screen.dart';
import 'package:flutter/material.dart';

const _titleText = 'Meal Planner';
const _mealScheduleText = 'Daily Meal Schedule';

class MealPlannerScreen extends StatelessWidget {
  const MealPlannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleAppScaffold(
        title: _titleText,
        body: SingleChildScrollView(
          child: Column(children: [
            AppWhiteSpace.value30.vertical,
            const Padding(
              padding: kHorizontalPadding20,
              child: MealNutritionsBlock(),
            ),
            AppWhiteSpace.value30.vertical,
            DailyActionCard(
              title: _mealScheduleText,
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MealScheduleScreen())),
              margin: kHorizontalPadding20,
            ),
            AppWhiteSpace.value30.vertical,
            const Padding(
              padding: kHorizontalPadding20,
              child: TodayMealsBlock(),
            ),
            AppWhiteSpace.value30.vertical,
            const FindMealBlock(),
            AppWhiteSpace.value30.vertical,
          ]),
        ));
  }
}
