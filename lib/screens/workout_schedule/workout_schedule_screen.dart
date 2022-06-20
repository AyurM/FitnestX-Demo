import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_fab.dart';
import 'package:fitnest_x/res/views/simple_app_scaffold.dart';
import 'package:fitnest_x/res/views/workout_schedule/workout_schedule_date_picker.dart';
import 'package:fitnest_x/res/views/workout_schedule/workout_schedule_list.dart';
import 'package:fitnest_x/screens/add_schedule_screen/add_schedule_screen.dart';
import 'package:flutter/material.dart';

const _titleText = 'Workout Schedule';

class WorkoutScheduleScreen extends StatelessWidget {
  const WorkoutScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return SimpleAppScaffold(
        title: _titleText,
        body: SingleChildScrollView(
            child: Column(
          children: [
            AppWhiteSpace.value20.vertical,
            WorkoutScheduleDatePicker(
              initialDate: now,
              onSelect: (date) => debugPrint('Selected date: $date'),
              screenWidth: MediaQuery.of(context).size.width,
            ),
            AppWhiteSpace.value30.vertical,
            WorkoutScheduleList(date: now),
            AppWhiteSpace.value30.vertical,
          ],
        )),
        floatingActionButton: AppFab.add(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddScheduleScreen(day: now)))));
  }
}
