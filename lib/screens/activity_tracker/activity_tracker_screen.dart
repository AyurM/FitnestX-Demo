import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/activity_tracker/today_target_card.dart';
import 'package:fitnest_x/res/views/simple_app_scaffold.dart';
import 'package:flutter/material.dart';

const _titleText = 'Activity Tracker';

class ActivityTrackerScreen extends StatelessWidget {
  const ActivityTrackerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleAppScaffold(
      title: _titleText,
      body: SingleChildScrollView(
          padding: kHorizontalPadding20,
          child: Column(
            children: const [SizedBox(height: 30), TodayTargetCard()],
          )),
    );
  }
}
