import 'package:fitnest_x/data/model/schedule_item_content.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/views/workout_schedule/workout_schedule_item_dialog.dart';
import 'package:fitnest_x/screens/congratulations_screen/congratulations_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const _kPadding = EdgeInsets.symmetric(horizontal: 15);

class WorkoutScheduleItem extends StatelessWidget {
  static const height = 40.0;
  static final DateFormat _timeFormat = DateFormat('h:mma');

  final double completion;
  final ScheduleItemContent data;

  const WorkoutScheduleItem(
      {Key? key, required this.data, required this.completion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final adjustedCompletionPercent = completion.clamp(0.0, 1.0);
    final formattedTime =
        _timeFormat.format(data.date).toLowerCase().replaceFirst(':00', '');
    final text = '${data.title}, $formattedTime';

    return GestureDetector(
      onTap: () => _showScheduleItemDialog(context),
      child: SizedBox(
        height: height,
        width: double.maxFinite,
        child: Stack(
          children: [
            _WorkoutChip.top(
                heightFactor: adjustedCompletionPercent, text: text),
            _WorkoutChip.bottom(
                heightFactor: 1 - adjustedCompletionPercent, text: text),
          ],
        ),
      ),
    );
  }

  void _showScheduleItemDialog(BuildContext context) => showDialog(
      context: context,
      barrierColor: AppColors.black.withOpacity(0.2),
      builder: (context) => WorkoutScheduleItemDialog(
            data: data,
            onDone: (scheduleItem) => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CongratulationsScreen())),
          ));
}

class _WorkoutChip extends StatelessWidget {
  final String text;
  final double heightFactor;

  final Color? backgroundColor;
  final Gradient? gradient;
  final AlignmentGeometry alignment;
  final Color textColor;
  final double? top;
  final double? bottom;

  const _WorkoutChip.top(
      {Key? key, required this.text, required this.heightFactor})
      : backgroundColor = null,
        gradient = AppColors.purpleGradient,
        alignment = Alignment.topCenter,
        textColor = AppColors.white,
        top = 0,
        bottom = null,
        super(key: key);

  const _WorkoutChip.bottom(
      {Key? key, required this.text, required this.heightFactor})
      : backgroundColor = AppColors.borderColor,
        gradient = null,
        alignment = Alignment.bottomCenter,
        textColor = AppColors.gray1,
        top = null,
        bottom = 0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      top: top,
      child: IntrinsicWidth(
        child: ClipRect(
          child: Align(
            alignment: alignment,
            heightFactor: heightFactor,
            child: Container(
              alignment: Alignment.center,
              padding: _kPadding,
              height: WorkoutScheduleItem.height,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(WorkoutScheduleItem.height / 2),
                  color: backgroundColor,
                  gradient: gradient),
              child: Text(text,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: textColor)),
            ),
          ),
        ),
      ),
    );
  }
}
