import 'dart:math';
import 'dart:ui' as ui;

import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/secondary_button.dart';
import 'package:flutter/material.dart';

const _kCardHeight = 146.0;
const _kLargeDotRadius = 25.0;
const _kSmallDotRadius = 4.0;
const _kBmiCircleRadiusFactor = 0.83;
const _kButtonHeight = 35.0;

const _titleText = 'BMI (Body Mass Index)';
const _subtitleText = 'You have a normal weight';
const _buttonText = 'View More';

class BmiCard extends StatelessWidget {
  final double value;
  final void Function()? onViewMorePressed;

  const BmiCard({Key? key, required this.value, this.onViewMorePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: _kCardHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppBorderRadius.value22.value),
          gradient: AppColors.blueGradient,
          boxShadow: [
            BoxShadow(
                color: AppColors.blueShadow.withOpacity(0.3),
                offset: const Offset(0, 10),
                blurRadius: 22)
          ]),
      child: Stack(children: [
        const _BmiDotsBackground(
          dotColor: AppColors.white,
        ),
        Padding(
          padding: kAllPadding20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _titleText,
                    maxLines: 1,
                    style: textTheme.bodyText2?.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.white),
                  ),
                  Text(
                    _subtitleText,
                    maxLines: 1,
                    style:
                        textTheme.subtitle1?.copyWith(color: AppColors.white),
                  ),
                  AppWhiteSpace.value10.vertical,
                  SecondaryButton.purple(
                    text: _buttonText,
                    onPressed: onViewMorePressed,
                    height: _kButtonHeight,
                    textStyle: textTheme.button
                        ?.copyWith(fontSize: 10, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox.square(
                dimension: _kCardHeight - kAllPadding20.top * 2,
                child: _BmiPie(value: value),
              )
            ],
          ),
        )
      ]),
    );
  }
}

class _BmiDotsBackground extends StatelessWidget {
  final Color dotColor;

  const _BmiDotsBackground({Key? key, required this.dotColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) => CustomPaint(
      painter: _BmiDotsPainter(dotColor: AppColors.white), size: Size.infinite);
}

class _BmiDotsPainter extends CustomPainter {
  final Color dotColor;
  final Paint dotPaint;

  _BmiDotsPainter({required this.dotColor})
      : dotPaint = Paint()..color = dotColor.withOpacity(0.2);

  static const List<Offset> _largeDotOffsets = [
    Offset(0.95, 0.85),
    Offset(0.02, 0.96),
  ];

  static const List<Offset> _smallDotOffsets = [
    Offset(0.36, 0.11),
    Offset(0.54, 0.18),
    Offset(0.43, 0.75),
    Offset(0.57, 0.9),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    _drawDots(
        canvas: canvas,
        size: size,
        dotRadius: _kLargeDotRadius,
        relativeCenterOffsets: _largeDotOffsets);

    _drawDots(
        canvas: canvas,
        size: size,
        dotRadius: _kSmallDotRadius,
        relativeCenterOffsets: _smallDotOffsets);
  }

  void _drawDots(
      {required Canvas canvas,
      required Size size,
      required double dotRadius,
      required List<Offset> relativeCenterOffsets}) {
    for (final offset in relativeCenterOffsets) {
      canvas.drawCircle(Offset(size.width * offset.dx, size.height * offset.dy),
          dotRadius, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _BmiPie extends StatelessWidget {
  final double value;

  const _BmiPie({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        final circleRadius = constraints.maxHeight * _kBmiCircleRadiusFactor;

        return Stack(
          alignment: Alignment.center,
          children: [
            _buildBgCircle(circleRadius),
            CustomPaint(painter: _BmiPiePainter(), size: Size.infinite),
            _buildBmiLabel(constraints.maxWidth, context)
          ],
        );
      });

  Widget _buildBgCircle(double radius) => Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(radius / 2),
            boxShadow: const [AppColors.cardShadow]),
      );

  Widget _buildBmiLabel(double maxWidth, BuildContext context) {
    final position = maxWidth * (1 - _kBmiCircleRadiusFactor) / 2;
    return Positioned(
      right: position,
      top: position,
      child: SizedBox.square(
        dimension: maxWidth * _kBmiCircleRadiusFactor / 2,
        child: Center(
          child: Text(
            value.toStringAsFixed(1),
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.white),
          ),
        ),
      ),
    );
  }
}

class _BmiPiePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final piePaint = Paint()
      ..shader = ui.Gradient.linear(
          Offset.zero,
          Offset(size.width, size.height),
          [AppColors.purple2, AppColors.purple]);

    canvas.drawArc(Offset.zero & size, -0.55 * pi, 0.55 * pi, true, piePaint);
  }

  @override
  bool shouldRepaint(_BmiPiePainter oldDelegate) => false;
}
