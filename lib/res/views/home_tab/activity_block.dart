import 'package:fitnest_x/res/views/app_card.dart';
import 'package:fitnest_x/res/views/home_tab/calories_card.dart';
import 'package:fitnest_x/res/views/home_tab/heart_rate_card.dart';
import 'package:fitnest_x/res/views/home_tab/sleep_card.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:flutter/material.dart';

const _titleText = 'Activity Status';
const _kSpacing = 15.0;
const _kSleepDuration = Duration(hours: 8, minutes: 20);
const _kTargetCalories = 990;
const _kConsumedCalories = 760;

class ActivityBlock extends StatelessWidget {
  const ActivityBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(text: _titleText),
          const SizedBox(height: _kSpacing),
          const HeartRateCard(),
          const SizedBox(height: _kSpacing),
          SizedBox(
            height: constraints.maxWidth,
            child: Row(
              children: [
                const Expanded(child: AppCard()),
                const SizedBox(width: _kSpacing),
                Expanded(
                    child: Column(
                  children: const [
                    Expanded(child: SleepCard(duration: _kSleepDuration)),
                    SizedBox(height: _kSpacing),
                    Expanded(
                        child: CaloriesCard(
                            consumedCalories: _kConsumedCalories,
                            targetCalories: _kTargetCalories)),
                  ],
                ))
              ],
            ),
          )
        ],
      );
    });
  }
}
