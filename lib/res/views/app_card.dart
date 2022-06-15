import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding;
  final double? borderRadius;

  const AppCard({Key? key, this.child, this.padding, this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: padding ?? kAllPadding20,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(
                borderRadius ?? AppBorderRadius.large.value),
            boxShadow: const [AppColors.cardShadow]),
        child: child,
      );
}
