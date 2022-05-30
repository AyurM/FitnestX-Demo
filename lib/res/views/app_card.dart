import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

const _kDefaultPadding = EdgeInsets.all(20);

class AppCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding;

  const AppCard({Key? key, this.child, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: padding ?? _kDefaultPadding,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(kBorderRadiusLarge),
            boxShadow: const [
              BoxShadow(
                  color: AppColors.cardShadow,
                  offset: Offset(0, 10),
                  blurRadius: 30),
            ]),
        child: child,
      );
}
