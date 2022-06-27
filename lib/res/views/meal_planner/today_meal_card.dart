import 'package:fitnest_x/data/model/meal/today_meal_content.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_card.dart';
import 'package:fitnest_x/res/views/app_simple_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const _kCardPadding = EdgeInsets.symmetric(horizontal: 15, vertical: 20);
const _kImageSize = 50.0;
const _kImageAssetScale = 0.9;
const _kNotificationItemSize = 28.0;
const _kIconSize = 18.0;
const _kBgOpacity = 0.1;

class TodayMealCard extends StatelessWidget {
  static final DateFormat _dateFormat = DateFormat('h:mma');

  final TodayMealContent data;
  final void Function()? onPressed;

  const TodayMealCard({Key? key, required this.data, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return AppCard(
      borderRadius: AppBorderRadius.medium.value,
      padding: EdgeInsets.zero,
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
              assetPath: data.meal.assetPath,
              size: _kImageSize,
              assetScale: _kImageAssetScale,
              assetAlignment: Alignment.bottomCenter,
              color: AppColors.white,
              bgOpacity: 0.0),
          AppWhiteSpace.value20.horizontal,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.meal.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.black)),
              AppWhiteSpace.value3.vertical,
              Text(
                'Today | ${_dateFormat.format(data.date).replaceFirst(':00', '').toLowerCase()}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.subtitle1,
              )
            ],
          )),
          AppWhiteSpace.value8.horizontal,
          Container(
            height: _kNotificationItemSize,
            width: _kNotificationItemSize,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: AppColors.purpleGradientWithOpacity(_kBgOpacity)),
            child:
                _MealNotificationIcon(showNotification: data.showNotification),
          )
        ]),
      ),
    );
  }
}

class _MealNotificationIcon extends StatelessWidget {
  final bool showNotification;

  const _MealNotificationIcon({Key? key, required this.showNotification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconData = showNotification
        ? AppIcons.notification_outlined
        : AppIcons.notification_off_outlined;

    if (!showNotification) {
      return Icon(
        iconData,
        size: _kIconSize,
        color: AppColors.gray2,
      );
    }

    return SizedBox.square(
        dimension: _kIconSize,
        child: ShaderMask(
            shaderCallback: (rect) => AppColors.purpleGradient
                .createShader(Offset.zero & const Size.square(_kIconSize)),
            child: Icon(
              iconData,
              size: _kIconSize,
              color: AppColors.white,
            )));
  }
}
