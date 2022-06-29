import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/views/app_dropdown.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  final Widget? action;

  const SectionTitle.noAction({Key? key, required this.text})
      : action = null,
        super(key: key);

  SectionTitle.simpleText(
      {Key? key,
      required this.text,
      required String subtitle,
      required BuildContext context,
      TextStyle? textStyle})
      : action = Text(subtitle,
            style: textStyle ??
                Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: AppColors.gray2, fontWeight: FontWeight.w500)),
        super(key: key);

  SectionTitle.textButton(
      {Key? key,
      required this.text,
      required String actionText,
      required BuildContext context,
      void Function()? onPressed})
      : action = TextButton(
            onPressed: onPressed ?? () {},
            child: Text(actionText,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.gray2))),
        super(key: key);

  SectionTitle.dropdown(
      {Key? key,
      required this.text,
      required String dropdownText,
      void Function()? onPressed})
      : action = AppDropdown(title: dropdownText, onPressed: onPressed),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final titleWidget = Text(text,
        style: textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold));

    if (action == null) {
      return titleWidget;
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [titleWidget, action!]);
  }
}
