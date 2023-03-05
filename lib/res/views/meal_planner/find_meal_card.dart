import 'package:fitnest_x/data/model/meal/meal_find_content.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/secondary_button.dart';
import 'package:fitnest_x/utils/card_color.dart';
import 'package:flutter/material.dart';

const _selectText = 'Select';
const _kButtonHeight = 32.0;
const _kCardBgOpacity = 0.2;
const _kCardPadding = EdgeInsets.fromLTRB(20, 8, 5, 20);
const _kButtonPadding = EdgeInsets.symmetric(horizontal: 30);
const _kCardBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(22),
    topRight: Radius.circular(FindMealCard.size / 2),
    bottomLeft: Radius.circular(22),
    bottomRight: Radius.circular(22));

class FindMealCard extends StatelessWidget {
  static const size = 200.0;

  final MealFindContent data;
  final void Function()? onPressed;
  final CardColor _cardColor;

  const FindMealCard.blue({Key? key, required this.data, this.onPressed})
      : _cardColor = CardColor.blue,
        super(key: key);

  const FindMealCard.purple({Key? key, required this.data, this.onPressed})
      : _cardColor = CardColor.purple,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: _kCardPadding,
      width: size,
      height: size,
      decoration: BoxDecoration(
          gradient: _cardColor.gradient(opacity: _kCardBgOpacity),
          borderRadius: _kCardBorderRadius),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            child: Align(
          alignment: Alignment.centerRight,
          child: Image.asset(data.assetPath),
        )),
        AppWhiteSpace.value10.vertical,
        Text(data.mealTime.title,
            style: textTheme.bodyMedium?.copyWith(color: AppColors.black)),
        AppWhiteSpace.value3.vertical,
        Text('${data.amount}+ Foods', style: textTheme.titleMedium),
        AppWhiteSpace.value15.vertical,
        if (_cardColor == CardColor.blue)
          SecondaryButton.blue(
            text: _selectText,
            padding: _kButtonPadding,
            onPressed: onPressed ?? () {},
            height: _kButtonHeight,
            textStyle: textTheme.titleLarge,
          )
        else
          SecondaryButton.purple(
            text: _selectText,
            padding: _kButtonPadding,
            onPressed: onPressed ?? () {},
            height: _kButtonHeight,
            textStyle: textTheme.titleLarge,
          )
      ]),
    );
  }
}
