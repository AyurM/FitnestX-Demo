import 'dart:math';

import 'package:intl/intl.dart';

const _kMlText = 'ml';
const _kMinWaterIntakePerUpdate = 10;
const _kMaxWaterIntakePerUpdate = 70;
const _kMockStartHour = 6;

class WaterIntakeUpdate {
  final DateTime start;
  final DateTime? end;
  final int intakeInMl;

  static final DateFormat timeFormat = DateFormat('ha');
  static final Random _random = Random();

  const WaterIntakeUpdate({
    required this.start,
    this.end,
    required this.intakeInMl,
  });

  String get timeWindow =>
      '${timeFormat.format(start)} - ${end == null ? 'now' : timeFormat.format(end!)}'
          .toLowerCase();

  String get intake => '$intakeInMl$_kMlText';

  static List<WaterIntakeUpdate> generateMockIntakes(int length) {
    final now = DateTime.now();
    final result = <WaterIntakeUpdate>[];

    for (int i = 0; i < length; i++) {
      result.add(WaterIntakeUpdate(
          start:
              DateTime(now.year, now.month, now.day, _kMockStartHour + i * 2),
          end: i == length - 1
              ? null
              : DateTime(
                  now.year, now.month, now.day, _kMockStartHour + (i + 1) * 2),
          intakeInMl: _getRandomIntake()));
    }
    return result;
  }

  static int _getRandomIntake() =>
      10 *
      (_random.nextInt(_kMaxWaterIntakePerUpdate - _kMinWaterIntakePerUpdate) +
          _kMinWaterIntakePerUpdate);
}
