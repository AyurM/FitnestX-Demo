import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayLabel extends StatelessWidget {
  final DateTime day;

  const DayLabel({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('E, d MMMM y');

    return Row(
      children: [
        const Icon(AppIcons.calendar_outlined, color: AppColors.gray1),
        AppWhiteSpace.value10.horizontal,
        Text(dateFormat.format(day),
            style: Theme.of(context).textTheme.bodySmall)
      ],
    );
  }
}
