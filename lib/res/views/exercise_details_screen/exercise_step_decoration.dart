import 'dart:ui' as ui;

import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

const _kDashLength = 5.0;
const _kStrokeWidth = 1.2;

class ExerciseStepDecoration extends StatelessWidget {
  final bool isLast;

  const ExerciseStepDecoration({Key? key, required this.isLast})
      : super(key: key);

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _ExerciseStepDecorationPainter(isLast),
        size: Size.infinite,
      );
}

class _ExerciseStepDecorationPainter extends CustomPainter {
  final bool isLast;

  _ExerciseStepDecorationPainter(this.isLast);

  @override
  void paint(Canvas canvas, Size size) {
    final double innerRadius = size.width / 4;
    final Offset circleCenter = Offset(size.width / 2, size.width / 2);

    final Paint paint = Paint()
      ..shader = ui.Gradient.linear(
          Offset(0, size.width / 2),
          Offset(size.width, size.width / 2),
          [AppColors.purple2, AppColors.purple]);

    canvas.drawCircle(circleCenter, innerRadius, paint);

    paint.style = ui.PaintingStyle.stroke;
    paint.strokeWidth = _kStrokeWidth;

    canvas.drawCircle(circleCenter, size.width / 2, paint);

    if (!isLast) {
      _drawDashedLine(
          canvas: canvas,
          size: size,
          start: Offset(size.width / 2, size.width),
          linePaint: paint);
    }
  }

  void _drawDashedLine(
      {required Canvas canvas,
      required Size size,
      required Offset start,
      required Paint linePaint}) {
    final int totalDashes =
        ((size.height - start.dy) / (_kDashLength * 2)).floor();

    for (int i = 0; i < totalDashes; i++) {
      canvas.drawLine(start.translate(0, _kDashLength * (i * 2 + 1)),
          start.translate(0, 2 * _kDashLength * (i + 1)), linePaint);
    }
  }

  @override
  bool shouldRepaint(_ExerciseStepDecorationPainter oldDelegate) =>
      isLast != oldDelegate.isLast;
}
