import 'package:fitnest_x/di/di.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/primary_button.dart';
import 'package:fitnest_x/res/views/shimmer_loading/shimmer_loading.dart';
import 'package:fitnest_x/screens/goal_screen/bloc/goal_bloc.dart';
import 'package:fitnest_x/screens/goal_screen/goal_loading.dart';
import 'package:fitnest_x/screens/goal_screen/goal_selector/goal_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoalScreen extends StatelessWidget {
  const GoalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GoalBloc>(
      create: (context) =>
          getIt.get<GoalBloc>()..add(const GoalEvent.goalsRequested()),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<GoalBloc, GoalState>(builder: _builder),
        ),
      ),
    );
  }

  Widget _builder(BuildContext context, GoalState state) => state.when<Widget>(
      initial: () => const SizedBox(),
      loading: () => const ShimmerLoading(child: GoalLoadingView()),
      error: (message) => _GoalsErrorView(
          errorMessage: message, onRetry: () => _onRetry(context)),
      empty: () => _EmptyGoalsView(onRetry: () => _onRetry(context)),
      success: (goals) => GoalSelector(goals: goals));

  void _onRetry(BuildContext context) =>
      context.read<GoalBloc>().add(const GoalsRequested());
}

class _GoalsErrorView extends StatelessWidget {
  final String errorMessage;
  final void Function() onRetry;

  const _GoalsErrorView(
      {Key? key, required this.errorMessage, required this.onRetry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(children: [
      const Spacer(),
      Text('Error', style: textTheme.headlineMedium),
      AppWhiteSpace.value5.vertical,
      Text(errorMessage,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500)),
      const Spacer(),
      PrimaryButton.blue(
        text: 'Retry',
        onPressed: onRetry,
        margin: kHorizontalPadding20,
      ),
      AppWhiteSpace.value40.vertical,
    ]);
  }
}

class _EmptyGoalsView extends StatelessWidget {
  final void Function() onRetry;

  const _EmptyGoalsView({Key? key, required this.onRetry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(children: [
      const Spacer(),
      Text('Goals not found', style: textTheme.headlineMedium),
      const Spacer(),
      PrimaryButton.blue(
        text: 'Retry',
        onPressed: onRetry,
        margin: kHorizontalPadding20,
      ),
      AppWhiteSpace.value40.vertical,
    ]);
  }
}
