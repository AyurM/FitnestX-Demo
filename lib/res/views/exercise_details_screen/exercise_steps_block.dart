import 'package:fitnest_x/data/model/exercise_step.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/exercise_details_screen/exercise_step_item.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _titleText = 'How To Do It';

class ExerciseStepsBlock extends StatelessWidget {
  const ExerciseStepsBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final steps = DataMockUtils.getMockExerciseSteps();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionTitle.simpleText(
            text: _titleText,
            subtitle: '${steps.length} Steps',
            context: context),
        AppWhiteSpace.value15.vertical,
        ..._buildSteps(steps)
      ],
    );
  }

  List<Widget> _buildSteps(List<ExerciseStep> steps) {
    final result = <Widget>[];

    for (int i = 0; i < steps.length; i++) {
      result.add(ExerciseStepItem(
        step: steps[i],
        index: i + 1,
        isLast: i == steps.length - 1,
      ));
    }

    return result;
  }
}
