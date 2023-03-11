import 'package:fitnest_x/data/model/home_popup_menu_item.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

const _kIconSize = 24.0;
const _kPadding = kAllPadding15;

class SearchPopupMenu extends StatelessWidget {
  static const width = 168.0;
  static const height = 132.0;

  final List<HomePopupMenuItem> items;
  final void Function(HomePopupMenuItem) onSelectItem;

  const SearchPopupMenu(
      {Key? key, required this.items, required this.onSelectItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _kPadding,
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: const [AppColors.cardShadow],
          borderRadius: BorderRadius.circular(AppBorderRadius.value12.value)),
      child: Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: items
                .map((item) => _SearchPopupMenuItemView(
                    item: item, onPressed: onSelectItem))
                .toList()),
      ),
    );
  }
}

class _SearchPopupMenuItemView extends StatelessWidget {
  final HomePopupMenuItem item;
  final void Function(HomePopupMenuItem) onPressed;

  const _SearchPopupMenuItemView(
      {Key? key, required this.item, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: () => onPressed(item),
        padding: const EdgeInsets.symmetric(vertical: 5),
        elevation: 0,
        highlightElevation: 0,
        fillColor: AppColors.white,
        constraints: const BoxConstraints(minHeight: _kIconSize),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Row(
          children: [
            SizedBox.square(
                dimension: _kIconSize,
                child: ShaderMask(
                    shaderCallback: (rect) => AppColors.blueGradient
                        .createShader(
                            Offset.zero & const Size.square(_kIconSize)),
                    child: Icon(
                      item.iconData,
                      size: _kIconSize,
                      color: AppColors.white,
                    ))),
            AppWhiteSpace.value5.horizontal,
            Text(item.title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: AppColors.black))
          ],
        ));
  }
}
