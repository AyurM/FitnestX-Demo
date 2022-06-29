import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/utils/photo_position.dart';
import 'package:flutter/material.dart';

const _kBorderWidth = 1.5;
const _kBorderOpacity = 0.3;

class PhotoPositionButton extends StatelessWidget {
  final PhotoPosition position;
  final bool isSelected;
  final void Function() onPressed;

  const PhotoPositionButton(
      {Key? key,
      required this.position,
      required this.isSelected,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: isSelected
            ? EdgeInsets.all(kAllPadding10.top - _kBorderWidth)
            : kAllPadding10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppBorderRadius.small.value),
            color: AppColors.borderColor,
            border: isSelected
                ? Border.all(
                    color: AppColors.gray1.withOpacity(_kBorderOpacity),
                    width: _kBorderWidth)
                : null),
        child: Center(child: Image.asset(position.iconPath)),
      ),
    );
  }
}
