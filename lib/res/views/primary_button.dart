import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const PrimaryButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kHorizontalPadding,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shadowColor: AppColors.blueShadow,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(kPrimaryButtonHeight / 2))),
          onPressed: onPressed,
          child: Ink(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kPrimaryButtonHeight / 2),
                gradient: AppColors.blueGradient),
            child: SizedBox(
              height: kPrimaryButtonHeight,
              child: Center(
                  child: Text(text, style: Theme.of(context).textTheme.button)),
            ),
          )),
    );
  }
}
