import 'package:fitnest_x/base/app_exception.dart';
import 'package:fitnest_x/data/api/rest_api.dart';
import 'package:fitnest_x/data/model/goal.dart';

class GoalRepository {
  final RestApi _restApi;

  const GoalRepository({required RestApi restApi}) : _restApi = restApi;

  Future<List<Goal>> getGoals() async {
    try {
      return await _restApi.getGoals();
    } catch (error) {
      //For purposes of this demo error type is always AppExceptionType.unknownError.
      //In practice catched error object can be created, for example, with
      //Dio error interceptor and can contain additional information about error type.
      throw const AppException(errorType: AppExceptionType.unknownError);
    }
  }

  Future<void> setUserGoal(Goal goal) async {
    try {
      await _restApi.setUserGoal(goal.id);
    } catch (error) {
      throw const AppException(errorType: AppExceptionType.unknownError);
    }
  }
}
