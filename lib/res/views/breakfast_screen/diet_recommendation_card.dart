import 'package:fitnest_x/data/model/meal_data.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/secondary_button.dart';
import 'package:fitnest_x/utils/card_color.dart';
import 'package:flutter/material.dart';

const _viewText = 'View';
const _kCardPadding = EdgeInsets.fromLTRB(20, 30, 20, 20);
const _kButtonPadding = EdgeInsets.symmetric(horizontal: 40);
const _kCardBgOpacity = 0.2;
const _kCardBorderRadius = 20.0;
const _kButtonHeight = 38.0;

class DietRecommendationCard extends StatelessWidget {
  static const size = Size(200.0, 240.0);

  final MealData data;
  final void Function()? onPressed;

  final CardColor _color;

  const DietRecommendationCard.blue(
      {Key? key, required this.data, this.onPressed})
      : _color = CardColor.blue,
        super(key: key);

  const DietRecommendationCard.purple(
      {Key? key, required this.data, this.onPressed})
      : _color = CardColor.purple,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final String subtitle =
        '${data.difficulty} | ${data.cookDuration.inMinutes}mins | ${data.calories}kCal';

    return Container(
      padding: _kCardPadding,
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
          gradient: _color.gradient(opacity: _kCardBgOpacity),
          borderRadius: BorderRadius.circular(_kCardBorderRadius)),
      child: Column(children: [
        Expanded(child: Image.asset(data.assetPath)),
        AppWhiteSpace.value15.vertical,
        Text(data.name,
            textAlign: TextAlign.center,
            style: textTheme.bodyText2?.copyWith(
                color: AppColors.black, fontWeight: FontWeight.bold)),
        AppWhiteSpace.value3.vertical,
        Text(subtitle, textAlign: TextAlign.center, style: textTheme.subtitle1),
        AppWhiteSpace.value15.vertical,
        if (_color == CardColor.blue)
          SecondaryButton.blue(
            text: _viewText,
            padding: _kButtonPadding,
            onPressed: onPressed ?? () {},
            height: _kButtonHeight,
            textStyle: textTheme.subtitle1
                ?.copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
          )
        else
          SecondaryButton.purple(
            text: _viewText,
            padding: _kButtonPadding,
            onPressed: onPressed ?? () {},
            height: _kButtonHeight,
            textStyle: textTheme.subtitle1
                ?.copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
          )
      ]),
    );
  }
}
