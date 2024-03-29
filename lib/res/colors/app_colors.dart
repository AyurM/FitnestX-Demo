import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const blue = Color(0xFF92A3FD);
  static const blue2 = Color(0xFF9DCEFF);
  static const blue3 = Color(0xFF93A7FE);
  static const blue4 = Color(0xFFB4C0FE);
  static const purple = Color(0xFFC58BF2);
  static const purple2 = Color(0xFFEEA4CE);
  static const black = Color(0xFF1D1617);
  static const white = Color(0xFFFFFFFF);
  static const gray1 = Color(0xFF7B6F72);
  static const gray2 = Color(0xFFADA4A5);
  static const gray3 = Color(0xFFDDDADA);
  static const red = Color(0xFFFF0000);
  static const green = Color(0xFF42D742);
  static const borderColor = Color(0xFFF7F8F8);
  static const blueShadow = Color(0xFF95ADFE);
  static const purpleShadow = Color(0x4DC58BF2);
  static const cardShadowColor = Color(0x121D1617);

  static const blueGradient = LinearGradient(
      colors: [blue2, blue],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static const purpleGradient = LinearGradient(
      colors: [purple2, purple],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static const progressGradient = LinearGradient(
      colors: [purple, blue],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);

  static const cardShadow =
      BoxShadow(color: cardShadowColor, offset: Offset(0, 10), blurRadius: 40);

  static Gradient blueGradientWithOpacity(double opacity) => LinearGradient(
      colors: [blue2.withOpacity(opacity), blue.withOpacity(opacity)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static Gradient purpleGradientWithOpacity(double opacity) => LinearGradient(
      colors: [purple2.withOpacity(opacity), purple.withOpacity(opacity)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static const shimmerGradient = LinearGradient(
    colors: [
      blue2,
      blue,
      blue2,
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
  );
}
