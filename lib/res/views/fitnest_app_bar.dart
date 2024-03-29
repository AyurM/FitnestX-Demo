import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

const _kAppBarButtonSize = 36.0;
const _kBorderRadius = 8.0;

class FitnestAppBar extends AppBar {
  final String text;
  final IconData? leadingIcon;
  final void Function()? onMorePressed;
  final void Function()? onBackPressed;
  final BuildContext context;
  final Color? bgColor;
  final Color? textColor;
  final Widget? customAction;

  FitnestAppBar(
      {Key? key,
      required this.text,
      required this.context,
      this.leadingIcon,
      this.bgColor,
      this.textColor,
      this.onBackPressed,
      this.onMorePressed,
      this.customAction})
      : super(
            key: key,
            leading: AppBarButton(
              iconData: leadingIcon ?? Icons.chevron_left_outlined,
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
              hasHorizontalPadding: true,
            ),
            actions: [
              if (customAction != null) customAction,
              AppBarButton(
                iconData: AppIcons.more,
                onPressed: onMorePressed ?? () {},
                hasHorizontalPadding: true,
              )
            ],
            title: Text(text));

  @override
  bool? get centerTitle => true;

  @override
  Color? get backgroundColor => bgColor ?? AppColors.white;

  @override
  double? get elevation => 0;

  @override
  double? get leadingWidth =>
      _kAppBarButtonSize +
      kHorizontalPadding20.left +
      kHorizontalPadding20.right;

  @override
  TextStyle? get titleTextStyle => Theme.of(context)
      .textTheme
      .headlineMedium
      ?.copyWith(fontSize: 16, color: textColor);
}

class AppBarButton extends StatelessWidget {
  final IconData iconData;
  final double? iconSize;
  final void Function()? onPressed;
  final bool hasHorizontalPadding;
  const AppBarButton(
      {Key? key,
      required this.iconData,
      this.iconSize,
      this.onPressed,
      this.hasHorizontalPadding = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: hasHorizontalPadding ? kHorizontalPadding20.left : 0,
            vertical: (kToolbarHeight - _kAppBarButtonSize) / 2),
        child: Ink(
          width: _kAppBarButtonSize,
          height: _kAppBarButtonSize,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_kBorderRadius),
              color: AppColors.borderColor),
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(_kBorderRadius),
            child: Center(
                child: Icon(
              iconData,
              size: iconSize,
              color: AppColors.black,
            )),
          ),
        ),
      );
}
