import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/daily_action_card.dart';
import 'package:fitnest_x/res/views/home_tab/activity_block.dart';
import 'package:fitnest_x/res/views/home_tab/bmi_card.dart';
import 'package:fitnest_x/res/views/home_tab/home_tab_header.dart';
import 'package:fitnest_x/screens/activity_tracker/activity_tracker_screen.dart';
import 'package:flutter/material.dart';

const _usernameText = 'Stefani Wong';
const _todayTargetText = 'Today Target';
const _bmiValue = 20.1;
const _kSpacing = 30.0;

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: kHorizontalPadding20,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const HomeTabHeader(
              username: _usernameText,
              hasNotifications: true,
            ),
            const SizedBox(height: _kSpacing),
            BmiCard(value: _bmiValue, onViewMorePressed: () {}),
            const SizedBox(height: _kSpacing),
            DailyActionCard(
                title: _todayTargetText,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ActivityTrackerScreen()))),
            const SizedBox(height: _kSpacing),
            const ActivityBlock(),
            const SizedBox(height: _kSpacing),
          ],
        ),
      ),
    );
  }
}
