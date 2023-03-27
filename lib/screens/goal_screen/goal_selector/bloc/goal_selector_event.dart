part of 'goal_selector_bloc.dart';

@freezed
class GoalSelectorEvent with _$GoalSelectorEvent {
  const factory GoalSelectorEvent.goalSelected({required Goal goal}) =
      GoalSelected;
}
