import 'package:flutter/material.dart';

class SearchPopupMenuItem {
  final IconData iconData;
  final String title;
  final void Function()? onPressed;

  const SearchPopupMenuItem(
      {required this.title, required this.iconData, this.onPressed});
}
