import 'package:flutter/material.dart';

import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';

const _kNavIconSize = 28.0;
const _kNavButtonSize = 48.0;
const _kSelectedIconDotSize = 4.0;

class AppNavigationBar extends StatelessWidget {
  final void Function(int) onSelect;
  final int currentIndex;

  const AppNavigationBar(
      {Key? key, required this.currentIndex, required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<_NavData> navIcons = [
      _NavData(
          activeIcon: AppIcons.home_filled,
          inactiveIcon: AppIcons.home_outlined),
      _NavData(
          activeIcon: AppIcons.activity_filled,
          inactiveIcon: AppIcons.activity_outlined),
      _NavData(
          activeIcon: AppIcons.camera_filled,
          inactiveIcon: AppIcons.camera_outlined),
      _NavData(
          activeIcon: AppIcons.profile_filled,
          inactiveIcon: AppIcons.profile_outlined),
    ];

    return Container(
      padding: kHorizontalPadding20,
      width: double.infinity,
      height: kBottomNavBarHeight,
      decoration: const BoxDecoration(color: AppColors.white, boxShadow: [
        BoxShadow(
            color: AppColors.cardShadowColor,
            offset: Offset(0, -10),
            blurRadius: 40)
      ]),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildNavButtons(navIcons)),
    );
  }

  List<Widget> _buildNavButtons(List<_NavData> navData) {
    final result = <Widget>[];
    for (int i = 0; i < navData.length; i++) {
      result.add(_NavButton(
          iconData: navData[i],
          isSelected: i == currentIndex,
          onTap: () => onSelect(i)));
      if (i == 1) {
        result.add(const SizedBox(width: kPrimaryButtonHeight));
      }
    }
    return result;
  }
}

class _NavData {
  final IconData activeIcon;
  final IconData inactiveIcon;

  const _NavData({
    required this.activeIcon,
    required this.inactiveIcon,
  });
}

class _NavButton extends StatelessWidget {
  final _NavData iconData;
  final bool isSelected;
  final void Function()? onTap;

  const _NavButton(
      {Key? key, required this.iconData, required this.isSelected, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icon = Icon(
      isSelected ? iconData.activeIcon : iconData.inactiveIcon,
      size: _kNavIconSize,
      color: isSelected ? AppColors.white : AppColors.gray2,
    );

    return GestureDetector(
      onTap: onTap,
      child: SizedBox.square(
        dimension: _kNavButtonSize,
        child: isSelected
            ? ShaderMask(
                shaderCallback: (rect) => AppColors.purpleGradient.createShader(
                    Offset.zero & const Size.square(_kNavIconSize)),
                child: _buildSelectedIcon(icon))
            : icon,
      ),
    );
  }

  Widget _buildSelectedIcon(Widget icon) => Column(
        children: [
          const SizedBox(height: (_kNavButtonSize - _kNavIconSize) / 2),
          icon,
          const SizedBox(height: _kSelectedIconDotSize),
          Container(
            width: _kSelectedIconDotSize,
            height: _kSelectedIconDotSize,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_kSelectedIconDotSize / 2),
                color: AppColors.white),
          ),
          const SizedBox(
              height: (_kNavButtonSize - _kNavIconSize) / 2 -
                  _kSelectedIconDotSize * 2),
        ],
      );
}
