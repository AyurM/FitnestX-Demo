import 'package:bloc/bloc.dart';
import 'package:fitnest_x/data/model/goal.dart';
import 'package:fitnest_x/data/repository/goal_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_selector_event.dart';
part 'goal_selector_state.dart';
part 'goal_selector_bloc.freezed.dart';

class GoalSelectorBloc extends Bloc<GoalSelectorEvent, GoalSelectorState> {
  final GoalRepository _goalRepository;

  GoalSelectorBloc({required GoalRepository goalRepository})
      : _goalRepository = goalRepository,
        super(const _Initial()) {
    on<GoalSelected>(_onGoalSelected);
  }

  Future<void> _onGoalSelected(
      GoalSelected event, Emitter<GoalSelectorState> emit) async {
    emit(const _GoalSelectLoading());
    try {
      await _goalRepository.setUserGoal(event.goal);
      emit(const _GoalSelectSuccess());
    } catch (error) {
      emit(const _GoalSelectError(error: 'Failed to select goal'));
    }
  }
}
