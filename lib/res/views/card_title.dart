import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  final String text;

  const CardTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(text,
      style: Theme.of(context)
          .textTheme
          .subtitle1
          ?.copyWith(fontWeight: FontWeight.w600, color: AppColors.black));
}
