import 'package:flutter/material.dart';

class LatestWorkoutContent {
  final String title;
  final int caloriesBurn;
  final Duration duration;
  final String assetPath;
  final double completed;
  final Color color;

  const LatestWorkoutContent(
      {required this.title,
      required this.caloriesBurn,
      required this.duration,
      required this.assetPath,
      required this.completed,
      required this.color});
}
