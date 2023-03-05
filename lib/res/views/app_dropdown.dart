import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/secondary_button.dart';
import 'package:flutter/material.dart';

const _kHeight = 36.0;
const _kIconSize = 20.0;
const _kPadding = EdgeInsets.symmetric(horizontal: 10, vertical: 8);

class AppDropdown extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const AppDropdown({Key? key, required this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_kHeight / 2),
      child: Stack(
        children: [
          const SecondaryButtonDecoration(gradient: AppColors.blueGradient),
          TextButton(
            style: TextButton.styleFrom(
              padding: _kPadding,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: const Size(0, _kHeight),
            ),
            onPressed: onPressed ?? () {},
            child: Row(
              children: [
                Text(title,
                    maxLines: 1, style: Theme.of(context).textTheme.titleSmall),
                AppWhiteSpace.value5.horizontal,
                const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: AppColors.white,
                  size: _kIconSize,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
