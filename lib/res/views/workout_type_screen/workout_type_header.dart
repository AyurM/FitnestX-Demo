import 'package:fitnest_x/data/model/workout/workout_type_content.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_like_button.dart';
import 'package:flutter/material.dart';

class WorkoutTypeHeader extends StatelessWidget {
  final WorkoutTypeContent content;

  const WorkoutTypeHeader({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(content.title,
                style:
                    textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
            AppWhiteSpace.value5.vertical,
            Text(
                '${content.exercises} Exercises | ${content.duration.inMinutes}mins | ${content.caloriesBurn} Calories Burn',
                textAlign: TextAlign.start,
                style: textTheme.titleMedium),
          ],
        )),
        AppWhiteSpace.value15.horizontal,
        AppLikeButton(onPressed: () {}),
      ],
    );
  }
}
