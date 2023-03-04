import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

class HeartRateTimestamp extends StatelessWidget {
  final String text;

  const HeartRateTimestamp({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //     decoration: BoxDecoration(
    //         gradient: AppColors.purpleGradient,
    //         borderRadius: BorderRadius.circular(50)),
    //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    //     child: Text(text,
    //         style: Theme.of(context)
    //             .textTheme
    //             .subtitle1
    //             ?.copyWith(fontSize: 10, color: AppColors.white)));

    return _ClipShadowPath(
        shadow: const BoxShadow(
            color: AppColors.purpleShadow,
            blurRadius: 22,
            offset: Offset(0, 10)),
        clipper: _TimestampClipper(),
        child: Container(
            decoration: const BoxDecoration(gradient: AppColors.purpleGradient),
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: Text(text,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 10, color: AppColors.white))));
  }
}

class _ClipShadowPath extends StatelessWidget {
  final BoxShadow shadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  const _ClipShadowPath({
    Key? key,
    required this.shadow,
    required this.clipper,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowShadowPainter(
        clipper: clipper,
        shadow: shadow,
      ),
      child: ClipPath(clipper: clipper, child: child),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final BoxShadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = shadow.toPaint()
      ..maskFilter = MaskFilter.blur(
        BlurStyle.normal,
        shadow.spreadRadius,
      );
    final clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _TimestampClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double xScaling = size.width / 117;
    final double yScaling = size.height / 69;
    path.lineTo(59.866 * xScaling, 40.5 * yScaling);
    path.cubicTo(
      59.481088532635134 * xScaling,
      41.16660800266666 * yScaling,
      58.518911467364866 * xScaling,
      41.16660800266666 * yScaling,
      58.134 * xScaling,
      40.5 * yScaling,
    );
    path.cubicTo(
      58.134 * xScaling,
      40.5 * yScaling,
      55.536 * xScaling,
      36 * yScaling,
      55.536 * xScaling,
      36 * yScaling,
    );
    path.cubicTo(
      55.15109982054025 * xScaling,
      35.333333333333336 * yScaling,
      55.63222504467864 * xScaling,
      34.49999999967733 * yScaling,
      56.402025403598145 * xScaling,
      34.49999999967733 * yScaling,
    );
    path.cubicTo(
      56.402025403598145 * xScaling,
      34.49999999967733 * yScaling,
      56.402 * xScaling,
      34.5 * yScaling,
      56.402 * xScaling,
      34.5 * yScaling,
    );
    path.cubicTo(
      56.402 * xScaling,
      34.5 * yScaling,
      61.598 * xScaling,
      34.5 * yScaling,
      61.598 * xScaling,
      34.5 * yScaling,
    );
    path.cubicTo(
      62.3678003589195 * xScaling,
      34.5 * yScaling,
      62.848900179646044 * xScaling,
      35.333333333010664 * yScaling,
      62.464000000186296 * xScaling,
      35.99999999967733 * yScaling,
    );
    path.cubicTo(
      62.464000000186296 * xScaling,
      35.99999999967733 * yScaling,
      62.464 * xScaling,
      36 * yScaling,
      62.464 * xScaling,
      36 * yScaling,
    );
    path.cubicTo(
      62.464 * xScaling,
      36 * yScaling,
      59.866 * xScaling,
      40.5 * yScaling,
      59.866 * xScaling,
      40.5 * yScaling,
    );
    path.cubicTo(
      59.866 * xScaling,
      40.5 * yScaling,
      59.866 * xScaling,
      40.5 * yScaling,
      59.866 * xScaling,
      40.5 * yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      oldClipper != this;
}
