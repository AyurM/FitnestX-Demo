import 'package:fitnest_x/data/model/upcoming_workout_content.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_card.dart';
import 'package:fitnest_x/res/views/app_simple_image.dart';
import 'package:fitnest_x/res/views/app_switch_button.dart';
import 'package:flutter/material.dart';

const _kImageSize = 50.0;
const _kSpacing = 10.0;
const _kImageBgOpacity = 0.3;
const _kCardPadding = EdgeInsets.all(15);

class UpcomingWorkoutCard extends StatelessWidget {
  final UpcomingWorkoutContent data;
  final void Function(bool, int)? onToggleNotification;

  const UpcomingWorkoutCard(
      {Key? key, required this.data, this.onToggleNotification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = data.color ?? AppColors.blue2;
    final TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;

    return AppCard(
      borderRadius: kBorderRadiusMedium,
      padding: _kCardPadding,
      child: Row(children: [
        AppSimpleImage(
            assetPath: data.assetPath,
            size: _kImageSize,
            color: color,
            bgOpacity: _kImageBgOpacity),
        const SizedBox(width: _kSpacing),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle?.copyWith(
                    fontWeight: FontWeight.bold, color: AppColors.black)),
            const SizedBox(height: 5),
            Text(
              data.dateText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textStyle?.copyWith(fontSize: 10, color: AppColors.gray2),
            )
          ],
        )),
        const SizedBox(width: _kSpacing),
        AppSwitchButton(
          initialValue: data.sendNotification,
          onChanged: (value) => onToggleNotification?.call(value, data.id),
        )
      ]),
    );
  }
}
