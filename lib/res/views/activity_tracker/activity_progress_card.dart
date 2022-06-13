import 'package:fitnest_x/data/model/activity_progress_data.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _kProgressBarHeight = 135.0;
const _kLabelSpacing = 27.0;

class ActivityProgressCard extends StatelessWidget {
  const ActivityProgressCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progressData = DataMockUtils.getMockActivityProgressData();

    return Container(
      padding: kAllPadding20,
      decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: const [AppColors.cardShadow],
          borderRadius: BorderRadius.circular(kBorderRadiusLarge)),
      child: LayoutBuilder(builder: ((context, constraints) {
        final itemWidth = constraints.maxWidth / (progressData.length * 2 - 1);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildProgressItems(progressData, itemWidth),
        );
      })),
    );
  }

  List<Widget> _buildProgressItems(
      List<ActivityProgressData> items, double itemWidth) {
    final result = <Widget>[];
    for (int i = 0; i < items.length; i++) {
      result.add(_ActivityProgressDayItem(
        data: items[i],
        size: Size(itemWidth, _kProgressBarHeight),
        gradient:
            i % 2 == 0 ? AppColors.blueGradient : AppColors.purpleGradient,
      ));
    }

    return result;
  }
}

class _ActivityProgressDayItem extends StatelessWidget {
  final ActivityProgressData data;
  final Size size;
  final Gradient gradient;

  const _ActivityProgressDayItem(
      {Key? key,
      required this.data,
      required this.size,
      required this.gradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemHeight =
        size.height * (data.currentValue / data.targetValue).clamp(0.0, 1.0);

    return SizedBox(
      width: size.width,
      height: size.height + _kLabelSpacing,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                  color: AppColors.borderColor,
                  borderRadius: BorderRadius.circular(size.width / 2)),
            ),
          ),
          Positioned(
            top: size.height - itemHeight,
            child: Container(
              width: size.width,
              height: itemHeight,
              decoration: BoxDecoration(
                  gradient: gradient,
                  borderRadius: BorderRadius.circular(size.width / 2)),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Text(data.label,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1))
        ],
      ),
    );
  }
}
