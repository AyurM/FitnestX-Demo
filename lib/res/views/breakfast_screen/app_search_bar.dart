import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

const _kIconSize = 24.0;
const _kButtonSize = 48.0;
const _searchText = 'Search';
const _kPadding = EdgeInsets.all(16);

class AppSearchBar extends StatelessWidget {
  final void Function(String)? onChanged;
  final FocusNode? focusNode;

  const AppSearchBar({Key? key, this.onChanged, this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          boxShadow: const [AppColors.cardShadow],
          borderRadius: BorderRadius.circular(AppBorderRadius.value16.value)),
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.value16.value)),
        color: AppColors.white,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                focusNode: focusNode,
                onChanged: onChanged,
                decoration: InputDecoration(
                    prefixIcon: const Icon(AppIcons.search_outlined,
                        color: AppColors.gray2),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: AppColors.gray3),
                    hintText: _searchText,
                    contentPadding: _kPadding,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            AppBorderRadius.value16.value),
                        borderSide: BorderSide.none)),
              ),
            ),
            _SearchFilterButton(onPressed: () {})
          ],
        ),
      ),
    );
  }
}

class _SearchFilterButton extends StatelessWidget {
  final void Function()? onPressed;

  const _SearchFilterButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _kButtonSize,
      child: Row(
        children: [
          _divider,
          Expanded(
            child: IconButton(
              onPressed: onPressed ?? () {},
              splashRadius: _kIconSize,
              icon: SizedBox.square(
                dimension: _kButtonSize,
                child: Center(
                  child: ShaderMask(
                      shaderCallback: (rect) => AppColors.blueGradient
                          .createShader(
                              Offset.zero & const Size.square(_kIconSize)),
                      child: const Icon(
                        AppIcons.filter_outlined,
                        size: _kIconSize,
                        color: AppColors.white,
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _divider =>
      Container(width: 1, height: _kIconSize, color: AppColors.gray3);
}
