part of 'goal_bloc.dart';

@freezed
class GoalEvent with _$GoalEvent {
  const factory GoalEvent.goalsRequested() = GoalsRequested;
  const factory GoalEvent.goalSelected({required Goal goal}) = GoalSelected;
}
