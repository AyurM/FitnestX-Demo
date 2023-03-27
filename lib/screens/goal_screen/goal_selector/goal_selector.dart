import 'package:fitnest_x/data/model/goal.dart';
import 'package:fitnest_x/di/di.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/goal_page.dart';
import 'package:fitnest_x/res/views/primary_button.dart';
import 'package:fitnest_x/screens/goal_screen/goal_selector/bloc/goal_selector_bloc.dart';
import 'package:fitnest_x/screens/home_screen/home_screen.dart';
import 'package:fitnest_x/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoalSelector extends StatefulWidget {
  final List<Goal> goals;

  const GoalSelector({Key? key, required this.goals}) : super(key: key);

  @override
  State<GoalSelector> createState() => _GoalSelectorState();
}

class _GoalSelectorState extends State<GoalSelector> {
  static const _kSidePageScale = 0.75;
  static const _kViewportFraction = 0.79;
  static const _kSlideInThresholds = [0.05, 0.2];
  static const _kSlideOutThresholds = [0.8, 0.95];

  static const _pageTitleText = 'What is your goal?';
  static const _pageSubtitleText =
      'It will help us to choose a best program for you';
  static const _confirmText = 'Confirm';

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

    return Column(children: [
      AppWhiteSpace.value40.vertical,
      Text(_pageTitleText, style: textTheme.headlineMedium),
      AppWhiteSpace.value5.vertical,
      Text(_pageSubtitleText,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500)),
      AppWhiteSpace.value30.vertical,
      Expanded(
          child: PageView(controller: _pageController, children: [
        for (int i = 0; i < widget.goals.length; i++)
          GoalPage(
            goal: widget.goals[i],
            scale: _pageIndexToScale(i),
          )
      ])),
      AppWhiteSpace.value50.vertical,
      BlocProvider<GoalSelectorBloc>(
        create: (context) => getIt.get<GoalSelectorBloc>(),
        child: BlocConsumer<GoalSelectorBloc, GoalSelectorState>(
          builder: _builder,
          listener: _listener,
        ),
      ),
      AppWhiteSpace.value40.vertical,
    ]);
  }

  Widget _builder(BuildContext context, GoalSelectorState state) =>
      state.maybeWhen(
          goalSelectLoading: () => const PrimaryButton.blueLoading(
                margin: kHorizontalPadding20,
              ),
          orElse: () => PrimaryButton.blue(
                text: _confirmText,
                onPressed: () =>
                    _onGoalSelected(widget.goals[_pageIndex.round()], context),
                margin: kHorizontalPadding20,
              ));

  void _listener(BuildContext context, GoalSelectorState state) =>
      state.maybeWhen(
          goalSelectError: (error) => context.showSnackBar(error),
          goalSelectSuccess: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen())),
          orElse: () => null);

  void _onGoalSelected(Goal goal, BuildContext context) =>
      context.read<GoalSelectorBloc>().add(GoalSelected(goal: goal));

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
