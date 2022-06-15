import 'dart:ui' as ui;

import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_card.dart';
import 'package:fitnest_x/res/views/card_title.dart';
import 'package:flutter/material.dart';

const _titleText = 'Sleep';
const _kPurpleOpacity = 0.3;
const _kBlueOpacity = 0.8;
const _kLineWidth = 1.5;

class SleepCard extends StatelessWidget {
  final Duration duration;

  const SleepCard({Key? key, required this.duration}) : super(key: key);

  @override
  Widget build(BuildContext context) => AppCard(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CardTitle(text: _titleText),
          AppWhiteSpace.value5.vertical,
          _buildDurationText(context),
          AppWhiteSpace.value5.vertical,
          const Expanded(child: _SleepGraph())
        ]),
      );

  Widget _buildDurationText(BuildContext context) => Text(
      '${duration.inHours}h ${(duration - Duration(hours: duration.inHours)).inMinutes}m',
      style: Theme.of(context)
          .textTheme
          .bodyText2
          ?.copyWith(fontWeight: FontWeight.w600, color: AppColors.blue2));
}

class _SleepGraph extends StatelessWidget {
  const _SleepGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      CustomPaint(painter: _SleepGraphPainter(), size: Size.infinite);
}

class _SleepGraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    _drawCurves(
        canvas: canvas,
        size: size,
        curves: _getPurpleCurves(size),
        colors: [AppColors.purple2, AppColors.purple],
        opacity: _kPurpleOpacity);

    _drawCurves(
        canvas: canvas,
        size: size,
        curves: _getBlueCurves(size),
        colors: [AppColors.blue2, AppColors.blue],
        opacity: _kBlueOpacity);
  }

  List<_SleepCurve> _getPurpleCurves(Size size) {
    final sleepCurve1 = _SleepCurve(
        start: const Offset(0, 0.4),
        middle: const Offset(0.4, 0.45),
        end: const Offset(1, 0),
        quadraticControlPoint: const Offset(0.2, 0.3),
        cubitControlPoint1: const Offset(0.8, 0.75),
        cubitControlPoint2: const Offset(0.8, 0.05),
        size: size);

    final sleepCurve2 = _SleepCurve(
        start: const Offset(0, 0.45),
        middle: const Offset(0.4, 0.5),
        end: const Offset(1, 0.05),
        quadraticControlPoint: const Offset(0.2, 0.32),
        cubitControlPoint1: const Offset(0.8, 0.85),
        cubitControlPoint2: const Offset(0.8, 0.08),
        size: size);

    final sleepCurve3 = _SleepCurve(
        start: const Offset(0, 0.5),
        middle: const Offset(0.4, 0.6),
        end: const Offset(1, 0.08),
        quadraticControlPoint: const Offset(0.2, 0.38),
        cubitControlPoint1: const Offset(0.8, 0.98),
        cubitControlPoint2: const Offset(0.8, 0.12),
        size: size);

    final sleepCurve4 = _SleepCurve(
        start: const Offset(0, 0.55),
        middle: const Offset(0.4, 0.65),
        end: const Offset(1, 0.12),
        quadraticControlPoint: const Offset(0.2, 0.42),
        cubitControlPoint1: const Offset(0.85, 1.1),
        cubitControlPoint2: const Offset(0.88, 0.15),
        size: size);

    return [sleepCurve1, sleepCurve2, sleepCurve3, sleepCurve4];
  }

  List<_SleepCurve> _getBlueCurves(Size size) {
    final sleepCurve1 = _SleepCurve(
        start: const Offset(0, 0.2),
        middle: const Offset(0.4, 0.4),
        end: const Offset(1, 0.7),
        quadraticControlPoint: const Offset(0.2, 0.7),
        cubitControlPoint1: const Offset(0.8, -0.1),
        cubitControlPoint2: const Offset(0.6, 0.6),
        size: size);

    final sleepCurve2 = _SleepCurve(
        start: const Offset(0, 0.25),
        middle: const Offset(0.4, 0.45),
        end: const Offset(1, 0.75),
        quadraticControlPoint: const Offset(0.2, 0.75),
        cubitControlPoint1: const Offset(0.8, -0.05),
        cubitControlPoint2: const Offset(0.55, 0.64),
        size: size);

    final sleepCurve3 = _SleepCurve(
        start: const Offset(0, 0.32),
        middle: const Offset(0.45, 0.45),
        end: const Offset(1, 0.82),
        quadraticControlPoint: const Offset(0.2, 0.8),
        cubitControlPoint1: const Offset(0.77, 0.05),
        cubitControlPoint2: const Offset(0.55, 0.7),
        size: size);

    final sleepCurve4 = _SleepCurve(
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
      required List<_SleepCurve> curves,
      required List<Color> colors,
      double opacity = 1}) {
    final Paint paint = Paint()
      ..shader = ui.Gradient.linear(
          Offset(0, size.height / 2),
          Offset(size.width, size.height / 2),
          colors.map((c) => c.withOpacity(opacity)).toList())
      ..style = ui.PaintingStyle.stroke
      ..strokeWidth = _kLineWidth;

    for (final curve in curves) {
      canvas.drawPath(curve.toPath(), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _SleepCurve {
  final Offset start;
  final Offset middle;
  final Offset end;
  final Offset quadraticControlPoint;
  final Offset cubitControlPoint1;
  final Offset cubitControlPoint2;
  final Size size;

  const _SleepCurve(
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
