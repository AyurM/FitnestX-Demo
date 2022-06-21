import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:flutter/material.dart';

const _titleText = 'Meal Nutritions';
const _weeklyText = 'Weekly';

class MealNutritionsBlock extends StatelessWidget {
  const MealNutritionsBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SectionTitle.dropdown(text: _titleText, dropdownText: _weeklyText),
          AppWhiteSpace.value5.vertical,
          Image.asset('assets/images/nutrition_graph.png',
              width: double.infinity, fit: BoxFit.contain)
        ],
      );
}
