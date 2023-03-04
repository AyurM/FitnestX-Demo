import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

const _readMoreText = ' Read More...';
const _hideText = ' Hide Details...';
const _animDuration = Duration(milliseconds: 150);

class ExpandableTextBlock extends StatefulWidget {
  final String text;
  final int collapsedTextLength;
  const ExpandableTextBlock(
      {Key? key, required this.text, required this.collapsedTextLength})
      : super(key: key);

  @override
  State<ExpandableTextBlock> createState() => _ExpandableTextBlockState();
}

class _ExpandableTextBlockState extends State<ExpandableTextBlock>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  bool isCollapsed = true;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: _animDuration)
          ..addStatusListener(_animStatusListener);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium;

    if (widget.text.length <= widget.collapsedTextLength) {
      return Text(
        widget.text,
        style: textStyle,
      );
    }

    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return RichText(
            text: TextSpan(
                text: _getText(animationController.value),
                style: textStyle,
                children: [
                  TextSpan(
                      text: isCollapsed ? _readMoreText : _hideText,
                      style: textStyle?.copyWith(
                          color: AppColors.blue, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = _onShowHideDescription),
                ]),
          );
        });
  }

  void _onShowHideDescription() {
    if (animationController.isAnimating) {
      return;
    }
    isCollapsed ? animationController.forward() : animationController.reverse();
  }

  void _animStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed ||
        status == AnimationStatus.dismissed) {
      setState(() => isCollapsed = !isCollapsed);
    }
  }

  String _getText(double value) {
    if (widget.text.length <= widget.collapsedTextLength) {
      return widget.text;
    }

    final int endIndex = widget.collapsedTextLength +
        ((widget.text.length - widget.collapsedTextLength) * value).round();
    return widget.text.substring(0, endIndex);
  }
}
