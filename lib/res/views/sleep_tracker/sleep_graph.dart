import 'dart:ui' as ui;

import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/utils/interpolation_utils.dart';
import 'package:flutter/material.dart';

const _kGridLineWidth = 1.0;
const _kGraphLineWidth = 3.0;
const _kGridLineOpacity = 0.3;
const _kGridLineAmount = 6;
const _kGridLineVerticalPadding = 8.0;
const _kGraphInterpolationPoints = 12;
const _kMinDuration = Duration.zero;
const _kMaxDuration = Duration(hours: 10);
const _kGraphXPadding = 15.0;
const _kSelectedDotRadius = 3.5;
const _kDashLength = 4.0;

class SleepGraph extends StatefulWidget {
  final List<Duration> values;
  final void Function(int)? onValueSelected;

  const SleepGraph({Key? key, required this.values, this.onValueSelected})
      : super(key: key);

  @override
  State<SleepGraph> createState() => _SleepGraphState();
}

class _SleepGraphState extends State<SleepGraph> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onTapDown: (details) =>
                _onTouchGesture(details.localPosition.dx, constraints.maxWidth),
            onPanUpdate: (details) =>
                _onTouchGesture(details.localPosition.dx, constraints.maxWidth),
            child: CustomPaint(
              painter: _SleepGraphPainter(
                  values: widget.values, selectedIndex: selectedIndex),
              size: Size.infinite,
            ),
          );
        },
      );

  void _onTouchGesture(double gesturePositionX, double maxWidth) {
    final index = _calcSelectedIndex(gesturePositionX, maxWidth);
    widget.onValueSelected?.call(index);
    setState(() => selectedIndex = index);
  }

  int _calcSelectedIndex(double gesturePositionX, double maxWidth) {
    final clampedXPosition = gesturePositionX.clamp(0.0, maxWidth);
    final stepX = maxWidth / (widget.values.length - 1);
    return (clampedXPosition / stepX)
        .round()
        .clamp(0, widget.values.length - 1);
  }
}

class _SleepGraphPainter extends CustomPainter {
  final List<Duration> values;
  final int? selectedIndex;

  _SleepGraphPainter({required this.values, this.selectedIndex});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Offset.zero & size);
    _drawGridLines(canvas, size);

    final pxPerMinute = size.height / (_kMaxDuration - _kMinDuration).inMinutes;
    final graphPoints =
        _getGraphPoints(size, pxPerMinute, _kGraphInterpolationPoints);

    _drawGraph(canvas, size, graphPoints);
    _drawGraphGradient(canvas, size, graphPoints);

    if (selectedIndex != null) {
      _drawSelectedValue(canvas, size, pxPerMinute);
    }
  }

  void _drawGridLines(Canvas canvas, Size size) {
    final gridLinePaint = Paint()
      ..color = AppColors.gray2.withOpacity(_kGridLineOpacity)
      ..strokeWidth = _kGridLineWidth;

    final double gridLineSpacing =
        (size.height - _kGridLineVerticalPadding * 2) / (_kGridLineAmount - 1);

    for (int i = 0; i < _kGridLineAmount; i++) {
      final y = _kGridLineVerticalPadding + gridLineSpacing * i;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridLinePaint);
    }
  }

  void _drawGraph(Canvas canvas, Size size, List<Offset> points) {
    final Paint linePaint = Paint()
      ..shader = ui.Gradient.linear(Offset(0, -size.height * 1.2),
          Offset(size.width, size.height), [AppColors.blue2, AppColors.blue])
      ..strokeWidth = _kGraphLineWidth
      ..strokeJoin = ui.StrokeJoin.round
      ..style = ui.PaintingStyle.stroke;

    final Path path = Path()..moveTo(points[0].dx, points[0].dy);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    canvas.drawPath(path, linePaint);
  }

  List<Offset> _getGraphPoints(
      Size size, double pxPerMinute, int interpolationPoints) {
    final List<Offset> canvasPoints = [];

    final initialValues = values.map((e) => e.inMinutes.toDouble()).toList();
    final interpolatedValuesLength =
        values.length + (values.length - 1) * interpolationPoints;

    final xPixelsPerInterpolationPoint =
        (size.width - _kGraphXPadding * 2) / (interpolatedValuesLength - 1);

    //Чтобы построить график на всю доступную ширину, необходимо
    //рассчитать точки интерполяции не только между точками initialValues,
    //но и слева от initialValues[0], и справа от initialValues.last
    //на симметричном расстоянии extendValue.
    final extendValue = _kGraphXPadding /
        (xPixelsPerInterpolationPoint * (interpolationPoints + 1));
    final interpolatedValues = InterpolationUtils.getInterpolatedValues(
        input: initialValues,
        interpolationPoints: interpolationPoints,
        extendValue: extendValue);

    final yPixelValues = interpolatedValues
        .map((value) => size.height - value.dy * pxPerMinute)
        .toList();

    final xPixelsPerUnit =
        (size.width - _kGraphXPadding * 2) / (values.length - 1);

    for (int i = 0; i < yPixelValues.length; i++) {
      canvasPoints.add(Offset(
          xPixelsPerUnit * (interpolatedValues[i].dx + extendValue),
          yPixelValues[i]));
    }

    return canvasPoints;
  }

  void _drawGraphGradient(Canvas canvas, Size size, List<Offset> points) {
    final Paint gradientPaint = Paint()
      ..shader = ui.Gradient.linear(Offset(size.width / 2, -size.height * 1.1),
          Offset(size.width / 2, size.height * 1.1), [
        AppColors.blue3,
        AppColors.white,
      ], [
        0.3,
        0.95
      ]);

    final Path path = Path()
      ..addPolygon(points, false)
      ..lineTo(points.last.dx, size.height)
      ..lineTo(points.first.dx, size.height)
      ..close();
    canvas.drawPath(path, gradientPaint);
  }

  void _drawSelectedValue(Canvas canvas, Size size, double pxPerMinute) {
    final stepX = (size.width - _kGraphXPadding * 2) / (values.length - 1);

    final dotCenter = Offset(_kGraphXPadding + stepX * selectedIndex!,
        size.height - values[selectedIndex!].inMinutes * pxPerMinute);

    final Paint dotOuterPaint = Paint()
      ..color = AppColors.blue
      ..style = ui.PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final Paint dotInnerPaint = Paint()..color = AppColors.white;

    _drawDashedLine(
      canvas: canvas,
      size: size,
      start: dotCenter,
    );
    canvas.drawCircle(dotCenter, _kSelectedDotRadius, dotOuterPaint);
    canvas.drawCircle(dotCenter, _kSelectedDotRadius - 1.0, dotInnerPaint);
  }

  void _drawDashedLine(
      {required Canvas canvas, required Size size, required Offset start}) {
    final int totalDashes =
        ((size.height - start.dy) / (_kDashLength * 2)).floor();
    final Paint linePaint = Paint()..color = AppColors.blue;

    for (int i = 0; i < totalDashes; i++) {
      canvas.drawLine(start.translate(0, _kDashLength * (i * 2 + 1)),
          start.translate(0, 2 * _kDashLength * (i + 1)), linePaint);
    }
  }

  @override
  bool shouldRepaint(_SleepGraphPainter oldDelegate) =>
      values != oldDelegate.values ||
      selectedIndex != oldDelegate.selectedIndex;
}
