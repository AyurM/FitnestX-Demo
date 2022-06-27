import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_progress_bar.dart';
import 'package:flutter/material.dart';

const _kBgOpacity = 0.2;
const _kCardPadding = kAllPadding20;
const _youWillGetText = 'You will get ';
const _forTonightText = 'for tonight';
const _kProgressBarHeight = 15.0;

class SleepEstimateCard extends StatelessWidget {
  final Duration optimalSleepDuration;
  final Duration estimatedSleepDuration;

  const SleepEstimateCard(
      {Key? key,
      required this.optimalSleepDuration,
      required this.estimatedSleepDuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final digitTextStyle = textTheme.bodyText2
        ?.copyWith(color: AppColors.black, fontWeight: FontWeight.bold);
    final textStyle = textTheme.subtitle1?.copyWith(color: AppColors.black);

    return Container(
      padding: _kCardPadding,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppBorderRadius.large.value),
          gradient: AppColors.purpleGradientWithOpacity(_kBgOpacity)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(text: _youWillGetText, style: textStyle, children: [
              TextSpan(
                  text: estimatedSleepDuration.inHours.toString(),
                  style: digitTextStyle),
              TextSpan(text: ' hours ', style: textStyle),
              TextSpan(
                  text: (estimatedSleepDuration.inMinutes -
                          estimatedSleepDuration.inHours * 60)
                      .toString(),
                  style: digitTextStyle),
              TextSpan(text: ' minutes\n$_forTonightText', style: textStyle),
            ]),
          ),
          AppWhiteSpace.value10.vertical,
          AppProgressBar(
            completionPercent: (estimatedSleepDuration.inMinutes /
                    optimalSleepDuration.inMinutes)
                .clamp(0.0, 1.0),
            gradient: AppColors.purpleGradient,
            showPercent: true,
            height: _kProgressBarHeight,
          )
        ],
      ),
    );
  }
}
