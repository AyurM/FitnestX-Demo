import 'package:fitnest_x/data/model/stat_comparison_data.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

const _kBarHeight = 10.0;
const _kBarOpacity = 0.3;
const _kMaxValue = 100;

class ProgressComparisonBar extends StatelessWidget {
  final StatComparisonData data;

  const ProgressComparisonBar({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final clampedValue = data.value.clamp(0.0, 1.0);
    final leftValue = (clampedValue * _kMaxValue).round();
    final rightValue = _kMaxValue - leftValue;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(data.title,
            style: textTheme.bodySmall?.copyWith(color: AppColors.black)),
        AppWhiteSpace.value10.vertical,
        Row(
          children: [
            Text('$leftValue%', style: textTheme.titleMedium),
            AppWhiteSpace.value5.horizontal,
            Expanded(
                child: _ComparisonBar(
              leftValue: clampedValue,
            )),
            AppWhiteSpace.value5.horizontal,
            Text('$rightValue%', style: textTheme.titleMedium)
          ],
        )
      ],
    );
  }
}

class _ComparisonBar extends StatelessWidget {
  final double leftValue;

  const _ComparisonBar({Key? key, required this.leftValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _kBarHeight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_kBarHeight / 2),
        child: LayoutBuilder(builder: (context, constraints) {
          final leftWidth = constraints.maxWidth * leftValue;

          return Stack(children: [
            Container(
                decoration:
                    const BoxDecoration(gradient: AppColors.blueGradient)),
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(width: leftWidth, color: AppColors.white),
            ),
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                  width: leftWidth,
                  color: AppColors.red.withOpacity(_kBarOpacity)),
            ),
          ]);
        }),
      ),
    );
  }
}
