// ignore_for_file: unused_field

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/points/i_points_facade.dart';
import 'package:efpl/domain/points/points.dart';
import 'package:efpl/infrastructure/points/points_local_data_provider.dart';
import 'package:efpl/infrastructure/points/points_remote_data_provider.dart';
import 'package:efpl/services/utility.dart';

class ApiPointsInfoRepository implements IPointInfoRepository {
  Utility utility = Utility();

  final PointsInfoRemoteDataProvider _pointsInfoRemoteDataProvider =
      PointsInfoRemoteDataProvider();

  final PointsInfoLocalDataProvider _pointsInfoLocalDataProvider =
      PointsInfoLocalDataProvider();

  @override
  Future<Either<dynamic, PointsInfo>> getPointByGameWeekId(
      {required int gameWeekId}) async {
    // if (await utility.hasInternetConnection()) {
    return await _pointsInfoRemoteDataProvider.getPointsInfoByGameWeekId(
        gameWeekId: gameWeekId);
    // } else {
    //   _pointsInfoLocalDataProvider.getCachedPointInfo(gameWeekId: gameWeekId);
    //   return left([]);
    // }
  }
}
