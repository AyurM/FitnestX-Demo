import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

const _kProgressBarHeight = 10.0;

class AppProgressBar extends StatelessWidget {
  final double completionPercent;
  final double? height;
  final Gradient? gradient;
  final bool showPercent;

  const AppProgressBar(
      {Key? key,
      required this.completionPercent,
      this.height,
      this.gradient,
      this.showPercent = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? _kProgressBarHeight,
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular((height ?? _kProgressBarHeight) / 2),
        child: LayoutBuilder(builder: (context, constraints) {
          final uncompletedProgressWidth =
              constraints.maxWidth * (1 - completionPercent.clamp(0.0, 1.0));

          return Stack(alignment: Alignment.center, children: [
            Container(
                decoration: BoxDecoration(
                    gradient: gradient ?? AppColors.progressGradient)),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                  width: uncompletedProgressWidth,
                  color: AppColors.borderColor),
            ),
            if (showPercent) _buildPercentLabel(context)
          ]);
        }),
      ),
    );
  }

  Widget _buildPercentLabel(BuildContext context) => Text(
        '${(completionPercent * 100).round()}%',
        style: Theme.of(context)
            .textTheme
            .button
            ?.copyWith(fontSize: 10, fontWeight: FontWeight.w500),
      );
}
