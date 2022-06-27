import 'package:fitnest_x/data/model/workout/exercise_data.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:fitnest_x/res/views/workout_type_screen/exercise_card.dart';
import 'package:fitnest_x/screens/exercise_details_screen/exercise_details_screen.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _titleText = "Exercises";

class ExerciseBlock extends StatelessWidget {
  const ExerciseBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sets = DataMockUtils.getMockExerciseData();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle.simpleText(
            text: _titleText,
            subtitle: '${sets.length} Sets',
            context: context),
        AppWhiteSpace.value20.vertical,
        ..._buildSets(sets)
      ],
    );
  }

  List<Widget> _buildSets(List<List<ExerciseData>> sets) {
    final result = <Widget>[];

    for (int i = 0; i < sets.length; i++) {
      result.add(_ExerciseList(items: sets[i], setIndex: i + 1));
      if (i != sets.length - 1) {
        result.add(AppWhiteSpace.value20.vertical);
      }
    }

    return result;
  }
}

class _ExerciseList extends StatelessWidget {
  final List<ExerciseData> items;
  final int setIndex;

  const _ExerciseList({Key? key, required this.items, required this.setIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Set $setIndex',
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: AppColors.black, fontWeight: FontWeight.bold)),
        AppWhiteSpace.value15.vertical,
        ..._buildItems(context)
      ],
    );
  }

  List<Widget> _buildItems(BuildContext context) {
    final result = <Widget>[];

    for (int i = 0; i < items.length; i++) {
      result.add(ExerciseCard(
          data: items[i],
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ExerciseDetailsScreen(exercise: items[i])))));
      if (i != items.length - 1) {
        result.add(AppWhiteSpace.value15.vertical);
      }
    }

    return result;
  }
}
