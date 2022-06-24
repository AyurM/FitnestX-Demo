import 'package:fitnest_x/data/model/daily_nutrition_data.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/meal_schedule/daily_nutrition_card.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _titleText = 'Today Meal Nutritions';

class DailyNutritionSection extends StatelessWidget {
  const DailyNutritionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = DataMockUtils.getMockDailyNutrition();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle.noAction(text: _titleText),
        AppWhiteSpace.value15.vertical,
        ..._buildContent(context, data)
      ],
    );
  }

  List<Widget> _buildContent(
      BuildContext context, List<DailyNutritionData> data) {
    final result = <Widget>[];

    for (int i = 0; i < data.length; i++) {
      result.add(DailyNutritionCard(data: data[i]));
      if (i != data.length - 1) {
        result.add(AppWhiteSpace.value15.vertical);
      }
    }
    return result;
  }
}
