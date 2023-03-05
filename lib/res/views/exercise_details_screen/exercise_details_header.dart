import 'package:fitnest_x/data/model/workout/exercise_data.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

class ExerciseDetailsHeader extends StatelessWidget {
  final ExerciseData exercise;

  const ExerciseDetailsHeader({Key? key, required this.exercise})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          exercise.title,
          style: textTheme.displaySmall,
        ),
        AppWhiteSpace.value3.vertical,
        Text(
          '${exercise.difficulty} | ${exercise.caloriesBurn} Calories Burn',
          style: textTheme.titleMedium,
        )
      ],
    );
  }
}
