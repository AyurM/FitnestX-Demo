import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/primary_button.dart';
import 'package:fitnest_x/res/views/simple_app_scaffold.dart';
import 'package:fitnest_x/res/views/workout_details_button.dart';
import 'package:flutter/material.dart';

const _titleText = 'Add Alarm';
const _addText = 'Add';
const _bedtimeText = 'Bedtime';
const _bedtimeSubtitleText = '09:00 PM';
const _hoursText = 'Hours of sleep';
const _hoursSubtitleText = '8h 30m';
const _repeatText = 'Repeat';
const _repeatSubtitleText = 'Mon to Fri';
const _vibrateText = 'Vibrate When Alarm Sound';

class AddAlarmScreen extends StatelessWidget {
  const AddAlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleAppScaffold(
        title: _titleText,
        body: Padding(
          padding: kHorizontalPadding20,
          child: Column(
            children: [
              AppWhiteSpace.value30.vertical,
              WorkoutDetailsButton(
                iconData: AppIcons.bed,
                title: _bedtimeText,
                subtitle: _bedtimeSubtitleText,
                backgroundColor: AppColors.borderColor,
                onPressed: () {},
              ),
              AppWhiteSpace.value10.vertical,
              WorkoutDetailsButton(
                iconData: AppIcons.time_circle_outlined,
                title: _hoursText,
                subtitle: _hoursSubtitleText,
                backgroundColor: AppColors.borderColor,
                onPressed: () {},
              ),
              AppWhiteSpace.value10.vertical,
              WorkoutDetailsButton(
                iconData: AppIcons.repeat,
                title: _repeatText,
                subtitle: _repeatSubtitleText,
                backgroundColor: AppColors.borderColor,
                onPressed: () {},
              ),
              AppWhiteSpace.value10.vertical,
              WorkoutDetailsButton.toggle(
                iconData: AppIcons.vibrate,
                title: _vibrateText,
                backgroundColor: AppColors.borderColor,
                onToggle: (value) {},
                isOn: true,
              ),
              const Spacer(),
              PrimaryButton.blue(
                text: _addText,
                onPressed: Navigator.of(context).pop,
              ),
              AppWhiteSpace.value40.vertical,
            ],
          ),
        ));
  }
}
