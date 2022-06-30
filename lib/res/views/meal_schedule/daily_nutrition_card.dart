import 'package:fitnest_x/data/model/meal/daily_nutrition_data.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_card.dart';
import 'package:fitnest_x/res/views/app_progress_bar.dart';
import 'package:flutter/material.dart';

const _kCardPadding = kAllPadding15;
const _kIconSize = 18.0;

class DailyNutritionCard extends StatelessWidget {
  final DailyNutritionData data;

  const DailyNutritionCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = data.data.type.name;
    final formattedName = name[0].toUpperCase() + name.substring(1);
    final TextTheme textTheme = Theme.of(context).textTheme;

    return AppCard(
      padding: _kCardPadding,
      borderRadius: AppBorderRadius.value16.value,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                formattedName,
                style: textTheme.subtitle1?.copyWith(
                    color: AppColors.black, fontWeight: FontWeight.bold),
              ),
              AppWhiteSpace.value5.horizontal,
              Image.asset(data.data.type.iconPath, height: _kIconSize),
              const Spacer(),
              Text('${data.data.value} ${data.data.type.units}',
                  style: textTheme.subtitle1?.copyWith(fontSize: 10))
            ],
          ),
          AppWhiteSpace.value5.vertical,
          AppProgressBar(
            completionPercent: data.data.value / data.total,
          )
        ],
      ),
    );
  }
}
