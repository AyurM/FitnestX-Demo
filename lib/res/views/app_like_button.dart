import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

const _kButtonSize = 32.0;
const _kIconSize = 18.0;

class AppLikeButton extends StatelessWidget {
  final void Function()? onPressed;

  const AppLikeButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: _kButtonSize,
        height: _kButtonSize,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppBorderRadius.value8.value),
            boxShadow: const [AppColors.cardShadow]),
        child: RawMaterialButton(
            onPressed: onPressed,
            elevation: 0,
            highlightElevation: 0,
            constraints: const BoxConstraints(
                minWidth: _kButtonSize, minHeight: _kButtonSize),
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(AppBorderRadius.value8.value)),
            child: const Icon(AppIcons.heart_filled,
                color: AppColors.red, size: _kIconSize)),
      );
}
