import 'package:fitnest_x/data/model/meal/meal_schedule_data.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/meal_schedule/meal_schedule_section.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:fitnest_x/utils/meal_time.dart';
import 'package:flutter/material.dart';

class MealScheduleList extends StatelessWidget {
  const MealScheduleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealSchedule = DataMockUtils.getMockMealSchedule();

    return Column(children: _buildSections(mealSchedule));
  }

  List<Widget> _buildSections(Map<MealTime, List<MealScheduleData>> map) {
    final result = <Widget>[];
    final list = map.entries.toList();
    for (int i = 0; i < list.length; i++) {
      result
          .add(MealScheduleSection(mealTime: list[i].key, data: list[i].value));
      if (i != list.length - 1) {
        result.add(AppWhiteSpace.value25.vertical);
      }
    }

    return result;
  }
}
