part of 'goal_selector_bloc.dart';

@freezed
class GoalSelectorState with _$GoalSelectorState {
  const factory GoalSelectorState.initial() = _Initial;
  const factory GoalSelectorState.goalSelectLoading() = _GoalSelectLoading;
  const factory GoalSelectorState.goalSelectError({required String error}) =
      _GoalSelectError;
  const factory GoalSelectorState.goalSelectSuccess() = _GoalSelectSuccess;
}
