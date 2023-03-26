import 'dart:math';
import 'dart:developer' as dev;

import 'package:fitnest_x/data/api/rest_api.dart';
import 'package:fitnest_x/data/model/goal.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';

const _kMinMockLoadingDurationInMs = 300;
const _kMaxMockLoadingDurationInMs = 1000;

class MockRestApi implements RestApi {
  static const _tag = 'MockRestApi';
  final _random = Random();

  @override
  Future<List<Goal>> getGoals() async {
    await Future.delayed(_randomMockLoadingDuration);
    return DataMockUtils.getMockGoals();
  }

  @override
  Future<void> setUserGoal(int goalId) async {
    await Future.delayed(_randomMockLoadingDuration);
    dev.log('setUserGoal. ID: $goalId', name: _tag);
  }

  Duration get _randomMockLoadingDuration => Duration(
      milliseconds: _random.nextInt(
              _kMaxMockLoadingDurationInMs - _kMinMockLoadingDurationInMs) +
          _kMinMockLoadingDurationInMs);
}
