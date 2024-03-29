part of 'goal_bloc.dart';

@freezed
class GoalState with _$GoalState {
  const factory GoalState.initial() = _Initial;
  const factory GoalState.loading() = _Loading;
  const factory GoalState.error({required String error}) = _Error;
  const factory GoalState.empty() = _Empty;
  const factory GoalState.success({required List<Goal> goals}) = _Success;
}
