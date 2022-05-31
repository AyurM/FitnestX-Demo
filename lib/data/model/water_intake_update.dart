import 'package:intl/intl.dart';

const _kMlText = 'ml';

class WaterIntakeUpdate {
  final DateTime start;
  final DateTime? end;
  final int intakeInMl;

  static final DateFormat timeFormat = DateFormat('ha');

  const WaterIntakeUpdate({
    required this.start,
    this.end,
    required this.intakeInMl,
  });

  String get timeWindow =>
      '${timeFormat.format(start)} - ${end == null ? 'now' : timeFormat.format(end!)}'
          .toLowerCase();

  String get intake => '$intakeInMl$_kMlText';
}
