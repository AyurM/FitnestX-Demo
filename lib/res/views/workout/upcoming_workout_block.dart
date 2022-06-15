import 'package:fitnest_x/data/model/upcoming_workout_content.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:fitnest_x/res/views/workout/upcoming_workout_card.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _titleText = 'Upcoming Workout';
const _actionText = 'See more';

class UpcomingWorkoutBlock extends StatelessWidget {
  const UpcomingWorkoutBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = DataMockUtils.getMockUpcomingWorkouts();

    return Column(
      children: [
        SectionTitle.textButton(
          text: _titleText,
          actionText: _actionText,
          context: context,
          onPressed: () {},
        ),
        AppWhiteSpace.value15.vertical,
        ..._buildContent(content)
      ],
    );
  }

  List<Widget> _buildContent(List<UpcomingWorkoutContent> content) {
    final result = <Widget>[];

    for (int i = 0; i < content.length; i++) {
      result.add(UpcomingWorkoutCard(
        data: content[i],
        onToggleNotification: _onToggleNotification,
      ));
      if (i != content.length - 1) {
        result.add(AppWhiteSpace.value15.vertical);
      }
    }
    return result;
  }

  void _onToggleNotification(bool sendNotification, int workoutId) => debugPrint(
      'Notification for workout #$workoutId is ${sendNotification ? 'on' : 'off'}');
}
