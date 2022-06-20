import 'package:fitnest_x/data/model/schedule_item_content.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/add_schedule/day_label.dart';
import 'package:fitnest_x/res/views/add_schedule/schedule_time_section.dart';
import 'package:fitnest_x/res/views/simple_app_scaffold.dart';
import 'package:flutter/material.dart';

const _titleText = 'Add Schedule';

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
        body: SingleChildScrollView(
          child: Column(children: [
            AppWhiteSpace.value30.vertical,
            Padding(
              padding: kHorizontalPadding20,
              child: DayLabel(day: day),
            ),
            AppWhiteSpace.value30.vertical,
            ScheduleTimeSection(onTimeChanged: _onTimeChanged)
          ]),
        ));
  }

  void _onTimeChanged(DateTime date) => debugPrint(date.toString());
}
