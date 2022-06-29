import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/take_photo/photo_position_button.dart';
import 'package:fitnest_x/utils/photo_position.dart';
import 'package:flutter/material.dart';

const _kPadding = EdgeInsets.fromLTRB(20, 30, 20, 40);

class PhotoPositionSelector extends StatelessWidget {
  static const height = 135.0;

  final PhotoPosition selectedPosition;
  final void Function(PhotoPosition) onSelect;

  const PhotoPositionSelector(
      {Key? key, required this.selectedPosition, required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: _kPadding,
        height: PhotoPositionSelector.height,
        width: double.infinity,
        color: AppColors.white,
        child: Row(children: _buildChildren()),
      );

  List<Widget> _buildChildren() {
    final result = <Widget>[];

    for (int i = 0; i < PhotoPosition.values.length; i++) {
      final position = PhotoPosition.values[i];
      result.add(Expanded(
        child: PhotoPositionButton(
            position: position,
            isSelected: position == selectedPosition,
            onPressed: () => onSelect.call(position)),
      ));
      if (i != PhotoPosition.values.length - 1) {
        result.add(AppWhiteSpace.value20.horizontal);
      }
    }
    return result;
  }
}
