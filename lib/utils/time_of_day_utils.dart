import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  bool operator <(TimeOfDay other) {
    if (hour < other.hour) {
      return true;
    }
    if (hour == other.hour) {
      return minute < other.minute;
    }
    return false;
  }

  bool operator >(TimeOfDay other) {
    if (hour > other.hour) {
      return true;
    }
    if (hour == other.hour) {
      return minute > other.minute;
    }
    return false;
  }
}
