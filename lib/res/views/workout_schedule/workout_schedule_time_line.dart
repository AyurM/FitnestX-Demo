import 'dart:ui' as ui;

import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

const _kLineWidth = 1.0;
const _kSmallRadius = 1.5;
const _kLeftSpacing = 10.0;

class WorkoutScheduleTimeLine extends StatelessWidget {
  static const dotRadius = 3.5;

  const WorkoutScheduleTimeLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomPaint(
      painter: _TimeLinePainter(), size: const Size.fromHeight(dotRadius * 2));
}

class _TimeLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint circlePaint = Paint()
      ..shader = ui.Gradient.linear(
          const Offset(_kLeftSpacing, 0),
          Offset(_kLeftSpacing + WorkoutScheduleTimeLine.dotRadius * 2,
              size.height),
          [AppColors.blue, AppColors.blue2]);

    final circleCenter = Offset(
        _kLeftSpacing + WorkoutScheduleTimeLine.dotRadius, size.height / 2);
    canvas.drawCircle(circleCenter, _kSmallRadius, circlePaint);

    circlePaint.style = ui.PaintingStyle.stroke;
    circlePaint.strokeWidth = _kLineWidth;

    canvas.drawCircle(
        circleCenter, WorkoutScheduleTimeLine.dotRadius, circlePaint);
    canvas.drawLine(
        Offset(_kLeftSpacing + WorkoutScheduleTimeLine.dotRadius * 2,
            size.height / 2),
        Offset(size.width, size.height / 2),
        circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
