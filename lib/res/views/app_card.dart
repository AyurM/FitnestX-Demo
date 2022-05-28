import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget? child;

  const AppCard({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
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
