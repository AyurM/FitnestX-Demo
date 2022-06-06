import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  final String? actionText;
  final void Function()? onPressed;

  const SectionTitle(
      {Key? key, required this.text, this.actionText, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final titleWidget = Text(text,
        style: textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold));

    if (actionText == null) {
      return titleWidget;
    }

    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      titleWidget,
      TextButton(
          onPressed: onPressed ?? () {},
          child: Text(actionText!,
              style: textTheme.subtitle1?.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.gray2)))
    ]);
  }
}
