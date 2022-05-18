import 'package:dartz/dartz.dart';
import 'package:efpl/domain/points/points.dart';
import 'package:efpl/domain/points/points_failures.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PointsInfoLocalDataProvider {
  Box pointsCache = Hive.box('pointsCache');

  PointsInfoLocalDataProvider();

  Future<Either<dynamic, PointsInfo>> getCachedPointInfo(
      {required int gameWeekId}) async {
    try {
      // List userPointGw = pointsCache.get('userPoint-$gameWeekId');

      print("userPointGw");

      return left([
        const PointsInfo(
          allPlayers: [],
          gameWeekId: 0,
          teamName: '',
          activeChip: '',
          deduction: 0,
          maxActiveCount: 0,
        ),
      ]);
    }
    //
    catch (e) {
      print(e);
      return left([
        const PointsInfo(
          allPlayers: [],
          gameWeekId: 0,
          teamName: '',
          activeChip: '',
          deduction: 0,
          maxActiveCount: 0,
        ),
        const PointFailure.hiveError(failedValue: "Hive Error")
      ]);
    }
  }

  void saveUserPointsInfo(
      {required int gameWeekId, required Map userPointTeam}) {
    try {
      pointsCache.put('userPoint-$gameWeekId', userPointTeam);
    } catch (e) {
      print(e);
    }
  }
}
