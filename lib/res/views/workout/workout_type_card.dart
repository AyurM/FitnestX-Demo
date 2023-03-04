import 'package:fitnest_x/data/model/workout/workout_type_content.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/secondary_button.dart';
import 'package:flutter/material.dart';

const _kBgOpacity = 0.2;
const _kImageEllipseSize = 92.0;
const _kImageEllipseOpacity = 0.5;
const _kImageScale = 1.15;
const _kButtonHeight = 35.0;
const _viewMoreText = 'View more';

class WorkoutTypeCard extends StatelessWidget {
  final WorkoutTypeContent data;
  final void Function()? onViewMorePressed;

  const WorkoutTypeCard({Key? key, required this.data, this.onViewMorePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: AppColors.blueGradientWithOpacity(_kBgOpacity)),
      child: Row(children: [
        Expanded(
          child: Padding(
            padding: kAllPadding20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.title,
                    style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.black)),
                AppWhiteSpace.value5.vertical,
                Text(
                    '${data.exercises} Exercises | ${data.duration.inMinutes}mins',
                    style: textTheme.titleMedium),
                AppWhiteSpace.value15.vertical,
                SecondaryButton.withColor(
                  text: _viewMoreText,
                  onPressed: onViewMorePressed ?? () {},
                  height: _kButtonHeight,
                  textStyle: textTheme.titleMedium?.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue2),
                )
              ],
            ),
          ),
        ),
        _WorkoutTypeImage(assetPath: data.imagePath),
        AppWhiteSpace.value20.horizontal
      ]),
    );
  }
}

class _WorkoutTypeImage extends StatelessWidget {
  final String assetPath;

  const _WorkoutTypeImage({Key? key, required this.assetPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: _kImageEllipseSize,
          height: _kImageEllipseSize,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white.withOpacity(_kImageEllipseOpacity)),
        ),
        Image.asset(assetPath,
            height: _kImageEllipseSize * _kImageScale,
            width: _kImageEllipseSize * _kImageScale,
            fit: BoxFit.contain)
      ],
    );
  }
}
