import 'package:fitnest_x/data/model/schedule_item_content.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/workout_schedule/workout_schedule_item.dart';
import 'package:fitnest_x/res/views/workout_schedule/workout_schedule_time_line.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:fitnest_x/utils/time_of_day_utils.dart';
import 'package:flutter/material.dart';

const _kHourHeight = 40.0;
const _kHourItemPadding = EdgeInsets.only(left: 30);
const _kBorderWidth = 0.8;
const _kTimeTextWidth = 42.0;
const _kScheduleItemLeftPosition = 120.0;
const _kStartTime = TimeOfDay(hour: 6, minute: 0);
const _kEndTime = TimeOfDay(hour: 20, minute: 0);

class WorkoutScheduleList extends StatefulWidget {
  final DateTime date;

  const WorkoutScheduleList({Key? key, required this.date}) : super(key: key);

  @override
  State<WorkoutScheduleList> createState() => _WorkoutScheduleListState();
}

class _WorkoutScheduleListState extends State<WorkoutScheduleList> {
  @override
  Widget build(BuildContext context) {
    final timeLinePosition = _calcTimePosition(DateTime(2022, 6, 19, 9, 45));
    final items = DataMockUtils.getMockScheduleItems();

    return Stack(
      children: [
        _buildTimeGrid(),
        ..._buildScheduleItems(items, timeLinePosition),
        if (timeLinePosition != null)
          Positioned(
              top: timeLinePosition - WorkoutScheduleTimeLine.dotRadius,
              left: 0,
              right: 0,
              child: const WorkoutScheduleTimeLine()),
      ],
    );
  }

  Widget _buildTimeGrid() => Column(
        children: [
          for (int i = 0; i <= _kEndTime.hour - _kStartTime.hour; i++)
            _HourItem(
              time: TimeOfDay(hour: _kStartTime.hour + i, minute: 0),
            )
        ],
      );

  List<Widget> _buildScheduleItems(
      List<ScheduleItemContent> items, double? timelinePosition) {
    final result = <Widget>[];

    for (int i = 0; i < items.length; i++) {
      final topPosition = _calcTimePosition(items[i].date);
      if (topPosition != null) {
        result.add(Positioned(
            top: topPosition,
            left: _kScheduleItemLeftPosition,
            child: WorkoutScheduleItem(
                data: items[i],
                completion: _calcScheduleItemCompletionPercent(
                    topPosition, timelinePosition))));
      }
    }

    return result;
  }

  double _calcScheduleItemCompletionPercent(
      double itemPosition, double? timelinePosition) {
    if (timelinePosition == null) {
      return 0.0;
    }

    if (timelinePosition > itemPosition + WorkoutScheduleItem.height) {
      return 1.0;
    }

    return (timelinePosition - itemPosition) / WorkoutScheduleItem.height;
  }

  double? _calcTimePosition(DateTime dateTime) {
    final now = TimeOfDay.fromDateTime(dateTime);
    if (now < _kStartTime || now > _kEndTime) {
      return null;
    }

    final totalListHeight =
        (_kEndTime.hour - _kStartTime.hour + 1) * _kHourHeight;

    final totalDuration =
        Duration(hours: _kEndTime.hour - _kStartTime.hour + 1);
    final elapsedDuration = Duration(
        hours: now.hour - _kStartTime.hour,
        minutes: now.minute - _kStartTime.minute);
    return (elapsedDuration.inSeconds / totalDuration.inSeconds) *
        totalListHeight;
  }
}

class _HourItem extends StatelessWidget {
  final TimeOfDay time;
  const _HourItem({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium;

    return Container(
      height: _kHourHeight,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          border: Border(
              top: time == _kStartTime
                  ? BorderSide.none
                  : const _HourBorderSide(),
              bottom: time == _kEndTime
                  ? BorderSide.none
                  : const _HourBorderSide())),
      child: Padding(
        padding: _kHourItemPadding,
        child: Row(
          children: [
            SizedBox(
              width: _kTimeTextWidth,
              child: Text(_getFormattedTime(), style: textStyle),
            ),
            AppWhiteSpace.value3.horizontal,
            Text(time.period.name.toUpperCase(), style: textStyle)
          ],
        ),
      ),
    );
  }

  String _getFormattedTime() {
    final hourString =
        '${time.hourOfPeriod < 10 ? '0' : ''}${time.hourOfPeriod}';
    final minuteString = '${time.minute < 10 ? '0' : ''}${time.minute}';

    return '$hourString:$minuteString';
  }
}

class _HourBorderSide extends BorderSide {
  const _HourBorderSide()
      : super(color: AppColors.borderColor, width: _kBorderWidth);
}
