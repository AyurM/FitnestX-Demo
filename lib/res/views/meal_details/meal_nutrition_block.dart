import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/meal_details/nutrition_chip.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _titleText = 'Nutrition';

class MealNutritionBlock extends StatelessWidget {
  const MealNutritionBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = DataMockUtils.getMockNutritionData();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: kHorizontalPadding20.left),
          child: const SectionTitle.noAction(text: _titleText),
        ),
        AppWhiteSpace.value15.vertical,
        SizedBox(
          height: NutritionChip.height,
          child: ListView.separated(
              padding: kHorizontalPadding20,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => NutritionChip(data: data[index]),
              separatorBuilder: (_, __) => AppWhiteSpace.value15.horizontal,
              itemCount: data.length),
        )
      ],
    );
  }
}
