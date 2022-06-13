import 'package:fitnest_x/res/views/home_tab/calories_card.dart';
import 'package:fitnest_x/res/views/home_tab/heart_rate_card.dart';
import 'package:fitnest_x/res/views/home_tab/sleep_card.dart';
import 'package:fitnest_x/res/views/home_tab/water_intake.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _titleText = 'Activity Status';
const _kSpacing = 15.0;
const _kSleepDuration = Duration(hours: 8, minutes: 20);
const _kMaxTotalWaterIntakeMl = 3000;
const _kMockIntakesLength = 5;

class ActivityBlock extends StatelessWidget {
  const ActivityBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle.noAction(text: _titleText),
          const SizedBox(height: _kSpacing),
          const HeartRateCard(),
          const SizedBox(height: _kSpacing),
          SizedBox(
            height: constraints.maxWidth,
            child: Row(
              children: [
                Expanded(
                    child: WaterIntakeCard(
                        maxIntakeMl: _kMaxTotalWaterIntakeMl,
                        intakeUpdates:
                            DataMockUtils.getMockIntakes(_kMockIntakesLength))),
                const SizedBox(width: _kSpacing),
                Expanded(
                    child: Column(
                  children: [
                    const Expanded(child: SleepCard(duration: _kSleepDuration)),
                    const SizedBox(height: _kSpacing),
                    Expanded(
                        child: CaloriesCard(
                            consumedCalories:
                                DataMockUtils.getMockConsumedCalories(),
                            targetCalories:
                                DataMockUtils.getMockTotalCalories())),
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
