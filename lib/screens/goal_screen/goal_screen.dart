import 'package:fitnest_x/data/model/goal_type.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/goal_page.dart';
import 'package:fitnest_x/res/views/primary_button.dart';
import 'package:fitnest_x/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

const _kSidePageScale = 0.75;
const _kViewportFraction = 0.79;
const _kSlideInThresholds = [0.05, 0.2];
const _kSlideOutThresholds = [0.8, 0.95];

const _pageTitleText = 'What is your goal?';
const _pageSubtitleText = 'It will help us to choose a best program for you';
const _confirmText = 'Confirm';

class GoalScreen extends StatefulWidget {
  const GoalScreen({Key? key}) : super(key: key);

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  final _pageController = PageController(viewportFraction: _kViewportFraction);
  double _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_pageControllerListener);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          AppWhiteSpace.value40.vertical,
          Text(_pageTitleText, style: textTheme.headlineMedium),
          AppWhiteSpace.value5.vertical,
          Text(_pageSubtitleText,
              style:
                  textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500)),
          AppWhiteSpace.value30.vertical,
          Expanded(
              child: PageView(controller: _pageController, children: [
            for (int i = 0; i < GoalType.values.length; i++)
              GoalPage(
                goal: GoalType.values[i],
                scale: _pageIndexToScale(i),
              )
          ])),
          AppWhiteSpace.value50.vertical,
          PrimaryButton.blue(
            text: _confirmText,
            onPressed: () =>
                _onGoalSelected(GoalType.values[_pageIndex.round()]),
            margin: kHorizontalPadding20,
          ),
          AppWhiteSpace.value40.vertical,
        ]),
      ),
    );
  }

  void _onGoalSelected(GoalType goal) {
    debugPrint('Selected goal: ${goal.title}');
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  void _pageControllerListener() => setState(() => _pageIndex =
      _pageController.hasClients && _pageController.page != null
          ? _pageController.page!
          : 0.0);

  double _pageIndexToScale(int i) {
    final indexRemainder = _pageIndex.remainder(1);
    if (i > _pageIndex + 1 || i < _pageIndex.floor()) {
      return _kSidePageScale;
    }

    if (i > _pageIndex) {
      if (indexRemainder < _kSlideInThresholds[0]) {
        return _kSidePageScale;
      }
      if (indexRemainder > _kSlideInThresholds[1]) {
        return 1;
      }
      return ((indexRemainder - _kSlideInThresholds[0]) /
                  (_kSlideInThresholds[1] - _kSlideInThresholds[0])) *
              (1 - _kSidePageScale) +
          _kSidePageScale;
    }

    if (i == _pageIndex.floor()) {
      if (indexRemainder < _kSlideOutThresholds[0]) {
        return 1;
      }
      if (indexRemainder > _kSlideOutThresholds[1]) {
        return _kSidePageScale;
      }
      return 1 -
          ((indexRemainder - _kSlideOutThresholds[0]) /
                  (_kSlideOutThresholds[1] - _kSlideOutThresholds[0])) *
              (1 - _kSidePageScale);
    }

    return 1;
  }
}
