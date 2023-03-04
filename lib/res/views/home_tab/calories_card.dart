import 'dart:math';
import 'dart:ui' as ui;

import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_card.dart';
import 'package:fitnest_x/res/views/card_title.dart';
import 'package:flutter/material.dart';

const _titleText = 'Calories';
const _kCalText = 'kCal';
const _kCaloriesIndicatorWidth = 8.0;
const _kCaloriesIndicatorSpacing = 3.0;
const _kPadding = EdgeInsets.fromLTRB(20, 20, 20, 10);

class CaloriesCard extends StatelessWidget {
  final int consumedCalories;
  final int targetCalories;

  const CaloriesCard(
      {Key? key, required this.consumedCalories, required this.targetCalories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
        padding: _kPadding,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CardTitle(text: _titleText),
          AppWhiteSpace.value5.vertical,
          Text('$consumedCalories $_kCalText',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600, color: AppColors.blue2)),
          AppWhiteSpace.value8.vertical,
          Expanded(
              child: _CaloriesGraph(
                  consumedCalories: consumedCalories,
                  targetCalories: targetCalories))
        ]));
  }
}

class _CaloriesGraph extends StatelessWidget {
  final int consumedCalories;
  final int targetCalories;

  const _CaloriesGraph(
      {Key? key, required this.consumedCalories, required this.targetCalories})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
              painter: _CaloriesGraphPainter(
                  caloriesPercent: consumedCalories / targetCalories),
              size: Size.infinite),
          Text(
            '${targetCalories - consumedCalories}$_kCalText\nleft',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.white, fontSize: 9),
          )
        ],
      );
}

class _CaloriesGraphPainter extends CustomPainter {
  final double caloriesPercent;

  _CaloriesGraphPainter({required this.caloriesPercent});

  @override
  void paint(Canvas canvas, Size size) {
    final innerCircleRadius =
        size.height / 2 - _kCaloriesIndicatorWidth - _kCaloriesIndicatorSpacing;
    final innerCircleCenter = size.center(Offset.zero);

    final indicatorRadius = innerCircleRadius +
        _kCaloriesIndicatorSpacing +
        _kCaloriesIndicatorWidth / 2;

    _drawInnerCircle(
        canvas: canvas,
        size: size,
        center: innerCircleCenter,
        radius: innerCircleRadius);

    _drawIndicatorBackground(
        canvas: canvas,
        size: size,
        center: innerCircleCenter,
        radius: indicatorRadius);

    _drawIndicator(
        canvas: canvas,
        size: size,
        center: innerCircleCenter,
        radius: indicatorRadius);
  }

  void _drawInnerCircle(
      {required Canvas canvas,
      required Size size,
      required Offset center,
      required double radius}) {
    final Paint innerCirclePaint = Paint()
      ..shader = ui.Gradient.linear(
          Offset(center.dx - radius, size.height / 2),
          Offset(center.dx + radius, size.height / 2),
          [AppColors.blue2, AppColors.blue]);
    canvas.drawCircle(center, radius, innerCirclePaint);
  }

  void _drawIndicatorBackground(
      {required Canvas canvas,
      required Size size,
      required Offset center,
      required double radius}) {
    final Paint indicatorBackgroundPaint = Paint()
      ..color = AppColors.borderColor
      ..style = ui.PaintingStyle.stroke
      ..strokeWidth = _kCaloriesIndicatorWidth;
    canvas.drawCircle(center, radius, indicatorBackgroundPaint);
  }

  void _drawIndicator(
      {required Canvas canvas,
      required Size size,
      required Offset center,
      required double radius}) {
    final Paint indicatorPaint = Paint()
      ..shader = ui.Gradient.linear(
          Offset(size.width / 2, size.height * -0.5),
          Offset(size.width / 2, size.height * 0.8),
          [AppColors.purple, AppColors.blue4])
      ..style = ui.PaintingStyle.stroke
      ..strokeWidth = _kCaloriesIndicatorWidth
      ..strokeCap = ui.StrokeCap.round;
    canvas.drawArc(
        Offset((size.width - size.height) / 2 + _kCaloriesIndicatorWidth / 2,
                _kCaloriesIndicatorWidth / 2) &
            Size.square(radius * 2),
        pi / 2,
        2 * pi * caloriesPercent.clamp(0.0, 1.0),
        false,
        indicatorPaint);
  }

  @override
  bool shouldRepaint(_CaloriesGraphPainter oldDelegate) =>
      caloriesPercent != oldDelegate.caloriesPercent;
}
