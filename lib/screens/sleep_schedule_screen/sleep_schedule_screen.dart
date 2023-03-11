import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_fab.dart';
import 'package:fitnest_x/res/views/simple_app_scaffold.dart';
import 'package:fitnest_x/res/views/sleep_schedule/sleep_banner.dart';
import 'package:fitnest_x/res/views/sleep_schedule/sleep_schedule_block.dart';
import 'package:fitnest_x/screens/add_alarm_screen/add_alarm_screen.dart';
import 'package:flutter/material.dart';

const _titleText = 'Sleep Schedule';

class SleepScheduleScreen extends StatelessWidget {
  const SleepScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleAppScaffold(
      title: _titleText,
      body: SingleChildScrollView(
        child: Column(children: [
          AppWhiteSpace.value30.vertical,
          Padding(
            padding: kHorizontalPadding20,
            child: SleepBanner(onPressed: () {}),
          ),
          AppWhiteSpace.value30.vertical,
          const SleepScheduleBlock(),
          AppWhiteSpace.value30.vertical,
        ]),
      ),
      floatingActionButton: AppFab.add(
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddAlarmScreen()))),
    );
  }
}
