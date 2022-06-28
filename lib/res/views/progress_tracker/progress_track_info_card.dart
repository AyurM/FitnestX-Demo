import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/secondary_button.dart';
import 'package:flutter/material.dart';

const _titleText1 = 'Track Your Progress Each\nMonth With ';
const _titleText2 = 'Photo';
const _kBgOpacity = 0.2;
const _learnMoreText = 'Learn More';
const _kCardPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 25);
const _kRelativeImageWidth = 0.368;
const _kButtonHeight = 35.0;

class ProgressTrackInfoCard extends StatelessWidget {
  final void Function()? onPressed;

  const ProgressTrackInfoCard({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        padding: _kCardPadding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppBorderRadius.large.value),
            gradient: AppColors.blueGradientWithOpacity(_kBgOpacity)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                    text: _titleText1,
                    style: textTheme.subtitle1?.copyWith(
                        color: AppColors.black, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: _titleText2,
                          style: textTheme.subtitle1?.copyWith(
                              color: AppColors.blue,
                              fontWeight: FontWeight.bold)),
                    ]),
              ),
              AppWhiteSpace.value15.vertical,
              SecondaryButton.blue(
                padding: kHorizontalPadding20,
                text: _learnMoreText,
                onPressed: onPressed,
                height: _kButtonHeight,
                textStyle: textTheme.button
                    ?.copyWith(fontSize: 10, fontWeight: FontWeight.bold),
              )
            ],
          )),
          AppWhiteSpace.value10.horizontal,
          Image.asset(
            'assets/images/track_progress.png',
            width: constraints.maxWidth * _kRelativeImageWidth,
          )
        ]),
      );
    });
  }
}
