import 'package:dartz/dartz.dart';
import 'package:efpl/domain/epl_stats/epl_stats.dart';
import 'package:efpl/domain/epl_stats/epl_stats_failure.dart';

abstract class IEPLStatsRepository {
  Future<Either<EPLStatsFailure, EPLStats>> getEPLStats();
}
