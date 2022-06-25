import 'dart:math';

import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/sleep_tracker/sleep_graph.dart';
import 'package:flutter/material.dart';

const _kAspectRatio = 1.78;
const _kSleepValuesLength = 7;
const _kMinHourSleep = 6;
const _kMaxHourSleep = 8;
const _kXLabelWidth = 30.0;
const _kYLabelWidth = 20.0;

class SleepGraphCard extends StatelessWidget {
  const SleepGraphCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final sleepValues = List<Duration>.generate(
        _kSleepValuesLength,
        (index) => Duration(
            hours: random.nextInt(_kMaxHourSleep - _kMinHourSleep + 1) +
                _kMinHourSleep,
            minutes: random.nextInt(60)));

    return LayoutBuilder(
        builder: (context, constraints) => SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxWidth / _kAspectRatio,
              child: _SleepGraphWidget(values: sleepValues),
            ));
  }
}

class _SleepGraphWidget extends StatefulWidget {
  static const _xAxisValues = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  static const _yAxisValues = ['10h', '8h', '6h', '4h', '2h', '0h'];

  final List<Duration> values;

  const _SleepGraphWidget({Key? key, required this.values}) : super(key: key);

  @override
  State<_SleepGraphWidget> createState() => _SleepGraphWidgetState();
}

class _SleepGraphWidgetState extends State<_SleepGraphWidget> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    final axisTextStyle = Theme.of(context).textTheme.subtitle1;

    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: SleepGraph(
                values: widget.values,
                onValueSelected: (value) =>
                    setState(() => selectedIndex = value),
              )),
              AppWhiteSpace.value5.horizontal,
              _buildYAxis(axisTextStyle)
            ],
          )),
          AppWhiteSpace.value10.vertical,
          _buildXAxis(axisTextStyle)
        ],
      ),
    );
  }

  Widget _buildYAxis(TextStyle? axisTextStyle) => Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _SleepGraphWidget._yAxisValues
          .map((value) => Text(value, style: axisTextStyle))
          .toList());

  Widget _buildXAxis(TextStyle? axisTextStyle) {
    final children = <Widget>[];

    for (int i = 0; i < _SleepGraphWidget._xAxisValues.length; i++) {
      children.add(SizedBox(
        width: _kXLabelWidth,
        child: Text(_SleepGraphWidget._xAxisValues[i],
            textAlign: TextAlign.center,
            style: selectedIndex == i
                ? axisTextStyle?.copyWith(
                    fontWeight: FontWeight.bold, color: AppColors.blue)
                : axisTextStyle),
      ));
    }

    return Padding(
      padding: const EdgeInsets.only(right: _kYLabelWidth + 5.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children),
    );
  }
}
