import 'package:flutter/material.dart';

const _kImageBgOpacity = 0.2;
const _kAssetImageScale = 0.7;

class AppSimpleImage extends StatelessWidget {
  final String assetPath;
  final Color color;
  final double size;
  final double? assetScale;
  final AlignmentGeometry? assetAlignment;
  final double? bgOpacity;
  final double? borderRadius;

  const AppSimpleImage(
      {Key? key,
      required this.assetPath,
      required this.size,
      required this.color,
      this.assetScale,
      this.assetAlignment,
      this.borderRadius,
      this.bgOpacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: color.withOpacity(bgOpacity ?? _kImageBgOpacity),
          borderRadius: BorderRadius.circular(borderRadius ?? size / 2)),
      child: Align(
          alignment: assetAlignment ?? Alignment.center,
          child: Image.asset(assetPath,
              width: size * (assetScale ?? _kAssetImageScale),
              height: size * (assetScale ?? _kAssetImageScale),
              fit: BoxFit.contain)),
    );
  }
}
