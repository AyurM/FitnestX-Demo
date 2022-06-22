import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

enum CardColor {
  blue,
  purple;

  Gradient gradient({double opacity = 1.0}) {
    switch (this) {
      case CardColor.blue:
        return AppColors.blueGradientWithOpacity(opacity);
      case CardColor.purple:
        return AppColors.purpleGradientWithOpacity(opacity);
    }
  }
}
