import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_switch_button.dart';
import 'package:flutter/material.dart';

const _kIconSize = 22.0;
const _kButtonHeight = 50.0;
const _kSwitchSize = Size(44, 24);
const _kPadding = EdgeInsets.symmetric(horizontal: 15, vertical: 13);

enum _ButtonType { button, toggle }

class WorkoutDetailsButton extends StatelessWidget {
  final IconData iconData;
  final Gradient? gradient;
  final Color? backgroundColor;
  final String title;
  final String? subtitle;
  final void Function()? onPressed;
  final void Function(bool)? onToggle;
  final bool isOn;
  final _ButtonType _type;

  const WorkoutDetailsButton(
      {Key? key,
      required this.iconData,
      required this.title,
      this.gradient,
      this.backgroundColor,
      this.subtitle,
      this.onPressed})
      : assert((gradient != null && backgroundColor == null) ||
            (gradient == null && backgroundColor != null)),
        onToggle = null,
        isOn = false,
        _type = _ButtonType.button,
        super(key: key);

  const WorkoutDetailsButton.toggle(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.isOn,
      this.gradient,
      this.backgroundColor,
      this.subtitle,
      this.onToggle})
      : assert((gradient != null && backgroundColor == null) ||
            (gradient == null && backgroundColor != null)),
        onPressed = null,
        _type = _ButtonType.toggle,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      height: _kButtonHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppBorderRadius.value16.value),
          color: backgroundColor,
          gradient: gradient),
      child: RawMaterialButton(
          padding: _kPadding,
          onPressed: onPressed,
          elevation: 0,
          highlightElevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(AppBorderRadius.value16.value)),
          child: Row(
            children: [
              Icon(iconData, size: _kIconSize, color: AppColors.gray1),
              AppWhiteSpace.value10.horizontal,
              Text(title, style: textTheme.titleMedium),
              const Spacer(),
              if (subtitle != null) ...[
                Text(subtitle!,
                    style:
                        textTheme.titleSmall?.copyWith(color: AppColors.gray1)),
                AppWhiteSpace.value10.horizontal,
              ],
              if (_type == _ButtonType.button)
                const Icon(Icons.chevron_right_sharp,
                    size: _kIconSize, color: AppColors.gray1)
              else
                AppSwitchButton(
                    initialValue: isOn,
                    onChanged: onToggle,
                    width: _kSwitchSize.width,
                    height: _kSwitchSize.height)
            ],
          )),
    );
  }
}
