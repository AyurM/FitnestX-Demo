import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/secondary_button.dart';
import 'package:flutter/material.dart';

const _titleText = 'Ideal Hours for Sleep';
const _kBgOpacity = 0.2;
const _learnMoreText = 'Learn More';
const _kCardPadding = kAllPadding20;
const _kRelativeImageWidth = 0.375;
const _kButtonHeight = 35.0;

class SleepBanner extends StatelessWidget {
  final void Function()? onPressed;

  const SleepBanner({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final digitTextStyle = textTheme.bodyMedium
        ?.copyWith(color: AppColors.blue, fontWeight: FontWeight.w500);

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        padding: _kCardPadding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppBorderRadius.value22.value),
            gradient: AppColors.blueGradientWithOpacity(_kBgOpacity)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_titleText,
                  style:
                      textTheme.titleMedium?.copyWith(color: AppColors.black)),
              AppWhiteSpace.value5.vertical,
              RichText(
                text: TextSpan(text: '8', style: digitTextStyle, children: [
                  TextSpan(
                      text: 'hours',
                      style: textTheme.titleMedium
                          ?.copyWith(color: AppColors.blue)),
                  TextSpan(text: ' 30'.toString(), style: digitTextStyle),
                  TextSpan(
                      text: 'minutes',
                      style: textTheme.titleMedium
                          ?.copyWith(color: AppColors.blue)),
                ]),
              ),
              AppWhiteSpace.value15.vertical,
              SecondaryButton.blue(
                padding: kHorizontalPadding20,
                text: _learnMoreText,
                onPressed: onPressed,
                height: _kButtonHeight,
                textStyle: textTheme.labelLarge
                    ?.copyWith(fontSize: 10, fontWeight: FontWeight.w600),
              )
            ],
          )),
          Image.asset(
            'assets/images/sleep_banner.png',
            width: constraints.maxWidth * _kRelativeImageWidth,
          )
        ]),
      );
    });
  }
}
