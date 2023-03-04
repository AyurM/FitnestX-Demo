import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/add_schedule/app_time_picker.dart';
import 'package:flutter/material.dart';

const _titleText = 'Time';
const _kTimePickerHeight = 90.0;

class ScheduleTimeSection extends StatelessWidget {
  final void Function(DateTime)? onTimeChanged;

  const ScheduleTimeSection({Key? key, this.onTimeChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: kHorizontalPadding20,
          child: Text(_titleText,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.black, fontWeight: FontWeight.bold)),
        ),
        AppWhiteSpace.value10.vertical,
        SizedBox(
          height: _kTimePickerHeight,
          child: AppTimePicker(
            onDateTimeChanged: (date) => onTimeChanged?.call(date),
          ),
        )
      ],
    );
  }
}
