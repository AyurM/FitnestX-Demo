import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const _kTodayText = 'Today';

class UpcomingWorkoutContent {
  static final DateFormat _dateFormat = DateFormat('MMMM dd');
  static final DateFormat _timeFormat = DateFormat('hh:mma');

  final int id;
  final String title;
  final String assetPath;
  final DateTime date;
  final bool sendNotification;
  final Color? color;

  const UpcomingWorkoutContent(
      {required this.id,
      required this.title,
      required this.assetPath,
      required this.date,
      required this.sendNotification,
      this.color});

  String get dateText =>
      '${_getDateText()}, ${_timeFormat.format(date).toLowerCase()}';

  String _getDateText() {
    final now = DateTime.now();
    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      return _kTodayText;
    }

    return _dateFormat.format(date);
  }
}
