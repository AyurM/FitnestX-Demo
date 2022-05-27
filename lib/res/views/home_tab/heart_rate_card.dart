import 'dart:math';

import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/home_tab/heart_rate_graph.dart';
import 'package:flutter/material.dart';

const _kHeight = 150.0;
const _kBgOpacity = 0.2;
const _kHeartRateLength = 50;
const _kMinHeartRate = 60;
const _kMaxHeartRate = 90;

const _titleText = 'Heart Rate';
const _bpmText = 'BPM';

class HeartRateCard extends StatefulWidget {
  const HeartRateCard({Key? key}) : super(key: key);

  @override
  State<HeartRateCard> createState() => _HeartRateCardState();
}

class _HeartRateCardState extends State<HeartRateCard> {
  late final List<int> heartRateValues;
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    final random = Random();
    heartRateValues = List<int>.generate(
        _kHeartRateLength,
        (index) =>
            random.nextInt(_kMaxHeartRate - _kMinHeartRate) + _kMinHeartRate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _kHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadiusLarge),
          gradient: LinearGradient(colors: [
            AppColors.blue2.withOpacity(_kBgOpacity),
            AppColors.blue.withOpacity(_kBgOpacity)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: LayoutBuilder(builder: (context, constraints) {
        return GestureDetector(
          onPanUpdate: (details) => _onPanUpdate(details, constraints.maxWidth),
          child: Stack(clipBehavior: Clip.none, children: [
            Positioned(
              top: 20,
              left: 20,
              child: _HeartRateInfo(
                  value: selectedIndex != null
                      ? heartRateValues[selectedIndex!]
                      : null),
            ),
            HeartRateGraph(
              values: heartRateValues,
              selectedIndex: selectedIndex,
            ),
            // if (selectedIndex != null)
            //   Positioned(
            //       top: constraints.maxHeight * 0.45 - 10,
            //       left: constraints.maxWidth *
            //           selectedIndex! /
            //           (heartRateValues.length - 1),
            //       child: const FractionalTranslation(
            //           translation: Offset(-0.5, -1),
            //           child: HeartRateTimestamp(text: '3mins ago'))),
          ]),
        );
      }),
    );
  }

  void _onPanUpdate(DragUpdateDetails details, double maxWidth) {
    if (heartRateValues.isEmpty) {
      return;
    }
    final currentIndex = _calcSelectedIndex(details.localPosition.dx, maxWidth);
    if (currentIndex != selectedIndex) {
      setState(() => selectedIndex = currentIndex);
    }
  }

  int _calcSelectedIndex(double touchPositionX, double totalWidth) {
    final stepX = totalWidth / (heartRateValues.length - 1);
    final clampedPosition = touchPositionX.clamp(0.0, totalWidth);
    return (clampedPosition / stepX).round();
  }
}

class _HeartRateInfo extends StatelessWidget {
  final int? value;

  const _HeartRateInfo({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_titleText,
            style: textTheme.subtitle1?.copyWith(
                fontWeight: FontWeight.w600, color: AppColors.black)),
        const SizedBox(height: 3),
        if (value != null)
          Text('$value $_bpmText',
              style: textTheme.bodyText2?.copyWith(
                  fontWeight: FontWeight.w600, color: AppColors.blue2)),
      ],
    );
  }
}
