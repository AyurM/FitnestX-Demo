import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

const _kIconButtonSize = 28.0;

class SecondaryButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Gradient? gradient;
  final Color? color;
  final double? height;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const SecondaryButton.withColor(
      {Key? key,
      required this.text,
      this.onPressed,
      this.height,
      this.textStyle,
      this.color = AppColors.white,
      this.padding,
      this.margin})
      : gradient = null,
        super(key: key);

  const SecondaryButton.purple(
      {Key? key,
      required this.text,
      this.onPressed,
      this.height,
      this.textStyle,
      this.padding,
      this.margin})
      : gradient = AppColors.purpleGradient,
        color = null,
        super(key: key);

  const SecondaryButton.blue(
      {Key? key,
      required this.text,
      this.onPressed,
      this.height,
      this.textStyle,
      this.padding,
      this.margin})
      : gradient = AppColors.blueGradient,
        color = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonHeight = height ?? kPrimaryButtonHeight;
    final buttonTextStyle = textStyle ?? Theme.of(context).textTheme.labelLarge;

    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(buttonHeight / 2),
        child: Stack(
          children: [
            SecondaryButtonDecoration(gradient: gradient, color: color),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: buttonTextStyle?.color ?? AppColors.white, padding: padding ?? kHorizontalPadding20,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: Size(0, buttonHeight),
                textStyle: buttonTextStyle,
              ),
              onPressed: onPressed,
              child: Text(text, maxLines: 1),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondaryIconButton extends StatelessWidget {
  final Icon icon;
  final void Function()? onPressed;
  final double? height;
  final EdgeInsets? padding;

  const SecondaryIconButton(
      {Key? key, required this.icon, this.onPressed, this.height, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          const SecondaryButtonDecoration(gradient: AppColors.blueGradient),
          TextButton(
            style: TextButton.styleFrom(
              padding: padding ?? kAllPadding5,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size.square(height ?? _kIconButtonSize),
            ),
            onPressed: onPressed,
            child: icon,
          ),
        ],
      ),
    );
  }
}

class SecondaryButtonDecoration extends StatelessWidget {
  final Gradient? gradient;
  final Color? color;

  const SecondaryButtonDecoration({Key? key, this.gradient, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Positioned.fill(
      child: DecoratedBox(
          decoration: BoxDecoration(gradient: gradient, color: color)));
}
