import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

const _kFabIconSize = 20.0;

class AppFab extends StatelessWidget {
  final void Function() onPressed;

  const AppFab({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) => Transform.translate(
        offset: const Offset(0, (kPrimaryButtonHeight / 2 - kFabTopOffset)),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.square(kPrimaryButtonHeight),
                padding: EdgeInsets.zero,
                shadowColor: AppColors.blueShadow,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(kPrimaryButtonHeight / 2))),
            onPressed: onPressed,
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kPrimaryButtonHeight / 2),
                gradient: AppColors.blueGradient,
              ),
              child: const SizedBox.square(
                dimension: kPrimaryButtonHeight,
                child: Center(
                    child: Icon(
                  AppIcons.search_outlined,
                  size: _kFabIconSize,
                  color: Colors.white,
                )),
              ),
            )),
      );
}
