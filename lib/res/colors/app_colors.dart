import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const blue = Color(0xFF92A3FD);
  static const blue2 = Color(0xFF9DCEFF);
  static const blueShadowColor = Color(0x4D95ADFE);
  static const purple = Color(0xFFC58BF2);
  static const purple2 = Color(0xFFEEA4CE);
  static const black = Color(0xFF1D1617);
  static const white = Color(0xFFFFFFFF);
  static const gray1 = Color(0xFF7B6F72);
  static const gray2 = Color(0xFFADA4A5);
  static const gray3 = Color(0xFFDDDADA);
  static const borderColor = Color(0xFFF7F8F8);

  static const primaryButtonGradient = LinearGradient(
      colors: [blue2, blue],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
}
