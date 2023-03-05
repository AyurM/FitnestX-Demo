import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/primary_button.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _titleText = 'Custom Repetitions';
const _saveText = 'Save';
const _kMinRepetitions = 7;
const _kMaxRepetitions = 50;
const _kIconSize = 16.0;
const _kCaloriesPerRepetition = 7;

const _kPickerHeight = 120.0;
const _kPickerItemExtent = 46.0;
const _kPickerMagnification = 1.1;
const _kPickerDiameterRatio = 10.0;
const _kPickerSqueeze = 1.05;

class ExerciseRepetitionsBlock extends StatelessWidget {
  const ExerciseRepetitionsBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle.noAction(text: _titleText),
        AppWhiteSpace.value15.vertical,
        SizedBox(
          height: _kPickerHeight,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: _RepetitionPicker(onSelected: (index) {}),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: _kPickerItemExtent * _kPickerMagnification,
                  decoration: const _PickerOverlayDecoration(),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('times',
                        style: textTheme.bodyLarge
                            ?.copyWith(color: AppColors.gray2)),
                  ),
                ),
              ),
            ],
          ),
        ),
        AppWhiteSpace.value30.vertical,
        PrimaryButton.blue(
          text: _saveText,
          onPressed: Navigator.of(context).pop,
        )
      ],
    );
  }
}

class _RepetitionPicker extends StatelessWidget {
  final void Function(int)? onSelected;

  const _RepetitionPicker({Key? key, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      selectionOverlay: Container(
        decoration: const _PickerOverlayDecoration(),
      ),
      diameterRatio: _kPickerDiameterRatio,
      magnification: _kPickerMagnification,
      squeeze: _kPickerSqueeze,
      looping: true,
      onSelectedItemChanged: onSelected,
      itemExtent: _kPickerItemExtent,
      children: _buildPickerItems(),
    );
  }

  List<Widget> _buildPickerItems() {
    return List<Widget>.generate(_kMaxRepetitions - _kMinRepetitions + 1,
        (index) {
      final int value = _kMinRepetitions + index;
      return _RepetitionPickerItem(amount: value);
    });
  }
}

class _PickerOverlayDecoration extends BoxDecoration {
  const _PickerOverlayDecoration()
      : super(
            border: const Border(
                top: BorderSide(width: 1, color: AppColors.gray3),
                bottom: BorderSide(width: 1, color: AppColors.gray3)));
}

class _RepetitionPickerItem extends StatelessWidget {
  static final _iconImage = Image.asset(
    'assets/images/icon_burn.png',
    errorBuilder: (context, error, stackTrace) => Container(
      color: Colors.red,
      width: _kIconSize,
      height: _kIconSize,
    ),
    width: _kIconSize,
    height: _kIconSize,
    fit: BoxFit.cover,
  );

  final int amount;

  const _RepetitionPickerItem({Key? key, required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppWhiteSpace.value30.horizontal,
        _iconImage,
        AppWhiteSpace.value5.horizontal,
        Text('${amount * _kCaloriesPerRepetition} Calories Burn',
            style: textTheme.titleMedium
                ?.copyWith(color: AppColors.gray2, fontSize: 11)),
        AppWhiteSpace.value10.horizontal,
        Text('$amount', style: textTheme.bodyMedium?.copyWith(fontSize: 24)),
        AppWhiteSpace.value10.horizontal,
      ],
    );
  }
}
