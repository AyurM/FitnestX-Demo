import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_progress_bar.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:flutter/material.dart';

const _progressText = 'Average Progress';
const _subtitleText = 'Good';
const _kProgressBarHeight = 20.0;

class AverageProgress extends StatelessWidget {
  final double percent;

  const AverageProgress({Key? key, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SectionTitle.simpleText(
              text: _progressText,
              subtitle: _subtitleText,
              textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.green, fontWeight: FontWeight.w500),
              context: context),
          AppWhiteSpace.value15.vertical,
          AppProgressBar(
            completionPercent: percent,
            showPercent: true,
            height: _kProgressBarHeight,
          )
        ],
      );
}
