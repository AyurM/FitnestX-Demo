import 'package:fitnest_x/data/model/workout/workout_item_info.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

const _kImageScale = 0.6;

class WorkoutItemCard extends StatelessWidget {
  static const relativeItemWidth = 0.35;

  final WorkoutItemInfo itemInfo;

  const WorkoutItemCard({Key? key, required this.itemInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * relativeItemWidth;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              color: AppColors.borderColor,
              borderRadius:
                  BorderRadius.circular(AppBorderRadius.value12.value)),
          child: Center(
            child: Image.asset(
              itemInfo.assetPath,
              width: size * _kImageScale,
              height: size * _kImageScale,
              fit: BoxFit.contain,
            ),
          ),
        ),
        AppWhiteSpace.value10.vertical,
        Text(itemInfo.name,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.black))
      ],
    );
  }
}
