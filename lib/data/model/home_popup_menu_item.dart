import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:flutter/material.dart';

const _workoutTrackerText = 'Workout Tracker';
const _mealPlannerText = 'Meal Planner';
const _sleepTrackerText = 'Sleep Tracker';

enum HomePopupMenuItem {
  workout(iconData: AppIcons.chart_filled, title: _workoutTrackerText),
  mealPlanner(iconData: AppIcons.game_filled, title: _mealPlannerText),
  sleepTracker(iconData: AppIcons.discount_filled, title: _sleepTrackerText);

  final IconData iconData;
  final String title;

  const HomePopupMenuItem({required this.title, required this.iconData});
}
