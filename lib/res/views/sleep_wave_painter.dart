import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class SleepWavePainter extends CustomPainter {
  final double backgroundWaveOpacity;
  final double foregroundWaveOpacity;
  final double lineWidth;

  final List<Color>? backgroundWaveGradientColors;
  final List<Color>? foregroundWaveGradientColors;

  final Color? backgroundWaveColor;
  final Color? foregroundWaveColor;

  const SleepWavePainter.gradient(
      {required this.backgroundWaveOpacity,
      required this.foregroundWaveOpacity,
      required this.lineWidth,
      required this.backgroundWaveGradientColors,
      required this.foregroundWaveGradientColors})
      : assert(backgroundWaveGradientColors != null &&
            foregroundWaveGradientColors != null),
        backgroundWaveColor = null,
        foregroundWaveColor = null;

  const SleepWavePainter.color(
      {required this.backgroundWaveOpacity,
      required this.foregroundWaveOpacity,
      required this.lineWidth,
      required this.backgroundWaveColor,
      required this.foregroundWaveColor})
      : assert(backgroundWaveColor != null && foregroundWaveColor != null),
        backgroundWaveGradientColors = null,
        foregroundWaveGradientColors = null;

  @override
  void paint(Canvas canvas, Size size) {
    _drawCurves(
        canvas: canvas,
        size: size,
        curves: _getBackgroundWaves(size),
        gradientColors: backgroundWaveGradientColors,
        color: backgroundWaveColor,
        opacity: backgroundWaveOpacity);

    _drawCurves(
        canvas: canvas,
        size: size,
        curves: _getForegroundWaves(size),
        gradientColors: foregroundWaveGradientColors,
        color: foregroundWaveColor,
        opacity: foregroundWaveOpacity);
  }

  List<_SleepWave> _getBackgroundWaves(Size size) {
    final sleepCurve1 = _SleepWave(
        start: const Offset(0, 0.4),
        middle: const Offset(0.4, 0.45),
        end: const Offset(1, 0),
        quadraticControlPoint: const Offset(0.2, 0.3),
        cubitControlPoint1: const Offset(0.8, 0.75),
        cubitControlPoint2: const Offset(0.8, 0.05),
        size: size);

    final sleepCurve2 = _SleepWave(
        start: const Offset(0, 0.45),
        middle: const Offset(0.4, 0.5),
        end: const Offset(1, 0.05),
        quadraticControlPoint: const Offset(0.2, 0.32),
        cubitControlPoint1: const Offset(0.8, 0.85),
        cubitControlPoint2: const Offset(0.8, 0.08),
        size: size);

    final sleepCurve3 = _SleepWave(
        start: const Offset(0, 0.5),
        middle: const Offset(0.4, 0.6),
        end: const Offset(1, 0.08),
        quadraticControlPoint: const Offset(0.2, 0.38),
        cubitControlPoint1: const Offset(0.8, 0.98),
        cubitControlPoint2: const Offset(0.8, 0.12),
        size: size);

    final sleepCurve4 = _SleepWave(
        start: const Offset(0, 0.55),
        middle: const Offset(0.4, 0.65),
        end: const Offset(1, 0.12),
        quadraticControlPoint: const Offset(0.2, 0.42),
        cubitControlPoint1: const Offset(0.85, 1.1),
        cubitControlPoint2: const Offset(0.88, 0.15),
        size: size);

    return [sleepCurve1, sleepCurve2, sleepCurve3, sleepCurve4];
  }

  List<_SleepWave> _getForegroundWaves(Size size) {
    final sleepCurve1 = _SleepWave(
        start: const Offset(0, 0.2),
        middle: const Offset(0.4, 0.4),
        end: const Offset(1, 0.7),
        quadraticControlPoint: const Offset(0.2, 0.7),
        cubitControlPoint1: const Offset(0.8, -0.1),
        cubitControlPoint2: const Offset(0.6, 0.6),
        size: size);

    final sleepCurve2 = _SleepWave(
        start: const Offset(0, 0.25),
        middle: const Offset(0.4, 0.45),
        end: const Offset(1, 0.75),
        quadraticControlPoint: const Offset(0.2, 0.75),
        cubitControlPoint1: const Offset(0.8, -0.05),
        cubitControlPoint2: const Offset(0.55, 0.64),
        size: size);

    final sleepCurve3 = _SleepWave(
        start: const Offset(0, 0.32),
        middle: const Offset(0.45, 0.45),
        end: const Offset(1, 0.82),
        quadraticControlPoint: const Offset(0.2, 0.8),
        cubitControlPoint1: const Offset(0.77, 0.05),
        cubitControlPoint2: const Offset(0.55, 0.7),
        size: size);

    final sleepCurve4 = _SleepWave(
        start: const Offset(0, 0.38),
        middle: const Offset(0.48, 0.5),
        end: const Offset(1, 0.9),
        quadraticControlPoint: const Offset(0.2, 0.85),
        cubitControlPoint1: const Offset(0.72, 0.15),
        cubitControlPoint2: const Offset(0.52, 0.7),
        size: size);

    return [sleepCurve1, sleepCurve2, sleepCurve3, sleepCurve4];
  }

  void _drawCurves(
      {required Canvas canvas,
      required Size size,
      required List<_SleepWave> curves,
      List<Color>? gradientColors,
      Color? color,
      double opacity = 1}) {
    if (gradientColors == null && color == null) {
      throw 'Either gradientColors or color values must be provided';
    }

    final Paint paint = Paint();

    if (color != null) {
      paint.color = color.withOpacity(opacity);
    }

    if (gradientColors != null) {
      paint.shader = ui.Gradient.linear(
          Offset(0, size.height / 2),
          Offset(size.width, size.height / 2),
          gradientColors.map((c) => c.withOpacity(opacity)).toList());
    }

    paint
      ..style = ui.PaintingStyle.stroke
      ..strokeWidth = lineWidth;

    for (final curve in curves) {
      canvas.drawPath(curve.toPath(), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _SleepWave {
  final Offset start;
  final Offset middle;
  final Offset end;
  final Offset quadraticControlPoint;
  final Offset cubitControlPoint1;
  final Offset cubitControlPoint2;
  final Size size;

  const _SleepWave(
      {required this.start,
      required this.middle,
      required this.end,
      required this.quadraticControlPoint,
      required this.cubitControlPoint1,
      required this.cubitControlPoint2,
      required this.size});

  Path toPath() => Path()
    ..moveTo(size.width * start.dx, size.height * start.dy)
    ..quadraticBezierTo(
        size.width * quadraticControlPoint.dx,
        size.height * quadraticControlPoint.dy,
        size.width * middle.dx,
        size.height * middle.dy)
    ..cubicTo(
        size.width * cubitControlPoint1.dx,
        size.height * cubitControlPoint1.dy,
        size.width * cubitControlPoint2.dx,
        size.height * cubitControlPoint2.dy,
        size.width * end.dx,
        size.height * end.dy);
}
