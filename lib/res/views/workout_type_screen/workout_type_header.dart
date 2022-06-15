import 'package:fitnest_x/data/model/workout_type_content.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

const _kButtonSize = 32.0;
const _kIconSize = 18.0;

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
                    textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold)),
            AppWhiteSpace.value5.vertical,
            Text(
                '${content.exercises} Exercises | ${content.duration.inMinutes}mins | ${content.caloriesBurn} Calories Burn',
                textAlign: TextAlign.start,
                style: textTheme.subtitle1),
          ],
        )),
        AppWhiteSpace.value15.horizontal,
        _LikeButton(onPressed: () {}),
      ],
    );
  }
}

class _LikeButton extends StatelessWidget {
  final void Function()? onPressed;

  const _LikeButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: _kButtonSize,
        height: _kButtonSize,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [AppColors.cardShadow]),
        child: RawMaterialButton(
            onPressed: onPressed,
            elevation: 0,
            highlightElevation: 0,
            constraints: const BoxConstraints(
                minWidth: _kButtonSize, minHeight: _kButtonSize),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: const Icon(AppIcons.heart_filled,
                color: AppColors.red, size: _kIconSize)),
      );
}
