import 'package:dartz/dartz.dart';
import 'package:efpl/domain/league_table/i_league_table_repository.dart';
import 'package:efpl/domain/league_table/league_table.dart';
import 'package:efpl/domain/league_table/league_table_failure.dart';
import 'package:efpl/infrastructure/league_table/league_table_remote_data_provider.dart';
import 'package:efpl/infrastructure/league_table/league_table_local_data_provider.dart';
import 'package:efpl/services/utility.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ILeagueTableRepository)
class APILeagueTableRepository implements ILeagueTableRepository {
  Utility utility = Utility();
  final LeagueTableRemoteDataProvider _leagueTableRemoteDataProvider =
      LeagueTableRemoteDataProvider();

  final LeagueTableLocalDataProvider _leagueTableLocalDataProvider =
      LeagueTableLocalDataProvider();

  @override
  Future<Either<LeagueTableFailure, List<LeagueTable>>> getTeams() async {
    // if (await utility.hasInternetConnection()) {
    return _leagueTableRemoteDataProvider.getTeams();
    // } else {
    //   return _leagueTableLocalDataProvider.getTeams();
    // }
  }
}
