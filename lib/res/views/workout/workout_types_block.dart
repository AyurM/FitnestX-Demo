import 'package:fitnest_x/data/model/workout/workout_type_content.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:fitnest_x/res/views/workout/workout_type_card.dart';
import 'package:fitnest_x/screens/workout_type_screen/workout_type_screen.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _titleText = 'What Do You Want to Train';

class WorkoutTypesBlock extends StatelessWidget {
  const WorkoutTypesBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = DataMockUtils.getMockWorkoutTypes();
    if (content.isEmpty) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle.noAction(text: _titleText),
        AppWhiteSpace.value15.vertical,
        ..._buildContent(context, content)
      ],
    );
  }

  List<Widget> _buildContent(
      BuildContext context, List<WorkoutTypeContent> content) {
    final result = <Widget>[];
    result.addAll(content.map((c) => WorkoutTypeCard(
        data: c, onViewMorePressed: () => _onViewMorePressed(c, context))));
    result.add(AppWhiteSpace.value15.vertical);

    return result;
  }

  void _onViewMorePressed(WorkoutTypeContent content, BuildContext context) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => WorkoutTypeScreen(content: content)));
}
