import 'package:flutter/material.dart';

class NotificationContent {
  final String message;
  final String date;
  final String assetPath;
  final Color? color;

  const NotificationContent(
      {required this.message,
      required this.date,
      required this.assetPath,
      this.color});
}
