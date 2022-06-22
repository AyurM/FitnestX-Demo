import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppGradientIcon extends StatelessWidget {
  final double size;
  final IconData iconData;

  const AppGradientIcon({Key? key, this.size = 24.0, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox.square(
      dimension: size,
      child: ShaderMask(
          shaderCallback: (rect) => AppColors.purpleGradient
              .createShader(Offset.zero & Size.square(size)),
          child: Icon(
            iconData,
            size: size,
            color: AppColors.white,
          )));
}
