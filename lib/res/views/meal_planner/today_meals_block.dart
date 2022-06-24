import 'package:fitnest_x/data/model/today_meal_content.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/meal_planner/today_meal_card.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:fitnest_x/screens/meal_details_screen/meal_details_screen.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _titleText = 'Today Meals';
const _breakfastText = 'Breakfast';

class TodayMealsBlock extends StatelessWidget {
  const TodayMealsBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todayMeals = DataMockUtils.getMockTodayMeals();

    return Column(
      children: [
        SectionTitle.dropdown(text: _titleText, dropdownText: _breakfastText),
        AppWhiteSpace.value15.vertical,
        ..._buildMealItems(todayMeals, context)
      ],
    );
  }

  List<Widget> _buildMealItems(
      List<TodayMealContent> meals, BuildContext context) {
    final result = <Widget>[];

    for (int i = 0; i < meals.length; i++) {
      result.add(TodayMealCard(
          data: meals[i],
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MealDetailsScreen(data: meals[i].meal)))));

      if (i != meals.length - 1) {
        result.add(AppWhiteSpace.value15.vertical);
      }
    }

    return result;
  }
}
