import 'package:flutter/material.dart';

const kAppName = 'Fitnest X';
const kHorizontalPadding20 = EdgeInsets.symmetric(horizontal: 20);
const kAllPadding20 = EdgeInsets.all(20);
const kAllPadding15 = EdgeInsets.all(15);
const kAllPadding10 = EdgeInsets.all(10);
const kAllPadding5 = EdgeInsets.all(5);
const kPrimaryButtonHeight = 60.0;
const kBottomNavBarHeight = 80.0;
const kFabTopOffset = 10.0;

enum AppBorderRadius {
  large(22.0),
  medium(16.0),
  small(12.0);

  final double value;
  const AppBorderRadius(this.value);
}

enum AppWhiteSpace {
  value50(SizedBox(width: 50.0), SizedBox(height: 50.0)),
  value40(SizedBox(width: 40.0), SizedBox(height: 40.0)),
  value35(SizedBox(width: 35.0), SizedBox(height: 35.0)),
  value30(SizedBox(width: 30.0), SizedBox(height: 30.0)),
  value25(SizedBox(width: 25.0), SizedBox(height: 25.0)),
  value20(SizedBox(width: 20.0), SizedBox(height: 20.0)),
  value15(SizedBox(width: 15.0), SizedBox(height: 15.0)),
  value10(SizedBox(width: 10.0), SizedBox(height: 10.0)),
  value8(SizedBox(width: 8.0), SizedBox(height: 8.0)),
  value5(SizedBox(width: 5.0), SizedBox(height: 5.0)),
  value3(SizedBox(width: 3.0), SizedBox(height: 3.0));

  final Widget horizontal;
  final Widget vertical;
  const AppWhiteSpace(this.horizontal, this.vertical);
}
