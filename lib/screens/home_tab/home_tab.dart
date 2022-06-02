import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/home_tab/activity_block.dart';
import 'package:fitnest_x/res/views/home_tab/bmi_card.dart';
import 'package:fitnest_x/res/views/home_tab/home_tab_header.dart';
import 'package:fitnest_x/res/views/home_tab/today_target_card.dart';
import 'package:fitnest_x/screens/workout_tracker/workout_screen.dart';
import 'package:flutter/material.dart';

const _usernameText = 'Stefani Wong';
const _bmiValue = 20.1;

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: kHorizontalPadding,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const HomeTabHeader(
              username: _usernameText,
              hasNotifications: true,
            ),
            const SizedBox(height: 30),
            BmiCard(value: _bmiValue, onViewMorePressed: () {}),
            const SizedBox(height: 30),
            TodayTargetCard(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WorkoutScreen()))),
            const SizedBox(height: 30),
            const ActivityBlock(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
