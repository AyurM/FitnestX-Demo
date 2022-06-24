import 'package:fitnest_x/data/model/meal_schedule_data.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_simple_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const _kImageSize = 60.0;
const _kBgOpacity = 0.2;
const _kAssetImageScale = 0.65;

class MealScheduleListItem extends StatelessWidget {
  static final _timeFormat = DateFormat('hh:mma');

  final MealScheduleData data;
  final Color imageBgColor;
  final void Function()? onPressed;

  const MealScheduleListItem(
      {Key? key,
      required this.data,
      required this.imageBgColor,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return RawMaterialButton(
      onPressed: onPressed ?? () {},
      padding: EdgeInsets.zero,
      elevation: 0,
      highlightElevation: 0,
      child: Row(children: [
        AppSimpleImage(
          assetPath: data.meal.assetPath,
          size: _kImageSize,
          color: imageBgColor,
          bgOpacity: _kBgOpacity,
          assetScale: _kAssetImageScale,
          borderRadius: AppBorderRadius.small.value,
        ),
        AppWhiteSpace.value10.horizontal,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.meal.name,
                style: textTheme.bodyText2?.copyWith(
                    color: AppColors.black, fontWeight: FontWeight.w600)),
            AppWhiteSpace.value3.vertical,
            Text(_timeFormat.format(data.dateTime).toLowerCase(),
                style:
                    textTheme.subtitle1?.copyWith(fontWeight: FontWeight.w500)),
          ],
        ),
        const Spacer(),
        AppWhiteSpace.value10.horizontal,
        const Icon(AppIcons.arrow_right_circle_outlined, color: AppColors.gray2)
      ]),
    );
  }
}
