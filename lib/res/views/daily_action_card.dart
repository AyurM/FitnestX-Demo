import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/secondary_button.dart';
import 'package:flutter/material.dart';

const _kButtonHeight = 30.0;
const _kBgOpacity = 0.2;
const _kCardPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 15);

class DailyActionCard extends StatelessWidget {
  final String title;
  final String buttonText;
  final void Function()? onPressed;
  final EdgeInsets? margin;

  const DailyActionCard(
      {Key? key,
      required this.title,
      this.buttonText = 'Check',
      this.onPressed,
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding: _kCardPadding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppBorderRadius.value16.value),
          gradient: AppColors.blueGradientWithOpacity(_kBgOpacity)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title,
            style: textTheme.bodyText2?.copyWith(
                fontWeight: FontWeight.w600, color: AppColors.black)),
        SecondaryButton.blue(
          text: buttonText,
          onPressed: onPressed,
          height: _kButtonHeight,
          textStyle: textTheme.subtitle1?.copyWith(color: AppColors.white),
        )
      ]),
    );
  }
}
