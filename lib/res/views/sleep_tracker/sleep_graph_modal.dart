import 'dart:math';

import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

const _kMaxValue = 50;

class SleepGraphModal extends StatelessWidget {
  static final _random = Random();

  final void Function()? onPressed;

  const SleepGraphModal({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mockValue = _random.nextInt(_kMaxValue * 2 + 1) - _kMaxValue;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: kAllPadding10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [AppColors.cardShadow],
            color: AppColors.white),
        child: Text(_getMockText(mockValue),
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontSize: 10, color: _getTextColor(mockValue))),
      ),
    );
  }

  String _getMockText(int value) {
    if (value == 0) {
      return 'No changes';
    }

    return '${value.abs()}% ${value > 0 ? 'increase' : 'decrease'}';
  }

  Color _getTextColor(int value) {
    if (value == 0) {
      return AppColors.gray1;
    }

    return value > 0 ? AppColors.green : AppColors.red;
  }
}
