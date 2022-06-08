import 'package:fitnest_x/data/model/workout_type_content.dart';
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

  const WorkoutTypeCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            AppColors.blue2.withOpacity(_kBgOpacity),
            AppColors.blue.withOpacity(_kBgOpacity)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Row(children: [
        Expanded(
          child: Padding(
            padding: kAllPadding20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.title,
                    style: textTheme.bodyText2?.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.black)),
                const SizedBox(height: 5),
                Text(
                    '${data.exercises} Exercises | ${data.duration.inMinutes}mins',
                    style: textTheme.subtitle1),
                const SizedBox(height: 15),
                SecondaryButton.withColor(
                  text: _viewMoreText,
                  onPressed: () {},
                  height: _kButtonHeight,
                  textStyle: textTheme.subtitle1?.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue2),
                )
              ],
            ),
          ),
        ),
        _WorkoutTypeImage(assetPath: data.imagePath),
        const SizedBox(width: 20)
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
