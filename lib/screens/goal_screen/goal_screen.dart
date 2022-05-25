import 'package:fitnest_x/data/model/goal_page_content.dart';
import 'package:fitnest_x/res/views/goal_page.dart';
import 'package:fitnest_x/res/views/primary_button.dart';
import 'package:flutter/material.dart';

const _kSidePageScale = 0.75;
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
  final List<GoalPageContent> content = [
    const GoalPageContent(
        id: 1,
        assetPath: 'assets/images/goal1.png',
        title: 'Improve Shape',
        subtitle:
            "I have a low amount of body fat and need / want to build more muscle"),
    const GoalPageContent(
        id: 2,
        assetPath: 'assets/images/goal2.png',
        title: 'Lean & Tone',
        subtitle:
            "I’m “skinny fat”. Look thin but have no shape. I want to add learn muscle in the right way"),
    const GoalPageContent(
        id: 3,
        assetPath: 'assets/images/goal3.png',
        title: 'Lose a Fat',
        subtitle:
            "I have over 20 lbs to lose. I want to drop all this fat and gain muscle mass")
  ];

  late final PageController _pageController;
  double _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.79);
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
          const SizedBox(height: 40),
          Text(_pageTitleText, style: textTheme.headline4),
          const SizedBox(height: 5),
          Text(_pageSubtitleText, style: textTheme.subtitle1),
          const SizedBox(height: 30),
          Expanded(
              child: PageView(controller: _pageController, children: [
            for (int i = 0; i < content.length; i++)
              GoalPage(
                content: content[i],
                scale: _pageIndexToScale(i),
              )
          ])),
          const SizedBox(height: 50),
          PrimaryButton(
            text: _confirmText,
            onPressed: () =>
                debugPrint('Selected goal: ${content[_pageIndex.round()].id}'),
          ),
          const SizedBox(height: 40),
        ]),
      ),
    );
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
