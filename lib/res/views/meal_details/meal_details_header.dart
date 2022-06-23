import 'package:fitnest_x/data/model/meal_data.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_like_button.dart';
import 'package:flutter/material.dart';

const _recipeAuthorText = 'James Ruth';

class MealDetailsHeader extends StatelessWidget {
  final MealData data;

  const MealDetailsHeader({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.name,
                style:
                    textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold)),
            AppWhiteSpace.value5.vertical,
            RichText(
              text:
                  TextSpan(text: 'by ', style: textTheme.subtitle1, children: [
                TextSpan(
                    text: _recipeAuthorText,
                    style: textTheme.subtitle1?.copyWith(color: AppColors.blue))
              ]),
            )
          ],
        )),
        AppWhiteSpace.value15.horizontal,
        AppLikeButton(onPressed: () {}),
      ],
    );
  }
}
