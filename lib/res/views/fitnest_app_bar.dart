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
  final BuildContext context;
  final Color? bgColor;
  final Color? textColor;

  FitnestAppBar(
      {Key? key,
      required this.text,
      required this.context,
      this.leadingIcon,
      this.bgColor,
      this.textColor,
      this.onMorePressed})
      : super(
            key: key,
            leading: AppBarButton(
              iconData: leadingIcon ?? Icons.chevron_left_outlined,
              onPressed: () => Navigator.of(context).pop(),
              hasHorizontalPadding: true,
            ),
            actions: [
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
      _kAppBarButtonSize + kHorizontalPadding.left + kHorizontalPadding.right;

  @override
  TextStyle? get titleTextStyle => Theme.of(context)
      .textTheme
      .headline4
      ?.copyWith(fontSize: 16, color: textColor);
}

class AppBarButton extends StatelessWidget {
  final IconData iconData;
  final void Function()? onPressed;
  final bool hasHorizontalPadding;
  const AppBarButton(
      {Key? key,
      required this.iconData,
      this.onPressed,
      this.hasHorizontalPadding = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: hasHorizontalPadding ? kHorizontalPadding.left : 0,
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
              color: AppColors.black,
            )),
          ),
        ),
      );
}
