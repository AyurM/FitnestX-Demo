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

class ActivityTrackerScreen extends StatelessWidget {
  final void Function()? onBackPressed;

  const ActivityTrackerScreen({Key? key, this.onBackPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleAppScaffold(
      title: _titleText,
      onBackPressed: onBackPressed,
      body: SingleChildScrollView(
          padding: kHorizontalPadding20,
          child: Column(
            children: [
              AppWhiteSpace.value30.vertical,
              const TodayTargetCard(),
              AppWhiteSpace.value30.vertical,
              SectionTitle.dropdown(
                  text: _activityProgressText,
                  dropdownText: _weeklyText,
                  onPressed: () {}),
              AppWhiteSpace.value15.vertical,
              const ActivityProgressCard(),
              AppWhiteSpace.value30.vertical,
              const LatestActivityBlock(),
              AppWhiteSpace.value30.vertical,
            ],
          )),
    );
  }
}
