import 'package:fitnest_x/data/model/meal/meal_category_data.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_simple_image.dart';
import 'package:fitnest_x/utils/card_color.dart';
import 'package:flutter/material.dart';

const _kCardBgOpacity = 0.2;
const _kImageSize = 40.0;
const _kImageAssetScale = 0.6;
const _kCardPadding = EdgeInsets.all(8);

class MealCategoryCard extends StatelessWidget {
  static const size = Size(80.0, 100.0);

  final MealCategoryData data;
  final void Function()? onPressed;

  final CardColor _color;

  const MealCategoryCard.blue({Key? key, required this.data, this.onPressed})
      : _color = CardColor.blue,
        super(key: key);

  const MealCategoryCard.purple({Key? key, required this.data, this.onPressed})
      : _color = CardColor.purple,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size.width,
        height: size.height,
        padding: _kCardPadding,
        decoration: BoxDecoration(
            gradient: _color.gradient(opacity: _kCardBgOpacity),
            borderRadius: BorderRadius.circular(AppBorderRadius.medium.value)),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppSimpleImage(
                assetPath: data.assetPath,
                assetScale: _kImageAssetScale,
                size: _kImageSize,
                bgOpacity: 1.0,
                color: AppColors.white),
            AppWhiteSpace.value10.vertical,
            Text(data.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: AppColors.black))
          ],
        )),
      ),
    );
  }
}
