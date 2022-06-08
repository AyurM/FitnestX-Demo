import 'package:flutter/material.dart';

enum MenuItemType { simple, toggle }

class MenuItemData {
  final String title;
  final IconData iconData;
  final MenuItemType type;
  final void Function()? onPressed;
  final void Function(bool)? onToggle;

  const MenuItemData.simple(
      {required this.title, required this.iconData, this.onPressed})
      : onToggle = null,
        type = MenuItemType.simple;

  const MenuItemData.toggle(
      {required this.title, required this.iconData, this.onToggle})
      : onPressed = null,
        type = MenuItemType.toggle;
}
