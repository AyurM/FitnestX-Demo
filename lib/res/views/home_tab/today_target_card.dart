import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/secondary_button.dart';
import 'package:flutter/material.dart';

const _kButtonHeight = 30.0;
const _kBgOpacity = 0.2;
const _titleText = 'Today Target';
const _buttonText = 'Check';
const _kCardPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 15);

class TodayTargetCard extends StatelessWidget {
  final void Function()? onPressed;

  const TodayTargetCard({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: _kCardPadding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadiusMedium),
          gradient: LinearGradient(colors: [
            AppColors.blue2.withOpacity(_kBgOpacity),
            AppColors.blue.withOpacity(_kBgOpacity)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(_titleText,
            style: textTheme.bodyText2?.copyWith(
                fontWeight: FontWeight.w600, color: AppColors.black)),
        SecondaryButton.blue(
          text: _buttonText,
          onPressed: onPressed,
          height: _kButtonHeight,
          textStyle: textTheme.subtitle1?.copyWith(color: AppColors.white),
        )
      ]),
    );
  }
}
