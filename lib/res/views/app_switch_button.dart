import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

const _kDefaultPadding = 5.0;

class AppSwitchButton extends StatefulWidget {
  final bool initialValue;
  final void Function(bool)? onChanged;
  final double width;
  final double height;

  const AppSwitchButton(
      {Key? key,
      this.initialValue = false,
      this.onChanged,
      this.width = 45,
      this.height = 25})
      : super(key: key);

  @override
  State<AppSwitchButton> createState() => _AppSwitchButtonState();
}

class _AppSwitchButtonState extends State<AppSwitchButton> {
  late bool value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => value = !value);
        widget.onChanged?.call(value);
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: const EdgeInsets.all(_kDefaultPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.height / 2),
            color: value ? null : AppColors.gray3,
            gradient: value ? AppColors.purpleGradient : null),
        child: _buildSwitch(),
      ),
    );
  }

  Widget _buildSwitch() {
    final double switchSize = widget.height - _kDefaultPadding * 2;

    return AnimatedAlign(
      duration: const Duration(milliseconds: 250),
      curve: Curves.decelerate,
      alignment: value ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
          width: switchSize,
          height: switchSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(switchSize / 2),
            color: AppColors.white,
          )),
    );
  }
}
