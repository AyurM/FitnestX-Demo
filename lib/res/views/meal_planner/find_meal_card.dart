import 'package:fitnest_x/data/model/meal_find_content.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/secondary_button.dart';
import 'package:flutter/material.dart';

const _selectText = 'Select';
const _kButtonHeight = 32.0;
const _kCardBgOpacity = 0.2;
const _kCardPadding = EdgeInsets.fromLTRB(20, 8, 5, 20);
const _kCardBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(22),
    topRight: Radius.circular(FindMealCard.size / 2),
    bottomLeft: Radius.circular(22),
    bottomRight: Radius.circular(22));

enum _CardColor { blue, purple }

class FindMealCard extends StatelessWidget {
  static const size = 200.0;

  static final blueColors = [
    AppColors.blue2.withOpacity(_kCardBgOpacity),
    AppColors.blue.withOpacity(_kCardBgOpacity)
  ];
  static final purpleColors = [
    AppColors.purple2.withOpacity(_kCardBgOpacity),
    AppColors.purple.withOpacity(_kCardBgOpacity)
  ];

  final MealFindContent data;
  final void Function()? onPressed;
  final _CardColor _cardColor;

  const FindMealCard.blue({Key? key, required this.data, this.onPressed})
      : _cardColor = _CardColor.blue,
        super(key: key);

  const FindMealCard.purple({Key? key, required this.data, this.onPressed})
      : _cardColor = _CardColor.purple,
        super(key: key);

  LinearGradient get _gradient => LinearGradient(
      colors: _cardColor == _CardColor.blue ? blueColors : purpleColors,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: _kCardPadding,
      width: size,
      height: size,
      decoration:
          BoxDecoration(gradient: _gradient, borderRadius: _kCardBorderRadius),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            child: Align(
          alignment: Alignment.centerRight,
          child: Image.asset(data.assetPath),
        )),
        AppWhiteSpace.value10.vertical,
        Text(data.title,
            style: textTheme.bodyText2?.copyWith(
                color: AppColors.black, fontWeight: FontWeight.bold)),
        AppWhiteSpace.value3.vertical,
        Text('${data.amount}+ Foods', style: textTheme.subtitle1),
        AppWhiteSpace.value15.vertical,
        if (_cardColor == _CardColor.blue)
          SecondaryButton.blue(
            text: _selectText,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            onPressed: onPressed ?? () {},
            height: _kButtonHeight,
            textStyle: textTheme.subtitle1
                ?.copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
          )
        else
          SecondaryButton.purple(
            text: _selectText,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            onPressed: onPressed ?? () {},
            height: _kButtonHeight,
            textStyle: textTheme.subtitle1
                ?.copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
          )
      ]),
    );
  }
}
