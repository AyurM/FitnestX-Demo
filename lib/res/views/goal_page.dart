import 'package:fitnest_x/data/model/goal.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

class GoalPage extends StatelessWidget {
  final Goal goal;
  final double scale;

  const GoalPage({Key? key, required this.goal, this.scale = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        margin: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: constraints.maxHeight * 0.5 * (1 - scale) + 20),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: AppColors.purpleShadow,
                  offset: Offset(0, 10),
                  blurRadius: 10)
            ],
            borderRadius: BorderRadius.circular(AppBorderRadius.value22.value),
            gradient: AppColors.blueGradient),
        child: Column(children: [
          Expanded(
              child: Image.asset(goal.assetPath,
                  height: double.infinity, fit: BoxFit.contain)),
          AppWhiteSpace.value25.vertical,
          Text(
            goal.title,
            style: textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600, color: AppColors.white),
          ),
          AppWhiteSpace.value3.vertical,
          Container(
            width: 50,
            height: 1,
            color: AppColors.white,
          ),
          AppWhiteSpace.value20.vertical,
          Text(
            goal.subtitle,
            textAlign: TextAlign.center,
            style: textTheme.titleMedium?.copyWith(color: AppColors.white),
          )
        ]),
      );
    });
  }
}
