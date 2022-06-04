import 'package:dartz/dartz.dart';
import 'package:efpl/domain/efpl_stats/efpl_stats.dart';
import 'package:efpl/domain/efpl_stats/i_efpl_stats_facade..dart';
import 'package:efpl/infrastructure/efpl_stats/efpl_stats_remote_data_provider.dart';
import 'package:efpl/services/utility.dart';
import 'package:injectable/injectable.dart';

class EFPLStatsRepository implements IEFPLStatsRepository {
  Utility utility = Utility();

  final EFPLStatsRemoteDataProvider _efplStatsRemoteDataProvider =
      EFPLStatsRemoteDataProvider();

  // final TransferLocalDataProvider _transferLocalDataProvider =
  //     TransferLocalDataProvider();
  @override
  Future<Either<dynamic, EFPLStats>> getEFPLStats({required int gameWeekId}) {
    return _efplStatsRemoteDataProvider.getEFPLStats(gameWeekId: gameWeekId);
  }
}
