import 'package:flutter/material.dart';

class LatestActivityContent {
  final String title;
  final String assetPath;
  final String subtitle;
  final Color? color;

  const LatestActivityContent({
    required this.title,
    required this.assetPath,
    required this.subtitle,
    this.color,
  });
}
