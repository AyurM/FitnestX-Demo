import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/screens/goal_screen/goal_selector/goal_selector.dart';
import 'package:flutter/material.dart';

class GoalLoadingView extends StatelessWidget {
  const GoalLoadingView({super.key});

  ShapeDecoration get _pillDecoration =>
      const ShapeDecoration(shape: StadiumBorder(), color: Colors.white);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(children: [
      AppWhiteSpace.value40.vertical,
      Container(
          width: screenWidth * 0.5,
          height: _textHeight(textTheme.headlineMedium!),
          decoration: _pillDecoration),
      AppWhiteSpace.value5.vertical,
      Container(
          width: screenWidth * 0.75,
          height: _textHeight(textTheme.titleMedium!),
          decoration: _pillDecoration),
      AppWhiteSpace.value30.vertical,
      Expanded(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              width: screenWidth * GoalSelector.pageWidth,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(AppBorderRadius.value22.value)))),
      AppWhiteSpace.value50.vertical,
      Container(
          margin: kHorizontalPadding20,
          width: double.infinity,
          height: kPrimaryButtonHeight,
          decoration: _pillDecoration),
      AppWhiteSpace.value40.vertical,
    ]);
  }

  double _textHeight(TextStyle style) {
    final textPainter = TextPainter(
        text: TextSpan(text: 'Text', style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size.height;
  }
}
