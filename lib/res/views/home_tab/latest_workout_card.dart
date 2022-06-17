import 'package:fitnest_x/data/model/latest_workout_content.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_card.dart';
import 'package:fitnest_x/res/views/app_simple_image.dart';
import 'package:flutter/material.dart';

const _kImageHeight = 50.0;
const _kImageBgOpacity = 0.3;
const _kImageAssetScale = 0.8;
const _kIconSize = 24.0;
const _kProgressBarHeight = 10.0;
const _kCardPadding = EdgeInsets.fromLTRB(15, 15, 15, 10);

class LatestWorkoutCard extends StatelessWidget {
  final LatestWorkoutContent data;
  final void Function()? onPressed;

  const LatestWorkoutCard({Key? key, required this.data, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;

    return AppCard(
      padding: EdgeInsets.zero,
      borderRadius: AppBorderRadius.medium.value,
      child: RawMaterialButton(
        onPressed: onPressed ?? () {},
        padding: _kCardPadding,
        elevation: 0,
        highlightElevation: 0,
        fillColor: AppColors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.medium.value)),
        child: Row(children: [
          AppSimpleImage(
              assetPath: data.assetPath,
              assetScale: _kImageAssetScale,
              bgOpacity: _kImageBgOpacity,
              color: data.color,
              size: _kImageHeight),
          AppWhiteSpace.value10.horizontal,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle?.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.black)),
              AppWhiteSpace.value3.vertical,
              Text(
                '${data.caloriesBurn} Calories Burn | ${data.duration.inMinutes} minutes',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle?.copyWith(fontSize: 10),
              ),
              AppWhiteSpace.value10.vertical,
              _LatestWorkoutProgressBar(completionPercent: data.completed)
            ],
          )),
          AppWhiteSpace.value10.horizontal,
          const _NextIcon()
        ]),
      ),
    );
  }
}

class _LatestWorkoutProgressBar extends StatelessWidget {
  final double completionPercent;

  const _LatestWorkoutProgressBar({Key? key, required this.completionPercent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _kProgressBarHeight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_kProgressBarHeight / 2),
        child: LayoutBuilder(builder: (context, constraints) {
          final uncompletedProgressWidth =
              constraints.maxWidth * (1 - completionPercent.clamp(0.0, 1.0));

          return Stack(children: [
            Container(
                decoration:
                    const BoxDecoration(gradient: AppColors.progressGradient)),
            Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Container(
                    width: uncompletedProgressWidth,
                    color: AppColors.borderColor))
          ]);
        }),
      ),
    );
  }
}

class _NextIcon extends StatelessWidget {
  const _NextIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox.square(
      dimension: _kIconSize,
      child: ShaderMask(
          shaderCallback: (rect) => AppColors.purpleGradient
              .createShader(Offset.zero & const Size.square(_kIconSize)),
          child: const Icon(
            AppIcons.arrow_right_circle_outlined,
            size: _kIconSize,
            color: AppColors.white,
          )));
}
