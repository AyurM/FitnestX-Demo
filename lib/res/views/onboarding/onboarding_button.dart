import 'dart:math';
import 'dart:ui' as ui;

import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

const _kFullCircleAnimDuration = Duration(milliseconds: 600);
const _kIconSize = 24.0;

class OnboardingButton extends StatefulWidget {
  static const totalSize = 60.0;
  static const buttonSize = 50.0;
  static const indicatorWidth = 2.0;

  final int totalPages;
  final int prevPage;
  final int currentPage;
  final void Function()? onPressed;

  const OnboardingButton(
      {Key? key,
      required this.totalPages,
      required this.prevPage,
      required this.currentPage,
      this.onPressed})
      : super(key: key);

  @override
  State<OnboardingButton> createState() => _OnboardingButtonState();
}

class _OnboardingButtonState extends State<OnboardingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late double prevCircleFraction;
  late double circleFraction;

  @override
  void initState() {
    super.initState();
    _calcFractions();
    animationController = AnimationController(
      vsync: this,
      duration: _calcAnimDuration(),
    );
    animationController.forward();
  }

  @override
  void didUpdateWidget(covariant OnboardingButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.totalPages != oldWidget.totalPages ||
        widget.currentPage != oldWidget.currentPage ||
        widget.prevPage != oldWidget.prevPage) {
      _calcFractions();
      animationController.duration = _calcAnimDuration();
      animationController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: OnboardingButton.totalSize,
      child: Stack(alignment: Alignment.center, children: [
        AnimatedBuilder(
            animation: animationController,
            builder: (context, child) => _OnboardingPageIndicator(
                circleFraction: prevCircleFraction +
                    (circleFraction - prevCircleFraction).abs() *
                        (circleFraction - prevCircleFraction).sign *
                        animationController.value)),
        _OnboardingRoundButton(onPressed: widget.onPressed)
      ]),
    );
  }

  void _calcFractions() {
    circleFraction = (widget.currentPage + 1) / widget.totalPages;
    prevCircleFraction = (widget.prevPage + 1) / widget.totalPages;
  }

  Duration _calcAnimDuration() =>
      _kFullCircleAnimDuration * (circleFraction - prevCircleFraction).abs();
}

class _OnboardingPageIndicator extends StatelessWidget {
  final double circleFraction;

  const _OnboardingPageIndicator({Key? key, required this.circleFraction})
      : super(key: key);

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _OnboardingButtonPainter(circleFraction: circleFraction),
        size: const Size.square(OnboardingButton.totalSize),
      );
}

class _OnboardingButtonPainter extends CustomPainter {
  final double circleFraction;
  Paint strokePaint;

  _OnboardingButtonPainter({required this.circleFraction})
      : strokePaint = Paint()
          ..color = AppColors.borderColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1;

  @override
  void paint(Canvas canvas, Size size) {
    _paintCircle(canvas, size);
    _paintIndicator(canvas, size);
  }

  void _paintCircle(Canvas canvas, Size size) =>
      canvas.drawCircle(size.center(Offset.zero), size.width / 2, strokePaint);

  void _paintIndicator(Canvas canvas, Size size) {
    Paint indicatorPaint = Paint()
      ..shader = ui.Gradient.linear(Offset.zero,
          Offset(size.width, size.height), [AppColors.blue2, AppColors.blue])
      ..strokeWidth = OnboardingButton.indicatorWidth
      ..strokeCap = ui.StrokeCap.round
      ..style = ui.PaintingStyle.stroke;

    canvas.drawArc(Offset.zero & size, -pi / 2, 2 * pi * circleFraction, false,
        indicatorPaint);
  }

  @override
  bool shouldRepaint(_OnboardingButtonPainter oldDelegate) =>
      oldDelegate.circleFraction != circleFraction;
}

class _OnboardingRoundButton extends StatelessWidget {
  final void Function()? onPressed;

  const _OnboardingRoundButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size.zero,
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(OnboardingButton.buttonSize / 2))),
      onPressed: onPressed,
      child: Ink(
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(OnboardingButton.buttonSize / 2),
            gradient: AppColors.blueGradient),
        child: const SizedBox.square(
          dimension: OnboardingButton.buttonSize,
          child: Center(
              child: Icon(
            Icons.chevron_right_sharp,
            size: _kIconSize,
            color: Colors.white,
          )),
        ),
      ));
}
