import 'dart:math';
import 'dart:ui' as ui;

import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

const _kMinYGraphSizeFactor = 0.8;
const _kMaxYGraphSizeFactor = 0.45;
const _kIndicatorRadius = 4.0;
const _kIndicatorBorderWidth = 2.0;
const _kInactiveOpacity = 0.2;
const _kGraphLineWidth = 2.0;

class HeartRateGraph extends StatelessWidget {
  final List<int> values;
  final int? selectedIndex;

  const HeartRateGraph({Key? key, required this.values, this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _HeartRateGraphPainter(
            values: values, selectedIndex: selectedIndex),
        size: Size.infinite,
      );
}

class _HeartRateGraphPainter extends CustomPainter {
  final List<int> values;
  final int? selectedIndex;

  _HeartRateGraphPainter({required this.values, this.selectedIndex});

  @override
  void paint(Canvas canvas, Size size) {
    if (values.isEmpty) {
      return;
    }

    final minYPosition = size.height * _kMinYGraphSizeFactor;
    final maxYPosition = size.height * _kMaxYGraphSizeFactor;
    final canvasPoints = _getCanvasPoints(size, minYPosition, maxYPosition);

    if (selectedIndex != null) {
      final highlightedPoints = canvasPoints.sublist(0, selectedIndex! + 1);
      _drawGraph(canvas, size, highlightedPoints);
      _drawGraph(canvas, size, canvasPoints.sublist(selectedIndex!),
          highlighted: false);
      _drawGraphGradient(
          canvas, size, highlightedPoints, minYPosition, maxYPosition);
      _drawDotIndicator(canvas, size, canvasPoints[selectedIndex!]);
      return;
    }

    _drawGraph(canvas, size, canvasPoints);
    _drawGraphGradient(canvas, size, canvasPoints, minYPosition, maxYPosition);
  }

  List<Offset> _getCanvasPoints(
      Size size, double minYPosition, double maxYPosition) {
    final List<Offset> canvasPoints = [];

    final int minValue =
        values.fold(values[0], (prev, element) => min(prev, element));

    final int maxValue =
        values.fold(values[0], (prev, element) => max(prev, element));

    final stepX = size.width / (values.length - 1);
    final stepY = (minYPosition - maxYPosition) / (maxValue - minValue);

    for (int i = 0; i < values.length; i++) {
      canvasPoints.add(
          Offset(i * stepX, minYPosition - (values[i] - minValue) * stepY));
    }
    return canvasPoints;
  }

  void _drawGraph(Canvas canvas, Size size, List<Offset> canvasPoints,
      {bool highlighted = true}) {
    final double opacity = highlighted ? 1 : _kInactiveOpacity;
    final Paint linePaint = Paint()
      ..shader = ui.Gradient.linear(
          Offset(0, size.height / 2), Offset(size.width, size.height / 2), [
        AppColors.blue2.withOpacity(opacity),
        AppColors.blue.withOpacity(opacity)
      ])
      ..strokeWidth = _kGraphLineWidth
      ..style = ui.PaintingStyle.stroke;
    canvas.drawPoints(ui.PointMode.polygon, canvasPoints, linePaint);
  }

  void _drawGraphGradient(Canvas canvas, Size size, List<Offset> canvasPoints,
      double minYPosition, double maxYPosition) {
    final Paint gradientPaint = Paint()
      ..shader = ui.Gradient.linear(Offset(size.width / 2, maxYPosition),
          Offset(size.width / 2, minYPosition), [
        AppColors.blue3.withOpacity(0.3),
        AppColors.blue3.withOpacity(0),
      ], [
        0.3,
        0.9
      ]);

    final Path path = Path()
      ..addPolygon(canvasPoints, false)
      ..lineTo(canvasPoints.last.dx, minYPosition)
      ..lineTo(0, minYPosition)
      ..close();
    canvas.drawPath(path, gradientPaint);
  }

  void _drawDotIndicator(Canvas canvas, Size size, Offset point) {
    final dotPaint = Paint()
      ..shader = ui.Gradient.linear(
          Offset(0, size.height / 2),
          Offset(size.width, size.height / 2),
          [AppColors.purple2, AppColors.purple]);
    final dotPaint2 = Paint()..color = AppColors.white;
    canvas.drawCircle(point, _kIndicatorRadius, dotPaint);
    canvas.drawCircle(
        point, _kIndicatorRadius - _kIndicatorBorderWidth, dotPaint2);
  }

  @override
  bool shouldRepaint(_HeartRateGraphPainter oldDelegate) =>
      oldDelegate.values != values ||
      oldDelegate.selectedIndex != selectedIndex;
}
