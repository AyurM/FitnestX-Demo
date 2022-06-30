import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

const _kHeight = 60.0;
const _kPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
const _kAnimDuration = Duration(milliseconds: 150);

class AppModeSelect extends StatefulWidget {
  final String firstOptionName;
  final String secondOptionName;
  final int initialOption;
  final void Function(int) onChanged;

  const AppModeSelect(
      {Key? key,
      required this.firstOptionName,
      required this.secondOptionName,
      this.initialOption = 0,
      required this.onChanged})
      : assert(initialOption == 0 || initialOption == 1, 'Wrong option index'),
        super(key: key);

  @override
  State<AppModeSelect> createState() => _AppModeSelectState();
}

class _AppModeSelectState extends State<AppModeSelect> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialOption;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final buttonWidth =
          (constraints.maxWidth - _kPadding.left - _kPadding.right) / 2;
      final buttonHeight = _kHeight - _kPadding.top - _kPadding.bottom;

      return Container(
        padding: _kPadding,
        height: _kHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_kHeight / 2),
            color: AppColors.borderColor),
        child: Stack(children: [
          _buildActiveOptionDecoration(Size(buttonWidth, buttonHeight)),
          SizedBox(
            height: buttonHeight,
            child: Row(
              children: [
                Expanded(
                    child: _OptionButton(
                        text: widget.firstOptionName,
                        isSelected: selectedIndex == 0,
                        onPressed: () => _onOptionSelect(0))),
                Expanded(
                    child: _OptionButton(
                        text: widget.secondOptionName,
                        isSelected: selectedIndex == 1,
                        onPressed: () => _onOptionSelect(1)))
              ],
            ),
          )
        ]),
      );
    });
  }

  Widget _buildActiveOptionDecoration(Size size) => AnimatedAlign(
        duration: _kAnimDuration,
        curve: Curves.decelerate,
        alignment:
            selectedIndex == 0 ? Alignment.centerLeft : Alignment.centerRight,
        child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.height / 2),
              gradient: AppColors.blueGradient,
            )),
      );

  void _onOptionSelect(int index) {
    if (index == selectedIndex) {
      return;
    }

    setState(() => selectedIndex = index);
    widget.onChanged.call(index);
  }
}

class _OptionButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool isSelected;

  const _OptionButton(
      {Key? key, required this.text, required this.isSelected, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context)
        .textTheme
        .bodyText1
        ?.copyWith(color: isSelected ? AppColors.white : AppColors.gray2);

    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onPressed,
        child: Center(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textStyle,
          ),
        ));
  }
}
