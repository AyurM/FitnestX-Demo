import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/daily_action_card.dart';
import 'package:fitnest_x/res/views/simple_app_scaffold.dart';
import 'package:fitnest_x/res/views/sleep_tracker/last_night_sleep_card.dart';
import 'package:fitnest_x/res/views/sleep_tracker/sleep_graph_card.dart';
import 'package:fitnest_x/res/views/sleep_tracker/today_sleep_schedule_block.dart';
import 'package:fitnest_x/screens/sleep_schedule_screen/sleep_schedule_screen.dart';
import 'package:flutter/material.dart';

const _titleText = 'Sleep Tracker';
const _sleepScheduleText = 'Daily Sleep Schedule';

class SleepTrackerScreen extends StatelessWidget {
  const SleepTrackerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleAppScaffold(
        title: _titleText,
        body: SingleChildScrollView(
          padding: kHorizontalPadding20,
          child: Column(
            children: [
              AppWhiteSpace.value30.vertical,
              const SleepGraphCard(),
              AppWhiteSpace.value30.vertical,
              const LastNightSleepCard(),
              AppWhiteSpace.value30.vertical,
              DailyActionCard(
                  title: _sleepScheduleText,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SleepScheduleScreen()))),
              AppWhiteSpace.value30.vertical,
              const TodaySleepScheduleBlock(),
              AppWhiteSpace.value30.vertical,
            ],
          ),
        ));
  }
}
