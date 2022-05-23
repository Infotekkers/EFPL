import 'package:dartz/dartz.dart';
import 'package:efpl/domain/epl_stats/epl_stats_failure.dart';
import 'package:efpl/domain/epl_stats/i_epl_stats_repository.dart';
import 'package:efpl/infrastructure/epl_stats/epl_stats_remote_data_provider.dart';
import 'package:injectable/injectable.dart';
import '../../domain/epl_stats/epl_stats.dart';

@LazySingleton(as: IEPLStatsRepository)
class EPLStatsRepository implements IEPLStatsRepository {
  final EPLStatsRemoteDataProvider _eplStatsRemoteDataProvider;

  EPLStatsRepository(this._eplStatsRemoteDataProvider);

  EPLStatsRemoteDataProvider get eplStatsRemoteDataProvider =>
      _eplStatsRemoteDataProvider;

  @override
  Future<Either<EPLStatsFailure, EPLStats>> getEPLStats() {
    return eplStatsRemoteDataProvider.getEPLStats();
  }
}
