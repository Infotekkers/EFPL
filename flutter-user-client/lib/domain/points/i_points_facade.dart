import 'package:dartz/dartz.dart';
import 'package:efpl/domain/points/points.dart';

abstract class IPointInfoRepository {
  Future<Either<dynamic, PointsInfo>> getPointByGameWeekId({
    required int gameWeekId,
  });
}
