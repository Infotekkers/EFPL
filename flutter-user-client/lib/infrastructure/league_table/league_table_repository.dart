import 'package:dartz/dartz.dart';
import 'package:efpl/domain/league_table/i_league_table_repository.dart';
import 'package:efpl/domain/league_table/league_table.dart';
import 'package:efpl/domain/league_table/league_table_failure.dart';
import 'package:efpl/infrastructure/league_table/league_table_remote_data_provider.dart';
import 'package:efpl/infrastructure/league_table/league_table_local_data_provider.dart';
import 'package:efpl/services/utility.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ILeagueTableRepository)
class LeagueTableRepository implements ILeagueTableRepository {
  final LeagueTableLocalDataProvider _leagueTableLocalDataProvider;
  final LeagueTableRemoteDataProvider _leagueTableRemoteDataProvider;

  LeagueTableRepository(
      this._leagueTableLocalDataProvider, this._leagueTableRemoteDataProvider);

  LeagueTableLocalDataProvider get leagueTableLocalDataProvider =>
      _leagueTableLocalDataProvider;
  LeagueTableRemoteDataProvider get leagueTableRemoteDataProvider =>
      _leagueTableRemoteDataProvider;

  Utility utility = Utility();

  @override
  Future<Either<LeagueTableFailure, LeagueTable>> getTeams() async {
    if (await utility.hasInternetConnection()) {
      return leagueTableRemoteDataProvider.getTeams();
    } else {
      return leagueTableLocalDataProvider.getTeams();
    }
  }
}
