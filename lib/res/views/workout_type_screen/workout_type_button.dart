import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

const _kIconSize = 22.0;
const _kButtonHeight = 50.0;
const _kPadding = EdgeInsets.all(15);

class WorkoutTypeButton extends StatelessWidget {
  final IconData iconData;
  final Gradient? gradient;
  final String title;
  final String? subtitle;
  final void Function()? onPressed;

  const WorkoutTypeButton(
      {Key? key,
      required this.iconData,
      required this.title,
      this.gradient,
      this.subtitle,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      height: _kButtonHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppBorderRadius.medium.value),
          gradient: gradient),
      child: RawMaterialButton(
          padding: _kPadding,
          onPressed: onPressed,
          elevation: 0,
          highlightElevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(AppBorderRadius.medium.value)),
          child: Row(
            children: [
              Icon(iconData, size: _kIconSize, color: AppColors.gray1),
              AppWhiteSpace.value10.horizontal,
              Text(title, style: textTheme.subtitle1),
              const Spacer(),
              if (subtitle != null) ...[
                Text(subtitle!,
                    style: textTheme.subtitle1?.copyWith(fontSize: 10)),
                AppWhiteSpace.value10.horizontal,
              ],
              const Icon(Icons.chevron_right_sharp,
                  size: _kIconSize, color: AppColors.gray1),
            ],
          )),
    );
  }
}
