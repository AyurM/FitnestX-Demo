import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

const _kFabIconSize = 20.0;

class AppFab extends StatelessWidget {
  final void Function() onPressed;

  final Offset offset;
  final Gradient gradient;
  final Color shadowColor;
  final IconData icon;
  final double? height;

  const AppFab.search({Key? key, required this.onPressed, this.height})
      : offset = const Offset(0, (kPrimaryButtonHeight / 2 - kFabTopOffset)),
        gradient = AppColors.blueGradient,
        shadowColor = AppColors.blueShadow,
        icon = AppIcons.search_outlined,
        super(key: key);

  const AppFab.add(
      {Key? key,
      required this.onPressed,
      this.icon = Icons.add,
      this.height,
      Offset? offset})
      : offset = offset ?? const Offset(-10, -10),
        gradient = AppColors.purpleGradient,
        shadowColor = AppColors.purpleShadow,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonHeight = height ?? kPrimaryButtonHeight;

    return Transform.translate(
      offset: offset,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size.square(buttonHeight),
              padding: EdgeInsets.zero,
              shadowColor: shadowColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonHeight / 2))),
          onPressed: onPressed,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(buttonHeight / 2),
              gradient: gradient,
            ),
            child: SizedBox.square(
              dimension: buttonHeight,
              child: Center(
                  child: Icon(
                icon,
                size: _kFabIconSize,
                color: Colors.white,
              )),
            ),
          )),
    );
  }
}
