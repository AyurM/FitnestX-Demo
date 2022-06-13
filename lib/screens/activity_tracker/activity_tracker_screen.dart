import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/activity_tracker/activity_progress_card.dart';
import 'package:fitnest_x/res/views/activity_tracker/latest_activity_block.dart';
import 'package:fitnest_x/res/views/activity_tracker/today_target_card.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:fitnest_x/res/views/simple_app_scaffold.dart';
import 'package:flutter/material.dart';

const _titleText = 'Activity Tracker';
const _activityProgressText = 'Activity Progress';
const _weeklyText = 'Weekly';
const _kSpacing = 30.0;

class ActivityTrackerScreen extends StatelessWidget {
  const ActivityTrackerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleAppScaffold(
      title: _titleText,
      body: SingleChildScrollView(
          padding: kHorizontalPadding20,
          child: Column(
            children: [
              const SizedBox(height: _kSpacing),
              const TodayTargetCard(),
              const SizedBox(height: _kSpacing),
              SectionTitle.dropdown(
                  text: _activityProgressText,
                  dropdownText: _weeklyText,
                  onPressed: () {}),
              const SizedBox(height: 15),
              const ActivityProgressCard(),
              const SizedBox(height: _kSpacing),
              const LatestActivityBlock(),
              const SizedBox(height: _kSpacing),
            ],
          )),
    );
  }
}
