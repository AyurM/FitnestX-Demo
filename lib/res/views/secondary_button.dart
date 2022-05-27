import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Gradient? gradient;
  final double? height;
  final TextStyle? textStyle;
  final EdgeInsets? margin;

  const SecondaryButton.purple(
      {Key? key,
      required this.text,
      this.onPressed,
      this.height,
      this.textStyle,
      this.margin})
      : gradient = AppColors.purpleGradient,
        super(key: key);

  const SecondaryButton.blue(
      {Key? key,
      required this.text,
      this.onPressed,
      this.height,
      this.textStyle,
      this.margin})
      : gradient = AppColors.blueGradient,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonHeight = height ?? kPrimaryButtonHeight;
    final buttonTextStyle = textStyle ?? Theme.of(context).textTheme.button;

    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(buttonHeight / 2),
        child: Stack(
          children: [
            _buildDecoration(buttonHeight),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: Size(0, buttonHeight),
                primary: buttonTextStyle?.color ?? AppColors.white,
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

  Widget _buildDecoration(double height) => Positioned.fill(
        child: Container(
          height: height,
          decoration: BoxDecoration(
            gradient: gradient,
          ),
        ),
      );
}