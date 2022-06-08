import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

const _kCardPadding = EdgeInsets.all(12);

class UserStatCard extends StatelessWidget {
  final String name;
  final int value;
  final String? unit;

  const UserStatCard(
      {Key? key, required this.name, required this.value, this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: _kCardPadding,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(kBorderRadiusMedium),
          boxShadow: const [AppColors.cardShadow]),
      child: Column(
        children: [
          Text('$value${unit ?? ''}',
              style: textTheme.bodyText2?.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.blue)),
          const SizedBox(height: 5),
          Text(name, style: textTheme.subtitle1),
        ],
      ),
    );
  }
}
