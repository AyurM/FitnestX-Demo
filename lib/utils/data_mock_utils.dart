import 'dart:math';

import 'package:fitnest_x/data/model/notification_content.dart';
import 'package:fitnest_x/data/model/water_intake_update.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';

const _kMinWaterIntakePerUpdate = 10;
const _kMaxWaterIntakePerUpdate = 70;
const _kMockStartHour = 6;
const _kTargetCalories = 990;
const _kMinConsumedCalories = 30;
const _kMaxConsumedCalories = 80;

class DataMockUtils {
  DataMockUtils._();

  static final Random _random = Random();

  static List<WaterIntakeUpdate> getMockIntakes(int length) {
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

  static int getMockConsumedCalories() =>
      10 *
      (_random.nextInt(_kMaxConsumedCalories - _kMinConsumedCalories) +
          _kMinConsumedCalories);

  static int getMockTotalCalories() => _kTargetCalories;

  static List<NotificationContent> getMockNotifications() {
    return const [
      NotificationContent(
          message: 'Hey, it\'s time for lunch',
          date: 'About 1 minute ago',
          assetPath: 'assets/images/notification_4.png',
          color: AppColors.blue2),
      NotificationContent(
          message: 'Don\'t miss your Lowerbody Workout',
          date: 'About 3 hours ago',
          assetPath: 'assets/images/notification_1.png',
          color: AppColors.purple2),
      NotificationContent(
          message: 'Hey, let\'s add some meals for your breakfast',
          date: 'About 3 hours ago',
          assetPath: 'assets/images/notification_3.png',
          color: AppColors.blue2),
      NotificationContent(
          message: 'Congratulations, You have finished AB Workout',
          date: '29 May',
          assetPath: 'assets/images/notification_2.png',
          color: AppColors.blue2),
      NotificationContent(
          message: 'Hey, it\'s time for lunch',
          date: '8 April',
          assetPath: 'assets/images/notification_4.png',
          color: AppColors.blue2),
      NotificationContent(
          message: 'Oops, You have missed your Lowerbody Workout',
          date: '3 April',
          assetPath: 'assets/images/notification_1.png',
          color: AppColors.purple2),
    ];
  }
}
