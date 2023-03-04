import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Gradient? gradient;
  final double? height;
  final double? elevation;
  final TextStyle? textStyle;
  final EdgeInsets? margin;

  const PrimaryButton.blue(
      {Key? key,
      required this.text,
      this.onPressed,
      this.height,
      this.elevation,
      this.margin,
      this.textStyle})
      : gradient = AppColors.blueGradient,
        super(key: key);

  const PrimaryButton.purple(
      {Key? key,
      required this.text,
      this.onPressed,
      this.height,
      this.elevation,
      this.margin,
      this.textStyle})
      : gradient = AppColors.purpleGradient,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              elevation: elevation,
              shadowColor: AppColors.blueShadow,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(kPrimaryButtonHeight / 2))),
          onPressed: onPressed,
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kPrimaryButtonHeight / 2),
                gradient: gradient),
            child: SizedBox(
              height: height ?? kPrimaryButtonHeight,
              child: Center(
                  child: Text(text,
                      maxLines: 1,
                      style: textStyle ?? Theme.of(context).textTheme.labelLarge)),
            ),
          )),
    );
  }
}
