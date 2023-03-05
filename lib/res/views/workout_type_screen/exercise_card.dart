import 'package:fitnest_x/data/model/workout/exercise_data.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

const _kImageSize = 60.0;

class ExerciseCard extends StatelessWidget {
  final ExerciseData data;
  final void Function()? onPressed;

  const ExerciseCard({Key? key, required this.data, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return RawMaterialButton(
      onPressed: onPressed ?? () {},
      padding: EdgeInsets.zero,
      elevation: 0,
      highlightElevation: 0,
      child: Row(children: [
        Image.asset(data.assetPath,
            width: _kImageSize, height: _kImageSize, fit: BoxFit.cover),
        AppWhiteSpace.value10.horizontal,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.title,
                style: textTheme.bodyMedium?.copyWith(color: AppColors.black)),
            AppWhiteSpace.value3.vertical,
            Text(data.subtitle,
                style: textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500)),
          ],
        ),
        const Spacer(),
        AppWhiteSpace.value10.horizontal,
        const Icon(AppIcons.arrow_right_circle_outlined, color: AppColors.gray2)
      ]),
    );
  }
}
