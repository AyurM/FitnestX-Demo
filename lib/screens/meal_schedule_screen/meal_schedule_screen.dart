import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_date_picker.dart';
import 'package:fitnest_x/res/views/app_fab.dart';
import 'package:fitnest_x/res/views/meal_schedule/daily_nutrition_section.dart';
import 'package:fitnest_x/res/views/meal_schedule/meal_schedule_list.dart';
import 'package:fitnest_x/res/views/simple_app_scaffold.dart';
import 'package:flutter/material.dart';

const _titleText = 'Meal Schedule';

class MealScheduleScreen extends StatelessWidget {
  const MealScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return SimpleAppScaffold(
        title: _titleText,
        body: SingleChildScrollView(
            child: Column(
          children: [
            AppWhiteSpace.value20.vertical,
            AppDatePicker(
              initialDate: now,
              onSelect: (date) => debugPrint('Selected date: $date'),
              screenWidth: MediaQuery.of(context).size.width,
            ),
            AppWhiteSpace.value30.vertical,
            const Padding(
                padding: kHorizontalPadding20, child: MealScheduleList()),
            AppWhiteSpace.value30.vertical,
            const Padding(
                padding: kHorizontalPadding20, child: DailyNutritionSection()),
            AppWhiteSpace.value50.vertical,
          ],
        )),
        floatingActionButton: AppFab.add(onPressed: () {}));
  }
}
