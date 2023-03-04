import 'dart:math';
import 'dart:ui' as ui;

import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:fitnest_x/data/model/water_intake_update.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/views/app_card.dart';
import 'package:fitnest_x/res/views/card_title.dart';

const _titleText = 'Water Intake';
const _subtitleText = 'Real time updates';
const _kLitersText = 'Liters';
const _kWaterIntakeGraphWidth = 20.0;
const _kWaterIntakeUpdateItemHeight = 45.0;
const _kWaterUpdateDecorationWidth = 10.0;
const _kWaterUpdateDotRadius = 3.0;
const _kWaterUpdateDashLength = 4.0;
const _kWaterUpdateLastDotBlur = 5.0;
const _kPadding = EdgeInsets.fromLTRB(20, 20, 8, 20);

class WaterIntakeCard extends StatelessWidget {
  final int maxIntakeMl;
  final List<WaterIntakeUpdate> intakeUpdates;

  const WaterIntakeCard(
      {Key? key, required this.maxIntakeMl, required this.intakeUpdates})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final int totalIntake =
        intakeUpdates.fold(0, (prev, current) => prev + current.intakeInMl);

    return AppCard(
      padding: _kPadding,
      child: Row(
        children: [
          SizedBox(
              width: _kWaterIntakeGraphWidth,
              child: _WaterIntakeGraph(
                  intakePercent: (totalIntake / maxIntakeMl).clamp(0.0, 1.0))),
          AppWhiteSpace.value10.horizontal,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CardTitle(text: _titleText),
              AppWhiteSpace.value5.vertical,
              Text('${(totalIntake / 1000).toStringAsFixed(1)} $_kLitersText',
                  style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600, color: AppColors.blue2)),
              AppWhiteSpace.value10.vertical,
              Text(_subtitleText,
                  style: textTheme.titleMedium?.copyWith(fontSize: 10)),
              AppWhiteSpace.value5.vertical,
              Expanded(
                  child: _WaterIntakeUpdateList(intakeUpdates: intakeUpdates))
            ],
          ))
        ],
      ),
    );
  }
}

class _WaterIntakeGraph extends StatelessWidget {
  final double intakePercent;

  const _WaterIntakeGraph({Key? key, required this.intakePercent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_kWaterIntakeGraphWidth / 2),
      child: Stack(alignment: Alignment.topCenter, children: [
        Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.blue4, AppColors.purple],
                    begin: Alignment(0.5, 0.6),
                    end: Alignment.topCenter))),
        FractionallySizedBox(
          heightFactor: 1 - intakePercent,
          widthFactor: 1,
          child: Container(color: AppColors.borderColor),
        )
      ]),
    );
  }
}

class _WaterIntakeUpdateList extends StatelessWidget {
  final List<WaterIntakeUpdate> intakeUpdates;

  const _WaterIntakeUpdateList({Key? key, required this.intakeUpdates})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final int maxIntakes =
          (constraints.maxHeight / _kWaterIntakeUpdateItemHeight).floor();
      final int intakesToDisplay = min(intakeUpdates.length, maxIntakes);

      return Column(
        children: _buildChildren(intakesToDisplay),
      );
    });
  }

  List<Widget> _buildChildren(int intakesToDisplay) {
    final result = <Widget>[];

    for (int i = intakeUpdates.length - intakesToDisplay;
        i < intakeUpdates.length;
        i++) {
      result.add(_WaterIntakeUpdateItem(
          update: intakeUpdates[i], hasNext: i < intakeUpdates.length - 1));
    }
    return result;
  }
}

class _WaterIntakeUpdateItem extends StatelessWidget {
  final WaterIntakeUpdate update;
  final bool hasNext;

  const _WaterIntakeUpdateItem(
      {Key? key, required this.update, this.hasNext = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.titleMedium;

    return SizedBox(
      height: _kWaterIntakeUpdateItemHeight,
      child: Row(
        children: [
          SizedBox(
              width: _kWaterUpdateDecorationWidth,
              child: _WaterIntakeUpdateItemDecoration(hasNext: hasNext)),
          AppWhiteSpace.value8.horizontal,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(update.timeWindow,
                  style: textStyle?.copyWith(
                      fontSize: 10, color: AppColors.gray2)),
              Text(update.intake,
                  style: textStyle?.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.purple))
            ],
          ))
        ],
      ),
    );
  }
}

class _WaterIntakeUpdateItemDecoration extends StatelessWidget {
  final bool hasNext;

  const _WaterIntakeUpdateItemDecoration({Key? key, required this.hasNext})
      : super(key: key);

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _WaterIntakeUpdateItemPainter(hasNext: hasNext),
        size: Size.infinite,
      );
}

class _WaterIntakeUpdateItemPainter extends CustomPainter {
  final bool hasNext;

  const _WaterIntakeUpdateItemPainter({
    required this.hasNext,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final circlePaint = Paint()
      ..shader = ui.Gradient.linear(
          Offset(0, size.height / 2),
          Offset(size.width, size.height / 2),
          [AppColors.purple2, AppColors.purple]);

    final circleCenter = Offset(size.width / 2, size.width / 2 + 3);

    canvas.drawCircle(circleCenter, _kWaterUpdateDotRadius, circlePaint);
    if (hasNext) {
      _drawDashedLine(
          canvas: canvas,
          size: size,
          start:
              Offset(circleCenter.dx, circleCenter.dy + _kWaterUpdateDotRadius),
          linePaint: circlePaint);
    } else {
      canvas.drawCircle(
          circleCenter,
          _kWaterUpdateDotRadius,
          circlePaint
            ..imageFilter = ui.ImageFilter.blur(
                sigmaX: _kWaterUpdateLastDotBlur,
                sigmaY: _kWaterUpdateLastDotBlur,
                tileMode: TileMode.decal));
    }
  }

  void _drawDashedLine(
      {required Canvas canvas,
      required Size size,
      required Offset start,
      required Paint linePaint}) {
    final int totalDashes =
        ((size.height - start.dy) / (_kWaterUpdateDashLength * 2)).floor();

    for (int i = 0; i < totalDashes; i++) {
      canvas.drawLine(start.translate(0, _kWaterUpdateDashLength * (i * 2 + 1)),
          start.translate(0, 2 * _kWaterUpdateDashLength * (i + 1)), linePaint);
    }
  }

  @override
  bool shouldRepaint(_WaterIntakeUpdateItemPainter oldDelegate) =>
      hasNext != oldDelegate.hasNext;
}
