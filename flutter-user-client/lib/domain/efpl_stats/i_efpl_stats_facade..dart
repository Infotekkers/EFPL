// ignore: file_names
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/efpl_stats/efpl_stats.dart';

abstract class IEFPLStatsRepository {
  Future<Either<dynamic, EFPLStats>> getEFPLStats({required int gameWeekId});
}
