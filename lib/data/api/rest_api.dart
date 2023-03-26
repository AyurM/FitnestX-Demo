import 'package:fitnest_x/data/model/goal.dart';

abstract class RestApi {
  Future<List<Goal>> getGoals();

  Future<void> setUserGoal(int goalId);
}
