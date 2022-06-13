import 'dart:math';

import 'package:fitnest_x/data/model/activity_progress_data.dart';
import 'package:fitnest_x/data/model/latest_activity_content.dart';
import 'package:fitnest_x/data/model/menu_item_data.dart';
import 'package:fitnest_x/data/model/notification_content.dart';
import 'package:fitnest_x/data/model/profile.dart';
import 'package:fitnest_x/data/model/today_target_item_content.dart';
import 'package:fitnest_x/data/model/upcoming_workout_content.dart';
import 'package:fitnest_x/data/model/water_intake_update.dart';
import 'package:fitnest_x/data/model/workout_type_content.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';

const _kMinWaterIntakePerUpdate = 10;
const _kMaxWaterIntakePerUpdate = 70;
const _kMockStartHour = 6;
const _kTargetCalories = 990;
const _kMinConsumedCalories = 30;
const _kMaxConsumedCalories = 80;
const _kMinActivityValue = 300;
const _kMaxActivityValue = 900;
const _kTargetActivityValue = 1000;

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

  static List<UpcomingWorkoutContent> getMockUpcomingWorkouts() {
    final now = DateTime.now();

    return [
      UpcomingWorkoutContent(
          id: 1,
          title: 'Fullbody Workout',
          date: DateTime(now.year, now.month, now.day, 15),
          assetPath: 'assets/images/notification_6.png',
          sendNotification: true,
          color: AppColors.blue2),
      UpcomingWorkoutContent(
          id: 2,
          title: 'Upperbody Workout',
          date: now.subtract(const Duration(days: 3)),
          assetPath: 'assets/images/notification_5.png',
          sendNotification: false,
          color: AppColors.purple2),
    ];
  }

  static List<WorkoutTypeContent> getMockWorkoutTypes() {
    return const [
      WorkoutTypeContent(
        title: 'Fullbody Workout',
        exercises: 11,
        duration: Duration(minutes: 32),
        imagePath: 'assets/images/fullbody_workout_type.png',
      ),
      WorkoutTypeContent(
        title: 'Lowerbody Workout',
        exercises: 12,
        duration: Duration(minutes: 40),
        imagePath: 'assets/images/lowerbody_workout_type.png',
      ),
      WorkoutTypeContent(
        title: 'AB Workout',
        exercises: 14,
        duration: Duration(minutes: 20),
        imagePath: 'assets/images/ab_workout_type.png',
      ),
    ];
  }

  static Profile getMockUserProfile() => const Profile(
      id: 1,
      firstName: 'Stefani',
      lastName: 'Wong',
      imagePath: 'assets/images/user.png',
      program: 'Lose a Fat',
      height: 180,
      weight: 65,
      age: 22);

  static List<MenuItemData> getMockAccountMenuItems() {
    return const [
      MenuItemData.simple(
          title: 'Personal Data', iconData: AppIcons.profile_outlined),
      MenuItemData.simple(
          title: 'Achievement', iconData: AppIcons.document_outlined),
      MenuItemData.simple(
          title: 'Activity History', iconData: AppIcons.graph_outlined),
      MenuItemData.simple(
          title: 'Workout Progress', iconData: AppIcons.chart_outlined),
    ];
  }

  static List<MenuItemData> getMockOtherMenuItems() {
    return const [
      MenuItemData.simple(
          title: 'Contact Us', iconData: AppIcons.message_outlined),
      MenuItemData.simple(
          title: 'Privacy Policy', iconData: AppIcons.shield_done_outlined),
      MenuItemData.simple(
          title: 'Settings', iconData: AppIcons.settings_outlined),
    ];
  }

  static List<MenuItemData> getMockNotificationMenuItems() {
    return const [
      MenuItemData.toggle(
          title: 'Pop-up Notifications',
          iconData: AppIcons.notification_outlined),
    ];
  }

  static List<TodayTargetItemContent> getMockTodayTargetItems() {
    return const [
      TodayTargetItemContent(
          name: 'Water Intake',
          value: 3,
          unit: 'L',
          imagePath: 'assets/images/today_target_1.png'),
      TodayTargetItemContent(
          name: 'Foot Steps',
          value: 2400,
          imagePath: 'assets/images/today_target_2.png'),
    ];
  }

  static List<ActivityProgressData> getMockActivityProgressData() {
    final labels = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    return labels
        .map((day) => ActivityProgressData(
            label: day,
            targetValue: _kTargetActivityValue,
            currentValue:
                _random.nextInt(_kMaxActivityValue - _kMinActivityValue) +
                    _kMinActivityValue))
        .toList();
  }

  static List<LatestActivityContent> getMockLatestActivityContent() {
    return const [
      LatestActivityContent(
          title: 'Drinking 300ml Water',
          subtitle: 'About 3 minutes ago',
          assetPath: 'assets/images/user.png',
          color: AppColors.blue2),
      LatestActivityContent(
          title: 'Eat Snack (Fitbar)',
          subtitle: 'About 10 minutes ago',
          assetPath: 'assets/images/snack.png',
          color: AppColors.purple2),
    ];
  }
}
