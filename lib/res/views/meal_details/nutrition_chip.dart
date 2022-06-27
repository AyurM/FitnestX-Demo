import 'package:fitnest_x/data/model/meal/nutrition_data.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

const _kIconSize = 18.0;
const _kBgOpacity = 0.2;
const _kPadding = kAllPadding10;

class NutritionChip extends StatelessWidget {
  static const height = _kIconSize + 20;

  final NutritionData data;

  const NutritionChip({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String text =
        '${data.value}${data.type.units} ${data.type == NutritionType.calories ? '' : data.type.name.toLowerCase()}';

    return Container(
      padding: _kPadding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppBorderRadius.small.value),
          gradient: AppColors.blueGradientWithOpacity(_kBgOpacity)),
      child: Row(children: [
        Image.asset(data.type.iconPath, height: _kIconSize),
        AppWhiteSpace.value5.horizontal,
        Text(text,
            style:
                Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 10))
      ]),
    );
  }
}
