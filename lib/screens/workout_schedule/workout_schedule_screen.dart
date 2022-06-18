import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/simple_app_scaffold.dart';
import 'package:fitnest_x/res/views/workout_schedule/workout_schedule_date_picker.dart';
import 'package:flutter/material.dart';

const _titleText = 'Workout Schedule';

class WorkoutScheduleScreen extends StatelessWidget {
  const WorkoutScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleAppScaffold(
        title: _titleText,
        body: SingleChildScrollView(
            child: Column(
          children: [
            AppWhiteSpace.value20.vertical,
            WorkoutScheduleDatePicker(
              initialDate: DateTime.now(),
              onSelect: (date) => debugPrint('Selected date: $date'),
              screenWidth: MediaQuery.of(context).size.width,
            ),
            AppWhiteSpace.value30.vertical,
          ],
        )));
  }
}
