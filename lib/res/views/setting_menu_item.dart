import 'package:fitnest_x/data/model/menu_item_data.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/views/app_switch_button.dart';
import 'package:flutter/material.dart';

const _kPadding = EdgeInsets.symmetric(vertical: 6);
const _kIconSize = 22.0;
const _kSpacing = 10.0;

class SettingsMenuItem extends StatelessWidget {
  final MenuItemData data;

  const SettingsMenuItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) => _SettingsMenuItemWrapper(
      data: data,
      trailing: const Icon(Icons.chevron_right_sharp, color: AppColors.gray1));
}

class SettingsMenuToggleItem extends StatelessWidget {
  final MenuItemData data;
  final void Function(bool)? onChanged;

  const SettingsMenuToggleItem({Key? key, required this.data, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) => _SettingsMenuItemWrapper(
      data: data,
      trailing: AppSwitchButton(initialValue: true, onChanged: onChanged));
}

class _SettingsMenuItemWrapper extends StatelessWidget {
  final MenuItemData data;
  final Widget trailing;

  const _SettingsMenuItemWrapper(
      {Key? key, required this.data, required this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: data.onPressed ?? () {},
        padding: _kPadding,
        elevation: 0,
        highlightElevation: 0,
        fillColor: AppColors.white,
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
                      data.iconData,
                      size: _kIconSize,
                      color: AppColors.white,
                    ))),
            const SizedBox(width: _kSpacing),
            Expanded(
                child: Text(data.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subtitle1)),
            const SizedBox(width: _kSpacing),
            trailing
          ],
        ));
  }
}
