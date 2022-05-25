import 'package:fitnest_x/data/model/goal_page_content.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

class GoalPage extends StatelessWidget {
  final GoalPageContent content;
  final double scale;

  const GoalPage({Key? key, required this.content, this.scale = 1})
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
            borderRadius: BorderRadius.circular(22),
            gradient: AppColors.blueGradient),
        child: Column(children: [
          Expanded(
              child: Image.asset(content.assetPath,
                  height: double.infinity, fit: BoxFit.contain)),
          const SizedBox(height: 24),
          Text(
            content.title,
            style: textTheme.bodyText2
                ?.copyWith(fontWeight: FontWeight.w600, color: AppColors.white),
          ),
          const SizedBox(height: 3),
          Container(
            width: 50,
            height: 1,
            color: AppColors.white,
          ),
          const SizedBox(height: 20),
          Text(
            content.subtitle,
            textAlign: TextAlign.center,
            style: textTheme.subtitle1
                ?.copyWith(fontWeight: FontWeight.w400, color: AppColors.white),
          )
        ]),
      );
    });
  }
}
