import 'package:fitnest_x/data/model/workout/latest_workout_content.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/home_tab/latest_workout_card.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _titleText = 'Latest Workout';
const _seeMoreText = 'See more';

class LatestWorkoutBlock extends StatelessWidget {
  const LatestWorkoutBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = DataMockUtils.getMockLatestWorkoutContent();

    return Column(
      children: [
        SectionTitle.textButton(
            text: _titleText, actionText: _seeMoreText, context: context),
        AppWhiteSpace.value15.vertical,
        ..._buildItems(content)
      ],
    );
  }

  List<Widget> _buildItems(List<LatestWorkoutContent> content) {
    final result = <Widget>[];

    for (int i = 0; i < content.length; i++) {
      result.add(LatestWorkoutCard(data: content[i], onPressed: () {}));
      if (i != content.length - 1) {
        result.add(AppWhiteSpace.value15.vertical);
      }
    }

    return result;
  }
}
