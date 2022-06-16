import 'dart:math';

import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

const _titleText = 'Description';
const _readMoreText = ' Read More...';
const _hideText = ' Hide Details...';
const _collapsedTextLength = 185;
const _animDuration = Duration(milliseconds: 150);
const _kMockDescription =
    'A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et sapien vehicula, luctus elit dapibus, semper augue. Nulla rutrum mattis ligula, et commodo orci tincidunt.';

class ExerciseDescription extends StatefulWidget {
  const ExerciseDescription({Key? key}) : super(key: key);

  @override
  State<ExerciseDescription> createState() => _ExerciseDescriptionState();
}

class _ExerciseDescriptionState extends State<ExerciseDescription>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late String text;

  bool isCollapsed = true;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: _animDuration)
          ..addStatusListener(_animStatusListener);

    text = isCollapsed
        ? _kMockDescription.substring(
            0, min(_kMockDescription.length, _collapsedTextLength))
        : _kMockDescription;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.subtitle1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle.noAction(text: _titleText),
        AppWhiteSpace.value15.vertical,
        if (_kMockDescription.length <= _collapsedTextLength)
          Text(
            _kMockDescription,
            style: textStyle,
          )
        else
          AnimatedBuilder(
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
                                color: AppColors.blue,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = _onShowHideDescription),
                      ]),
                );
              })
      ],
    );
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
    if (_kMockDescription.length <= _collapsedTextLength) {
      return _kMockDescription;
    }

    final int endIndex = _collapsedTextLength +
        ((_kMockDescription.length - _collapsedTextLength) * value).round();
    return _kMockDescription.substring(0, endIndex);
  }
}
