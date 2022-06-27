import 'package:fitnest_x/data/model/meal/ingredient_data.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

const _kImageScale = 0.55;

class IngredientCard extends StatelessWidget {
  static const size = 80.0;

  final IngredientData data;

  const IngredientCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              color: AppColors.borderColor,
              borderRadius: BorderRadius.circular(AppBorderRadius.small.value)),
          child: Center(
            child: Image.asset(
              data.assetPath,
              width: size * _kImageScale,
              height: size * _kImageScale,
              fit: BoxFit.contain,
            ),
          ),
        ),
        AppWhiteSpace.value10.vertical,
        Text(data.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.subtitle1?.copyWith(color: AppColors.black)),
        AppWhiteSpace.value3.vertical,
        Text('${data.amount} ${data.units ?? ''}',
            style: textTheme.subtitle1?.copyWith(fontSize: 10))
      ],
    );
  }
}
