import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/workout_details_button.dart';
import 'package:flutter/material.dart';

const _titleText = 'Workout Details';
const _chooseWorkoutText = 'Choose Workout';
const _difficultyText = 'Difficulty';
const _repetitionsText = 'Custom Repetitions';
const _weightsText = 'Custom Weights';

class WorkoutDetailsSection extends StatelessWidget {
  const WorkoutDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kHorizontalPadding20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_titleText,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.black)),
          AppWhiteSpace.value10.vertical,
          WorkoutDetailsButton(
            iconData: AppIcons.barbel,
            title: _chooseWorkoutText,
            subtitle: 'Upperbody Workout',
            backgroundColor: AppColors.borderColor,
            onPressed: () {},
          ),
          AppWhiteSpace.value10.vertical,
          WorkoutDetailsButton(
            iconData: AppIcons.swap_outlined,
            title: _difficultyText,
            subtitle: 'Beginner',
            backgroundColor: AppColors.borderColor,
            onPressed: () {},
          ),
          AppWhiteSpace.value10.vertical,
          WorkoutDetailsButton(
            iconData: AppIcons.chart_outlined,
            title: _repetitionsText,
            backgroundColor: AppColors.borderColor,
            onPressed: () {},
          ),
          AppWhiteSpace.value10.vertical,
          WorkoutDetailsButton(
            iconData: AppIcons.chart_outlined,
            title: _weightsText,
            backgroundColor: AppColors.borderColor,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
