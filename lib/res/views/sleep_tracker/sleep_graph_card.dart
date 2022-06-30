import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/sleep_tracker/sleep_graph.dart';
import 'package:fitnest_x/res/views/sleep_tracker/sleep_graph_modal.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _kAspectRatio = 1.78;
const _kXLabelWidth = 30.0;
const _kYLabelWidth = 20.0;
const _kYLabelSpacing = 5.0;
const _kPopupXSpacing = 10.0;
const _kPopupYSpacing = 36.0;

class SleepGraphCard extends StatelessWidget {
  const SleepGraphCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sleepValues = DataMockUtils.getMockSleepValues();

    return LayoutBuilder(builder: (context, constraints) {
      final graphWidgetSize =
          Size(constraints.maxWidth, constraints.maxWidth / _kAspectRatio);

      return SizedBox(
        width: graphWidgetSize.width,
        height: graphWidgetSize.height,
        child: _SleepGraphWidget(values: sleepValues, size: graphWidgetSize),
      );
    });
  }
}

class _SleepGraphWidget extends StatefulWidget {
  static const _xAxisValues = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  static const _yAxisValues = ['10h', '8h', '6h', '4h', '2h', '0h'];

  final List<Duration> values;
  final Size size;

  const _SleepGraphWidget({Key? key, required this.values, required this.size})
      : super(key: key);

  @override
  State<_SleepGraphWidget> createState() => _SleepGraphWidgetState();
}

class _SleepGraphWidgetState extends State<_SleepGraphWidget> {
  int? selectedIndex;
  Offset? popupOffset;

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
                  child: Stack(
                children: [
                  SleepGraph(
                      values: widget.values,
                      onValueSelected: _onSleepValueSelected),
                  if (popupOffset != null && selectedIndex != null)
                    Positioned(
                        left: _calcPopupLeftPosition(),
                        right: _calcPopupRightPosition(),
                        top: _calcPopupTopPosition(),
                        child: SleepGraphModal(
                            onPressed: () =>
                                setState(() => popupOffset = null)))
                ],
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
      padding: const EdgeInsets.only(right: _kYLabelWidth + _kYLabelSpacing),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children),
    );
  }

  void _onSleepValueSelected(int index, Offset offset) {
    if (index == selectedIndex) {
      return;
    }

    setState(() {
      selectedIndex = index;
      popupOffset = offset;
    });
  }

  double? _calcPopupLeftPosition() => selectedIndex! < widget.values.length / 2
      ? popupOffset!.dx + _kPopupXSpacing
      : null;

  double? _calcPopupRightPosition() =>
      selectedIndex! >= (widget.values.length / 2).round()
          ? widget.size.width -
              _kYLabelWidth -
              _kYLabelSpacing -
              popupOffset!.dx +
              _kPopupXSpacing
          : null;

  double _calcPopupTopPosition() =>
      popupOffset!.dy > widget.size.height - _kPopupYSpacing
          ? popupOffset!.dy - _kPopupYSpacing
          : popupOffset!.dy;
}
