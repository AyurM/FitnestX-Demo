import 'package:fitnest_x/data/model/schedule_item_content.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/add_schedule/day_label.dart';
import 'package:fitnest_x/res/views/add_schedule/workout_details_section.dart';
import 'package:fitnest_x/res/views/add_schedule/schedule_time_section.dart';
import 'package:fitnest_x/res/views/primary_button.dart';
import 'package:fitnest_x/res/views/simple_app_scaffold.dart';
import 'package:flutter/material.dart';

const _titleText = 'Add Schedule';
const _saveText = 'Save';

class AddScheduleScreen extends StatelessWidget {
  final DateTime day;
  final void Function(ScheduleItemContent)? onSave;

  const AddScheduleScreen({Key? key, required this.day, this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleAppScaffold(
        title: _titleText,
        leadingIcon: Icons.close,
        body: Column(children: [
          AppWhiteSpace.value30.vertical,
          Padding(
            padding: kHorizontalPadding20,
            child: DayLabel(day: day),
          ),
          AppWhiteSpace.value30.vertical,
          ScheduleTimeSection(onTimeChanged: _onTimeChanged),
          AppWhiteSpace.value30.vertical,
          const WorkoutDetailsSection(),
          const Spacer(),
          PrimaryButton.blue(
              text: _saveText, margin: kHorizontalPadding20, onPressed: () {}),
          AppWhiteSpace.value40.vertical,
        ]));
  }

  void _onTimeChanged(DateTime date) => debugPrint(date.toString());
}
