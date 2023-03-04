import 'package:fitnest_x/data/model/description_step.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/description_step/description_step_decoration.dart';
import 'package:flutter/material.dart';

const _kLargeDotRadius = 10.0;
const _kStepNumberWidth = 20.0;

class DescriptionStepItem extends StatelessWidget {
  final DescriptionStep step;
  final int index;
  final bool isLast;

  const DescriptionStepItem(
      {Key? key, required this.step, required this.index, this.isLast = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: _kStepNumberWidth,
            child: Text('${index < 10 ? '0' : ''}$index',
                style: textTheme.bodyMedium?.copyWith(
                    color: step.isActive ? AppColors.purple : AppColors.gray2)),
          ),
          AppWhiteSpace.value15.horizontal,
          SizedBox(
              width: _kLargeDotRadius * 2,
              child: DescriptionStepDecoration(
                  isLast: isLast, isActive: step.isActive)),
          AppWhiteSpace.value15.horizontal,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(step.title,
                    style:
                        textTheme.bodyMedium?.copyWith(color: AppColors.black)),
                AppWhiteSpace.value3.vertical,
                Text(step.description, style: textTheme.titleMedium),
                AppWhiteSpace.value30.vertical,
              ],
            ),
          )
        ],
      ),
    );
  }
}
