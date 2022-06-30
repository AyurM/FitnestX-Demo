import 'package:fitnest_x/data/model/meal/meal_data.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_card.dart';
import 'package:fitnest_x/res/views/app_simple_image.dart';
import 'package:fitnest_x/res/views/gradient_icon.dart';
import 'package:flutter/material.dart';

const _kCardPadding = EdgeInsets.symmetric(horizontal: 15, vertical: 20);
const _kImageSize = 50.0;
const _kImageAssetScale = 0.9;

class PopularMealCard extends StatelessWidget {
  final MealData data;
  final void Function()? onPressed;

  const PopularMealCard({Key? key, required this.data, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final String subtitle =
        '${data.difficulty} | ${data.cookDuration.inMinutes}mins | ${data.calories}kCal';

    return AppCard(
      borderRadius: AppBorderRadius.value16.value,
      padding: EdgeInsets.zero,
      child: RawMaterialButton(
        onPressed: onPressed ?? () {},
        padding: _kCardPadding,
        elevation: 0,
        highlightElevation: 0,
        fillColor: AppColors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.value16.value)),
        child: Row(children: [
          AppSimpleImage(
              assetPath: data.assetPath,
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
              Text(data.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.black)),
              AppWhiteSpace.value3.vertical,
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.subtitle1,
              )
            ],
          )),
          AppWhiteSpace.value8.horizontal,
          const AppGradientIcon(
            iconData: AppIcons.arrow_right_circle_outlined,
          )
        ]),
      ),
    );
  }
}
