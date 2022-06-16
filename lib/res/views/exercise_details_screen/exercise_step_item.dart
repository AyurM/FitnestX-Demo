import 'package:fitnest_x/data/model/exercise_step.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/exercise_details_screen/exercise_step_decoration.dart';
import 'package:flutter/material.dart';

const _kLargeDotRadius = 10.0;
const _kStepNumberWidth = 20.0;

class ExerciseStepItem extends StatelessWidget {
  final ExerciseStep step;
  final int index;
  final bool isLast;

  const ExerciseStepItem(
      {Key? key, required this.step, required this.index, this.isLast = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: _kStepNumberWidth,
            child: Text('${index < 10 ? '0' : ''}$index',
                style: textTheme.bodyText2?.copyWith(color: AppColors.purple)),
          ),
          AppWhiteSpace.value15.horizontal,
          SizedBox(
              width: _kLargeDotRadius * 2,
              child: ExerciseStepDecoration(isLast: isLast)),
          AppWhiteSpace.value15.horizontal,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(step.title,
                    style:
                        textTheme.bodyText2?.copyWith(color: AppColors.black)),
                AppWhiteSpace.value3.vertical,
                Text(step.description, style: textTheme.subtitle1),
                AppWhiteSpace.value30.vertical,
              ],
            ),
          )
        ],
      ),
    );
  }
}
