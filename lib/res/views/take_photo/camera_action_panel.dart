import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/views/app_fab.dart';
import 'package:fitnest_x/res/views/take_photo/photo_position_selector.dart';
import 'package:fitnest_x/utils/photo_position.dart';
import 'package:flutter/material.dart';

const _kHeight = 68.0;
const _kBgOpacity = 0.8;
const _kFabHeight = 48.0;
const _kOverlayPadding = EdgeInsets.symmetric(vertical: 30);

class CameraActionPanel extends StatelessWidget {
  final double bottomOffset;
  final PhotoPosition photoPosition;

  const CameraActionPanel(
      {Key? key, required this.photoPosition, this.bottomOffset = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalHeight = MediaQuery.of(context).size.height -
        PhotoPositionSelector.height -
        bottomOffset -
        MediaQuery.of(context).padding.top;
    return SizedBox(
      height: totalHeight,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: _kOverlayPadding,
              child: Image.asset(photoPosition.overlayPath),
            ),
          ),
          SizedBox(
            height: _kHeight,
            child: Material(
              color: AppColors.white.withOpacity(_kBgOpacity),
              borderRadius: BorderRadius.circular(_kHeight / 2),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconButton(AppIcons.zap_off),
                  AppFab.add(
                      onPressed: () {},
                      offset: Offset.zero,
                      height: _kFabHeight,
                      icon: AppIcons.camera_outlined),
                  _buildIconButton(AppIcons.camera_switch)
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData iconData) => IconButton(
      onPressed: () {},
      splashRadius: _kFabHeight / 2,
      icon: Icon(
        iconData,
        color: AppColors.gray1,
      ));
}
