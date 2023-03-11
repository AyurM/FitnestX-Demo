import 'package:fitnest_x/data/model/meal/meal_schedule_data.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/meal_schedule/meal_schedule_list_item.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:fitnest_x/screens/meal_details_screen/meal_details_screen.dart';
import 'package:fitnest_x/utils/meal_time.dart';
import 'package:flutter/material.dart';

class MealScheduleSection extends StatelessWidget {
  final MealTime mealTime;

  final List<MealScheduleData> data;

  const MealScheduleSection(
      {Key? key, required this.mealTime, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalCalories = data.fold<int>(
        0, ((previousValue, element) => previousValue + element.meal.calories));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle.simpleText(
          text: mealTime.title,
          subtitle: '${data.length} meals | $totalCalories calories',
          context: context,
        ),
        AppWhiteSpace.value15.vertical,
        ..._buildContent(context, data)
      ],
    );
  }

  List<Widget> _buildContent(
      BuildContext context, List<MealScheduleData> data) {
    final result = <Widget>[];

    for (int i = 0; i < data.length; i++) {
      result.add(MealScheduleListItem(
          data: data[i],
          imageBgColor: i % 2 == 0 ? AppColors.blue : AppColors.purple,
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MealDetailsScreen(data: data[i].meal)))));
      if (i != data.length - 1) {
        result.add(AppWhiteSpace.value10.vertical);
      }
    }
    return result;
  }
}
