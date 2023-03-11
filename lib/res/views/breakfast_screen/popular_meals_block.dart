import 'package:fitnest_x/data/model/meal/meal_data.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/breakfast_screen/popular_meal_card.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:fitnest_x/screens/meal_details_screen/meal_details_screen.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _titleText = 'Popular';

class PopularMealsBlock extends StatelessWidget {
  const PopularMealsBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final popularMeals = DataMockUtils.getMockPopularMeals();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle.noAction(text: _titleText),
        AppWhiteSpace.value15.vertical,
        ..._buildMealItems(popularMeals, context)
      ],
    );
  }

  List<Widget> _buildMealItems(List<MealData> meals, BuildContext context) {
    final result = <Widget>[];

    for (int i = 0; i < meals.length; i++) {
      result.add(PopularMealCard(
          data: meals[i],
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MealDetailsScreen(data: meals[i])))));

      if (i != meals.length - 1) {
        result.add(AppWhiteSpace.value15.vertical);
      }
    }

    return result;
  }
}
