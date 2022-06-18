import 'dart:math';

import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const _kDateItemSize = Size(60, 80);
const _kDateItemSpacing = 15.0;
const _kIconSize = 24.0;

class WorkoutScheduleDatePicker extends StatefulWidget {
  final DateTime? initialDate;
  final void Function(DateTime)? onSelect;
  final double screenWidth;

  const WorkoutScheduleDatePicker(
      {Key? key, this.initialDate, this.onSelect, required this.screenWidth})
      : super(key: key);

  @override
  State<WorkoutScheduleDatePicker> createState() =>
      _WorkoutScheduleDatePickerState();
}

class _WorkoutScheduleDatePickerState extends State<WorkoutScheduleDatePicker> {
  late final ScrollController scrollController;
  late final DateTime _initialDate;
  late DateTime displayedMonth;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    _initialDate = widget.initialDate ?? DateTime.now();
    selectedDate =
        DateTime(_initialDate.year, _initialDate.month, _initialDate.day);
    displayedMonth = DateTime(_initialDate.year, _initialDate.month, 1);
    scrollController =
        ScrollController(initialScrollOffset: _calcInitialPosition());
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _ScheduleMonthPicker(
            initialDate: _initialDate, onChanged: _onMonthSelect),
        AppWhiteSpace.value15.vertical,
        SizedBox(
          height: _kDateItemSize.height,
          child: ListView.separated(
              padding: kHorizontalPadding20,
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final date = DateTime(
                    displayedMonth.year, displayedMonth.month, index + 1);
                return _ScheduleDayItem(
                    date: date,
                    isSelected: selectedDate == date,
                    onSelect: _onDateSelect);
              },
              separatorBuilder: (context, index) =>
                  AppWhiteSpace.value15.horizontal,
              itemCount:
                  DateTime(displayedMonth.year, displayedMonth.month + 1, 0)
                      .day),
        )
      ],
    );
  }

  void _onMonthSelect(DateTime date) => setState(() => displayedMonth = date);

  void _onDateSelect(DateTime date) {
    widget.onSelect?.call(date);
    setState(() => selectedDate = date);
  }

  double _calcInitialPosition() => max(
      0.0,
      kHorizontalPadding20.left +
          (selectedDate.day - 1) * _kDateItemSize.width +
          (selectedDate.day - 1) * _kDateItemSpacing -
          widget.screenWidth / 2 +
          _kDateItemSize.width / 2);
}

class _ScheduleMonthPicker extends StatefulWidget {
  final DateTime initialDate;
  final void Function(DateTime)? onChanged;

  const _ScheduleMonthPicker(
      {Key? key, required this.initialDate, this.onChanged})
      : super(key: key);

  @override
  State<_ScheduleMonthPicker> createState() => __ScheduleMonthPickerState();
}

class __ScheduleMonthPickerState extends State<_ScheduleMonthPicker> {
  static final DateFormat _monthFormat = DateFormat('MMMM y');

  late DateTime displayedMonth;

  @override
  void initState() {
    super.initState();
    displayedMonth =
        DateTime(widget.initialDate.year, widget.initialDate.month, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            splashRadius: _kIconSize,
            onPressed: _prevMonth,
            icon: const Icon(
              Icons.chevron_left_sharp,
              color: AppColors.gray2,
            )),
        AppWhiteSpace.value30.horizontal,
        Text(_monthFormat.format(displayedMonth),
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: AppColors.gray2)),
        AppWhiteSpace.value30.horizontal,
        IconButton(
            splashRadius: _kIconSize,
            onPressed: _nextMonth,
            icon: const Icon(
              Icons.chevron_right_sharp,
              color: AppColors.gray2,
            )),
      ],
    );
  }

  void _prevMonth() {
    setState(() => displayedMonth =
        DateTime(displayedMonth.year, displayedMonth.month - 1, 1));
    widget.onChanged?.call(displayedMonth);
  }

  void _nextMonth() {
    setState(() => displayedMonth =
        DateTime(displayedMonth.year, displayedMonth.month + 1, 1));
    widget.onChanged?.call(displayedMonth);
  }
}

class _ScheduleDayItem extends StatelessWidget {
  static final DateFormat _weekdayFormat = DateFormat('E');

  final DateTime date;
  final bool isSelected;
  final void Function(DateTime)? onSelect;

  const _ScheduleDayItem(
      {Key? key, required this.date, required this.isSelected, this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.subtitle1;
    final textColor = isSelected ? AppColors.white : AppColors.gray1;

    return GestureDetector(
      onTap: () => onSelect?.call(date),
      child: Container(
        width: _kDateItemSize.width,
        height: _kDateItemSize.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: isSelected ? AppColors.blueGradient : null,
            color: isSelected ? null : AppColors.borderColor),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_weekdayFormat.format(date),
                style: textStyle?.copyWith(color: textColor)),
            AppWhiteSpace.value10.vertical,
            Text(date.day.toString(),
                style: textStyle?.copyWith(
                    fontWeight: FontWeight.w600, color: textColor)),
          ],
        )),
      ),
    );
  }
}
