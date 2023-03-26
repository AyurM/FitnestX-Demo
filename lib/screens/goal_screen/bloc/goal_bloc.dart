import 'package:bloc/bloc.dart';
import 'package:fitnest_x/data/model/goal.dart';
import 'package:fitnest_x/data/repository/goal_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_event.dart';
part 'goal_state.dart';
part 'goal_bloc.freezed.dart';

class GoalBloc extends Bloc<GoalEvent, GoalState> {
  final GoalRepository _goalRepository;

  GoalBloc({required GoalRepository goalRepository})
      : _goalRepository = goalRepository,
        super(const _Initial()) {
    on<GoalsRequested>(_onGoalsRequested);
    on<GoalSelected>(_onGoalSelected);
  }

  Future<void> _onGoalsRequested(
      GoalsRequested event, Emitter<GoalState> emit) async {
    emit(const _Loading());
    try {
      final goals = await _goalRepository.getGoals();
      emit(goals.isEmpty ? const _Empty() : _Success(goals: [...goals]));
    } catch (error) {
      emit(const _Error(error: 'Failed to load goals'));
    }
  }

  Future<void> _onGoalSelected(
      GoalSelected event, Emitter<GoalState> emit) async {
    emit(const _GoalSelectLoading());
    try {
      await _goalRepository.setUserGoal(event.goal);
      emit(const _GoalSelectSuccess());
    } catch (error) {
      emit(const _GoalSelectError(error: 'Failed to select goal'));
    }
  }
}
