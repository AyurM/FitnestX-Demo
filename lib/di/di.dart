import 'package:fitnest_x/data/api/mock_rest_api.dart';
import 'package:fitnest_x/data/api/rest_api.dart';
import 'package:fitnest_x/data/repository/goal_repository.dart';
import 'package:fitnest_x/screens/goal_screen/bloc/goal_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

void initializeGetIt() {
  _registerApiClient();
  _registerRepositories();
  _registerBlocs();
}

void _registerApiClient() {
  getIt.registerSingleton<RestApi>(MockRestApi());
}

void _registerRepositories() {
  getIt.registerSingleton(GoalRepository(restApi: get()));
}

void _registerBlocs() {
  getIt.registerFactory(() => GoalBloc(goalRepository: get()));
}

T get<T extends Object>() => getIt.get<T>();
