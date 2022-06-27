import 'package:flutter/material.dart';

class WorkoutTypeContent {
  final String title;
  final int exercises;
  final int caloriesBurn;
  final Duration duration;
  final String imagePath;
  final WorkoutTypeBgImageData backgroundImageData;

  const WorkoutTypeContent(
      {required this.title,
      required this.exercises,
      required this.caloriesBurn,
      required this.duration,
      required this.imagePath,
      required this.backgroundImageData});
}

class WorkoutTypeBgImageData {
  final String path;
  final Offset? offset;
  final EdgeInsets? margin;

  const WorkoutTypeBgImageData({
    required this.path,
    this.offset,
    this.margin,
  });
}
