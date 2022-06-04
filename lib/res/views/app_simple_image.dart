import 'package:flutter/material.dart';

const _kImageBgOpacity = 0.2;
const _kAssetImageScale = 0.7;

class AppSimpleImage extends StatelessWidget {
  final String assetPath;
  final Color color;
  final double size;

  const AppSimpleImage(
      {Key? key,
      required this.assetPath,
      required this.size,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              color: color.withOpacity(_kImageBgOpacity),
              shape: BoxShape.circle),
        ),
        Image.asset(assetPath,
            width: size * _kAssetImageScale,
            height: size * _kAssetImageScale,
            fit: BoxFit.contain)
      ],
    );
  }
}
