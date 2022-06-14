import 'package:fitnest_x/data/model/workout_type_content.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:fitnest_x/res/views/workout/workout_type_card.dart';
import 'package:fitnest_x/screens/workout_type_screen/workout_type_screen.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _titleText = 'What Do You Want to Train';
const _kSpacing = 15.0;

class WorkoutTypesBlock extends StatelessWidget {
  const WorkoutTypesBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = DataMockUtils.getMockWorkoutTypes();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle.noAction(text: _titleText),
        const SizedBox(height: _kSpacing),
        ..._buildContent(context, content)
      ],
    );
  }

  List<Widget> _buildContent(
      BuildContext context, List<WorkoutTypeContent> content) {
    final result = <Widget>[];

    for (int i = 0; i < content.length; i++) {
      result.add(WorkoutTypeCard(
          data: content[i],
          onViewMorePressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      WorkoutTypeScreen(content: content[i])))));
      if (i != content.length - 1) {
        result.add(const SizedBox(height: _kSpacing));
      }
    }
    return result;
  }
}
