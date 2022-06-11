import 'package:dartz/dartz.dart';
import 'package:efpl/domain/custom_leagues/custom_leagues.dart';
import 'package:efpl/domain/custom_leagues/i_custom_leagues_repository.dart';
import 'package:efpl/domain/custom_leagues/value_objects.dart';
import 'package:efpl/infrastructure/custom_leagues/custom_leagues_remote_data_provider.dart';

class ApiCustomLeaguesRepository implements ICustomLeaguesRepository {
  final CustomLeaguesRemoteDataProvider _customLeaguesRemoteDataProvider =
      CustomLeaguesRemoteDataProvider();

  @override
  Future<Either<dynamic, List<CustomLeagues>>> getUserCustomLeagues({
    required String userId,
  }) async {
    return _customLeaguesRemoteDataProvider.getUserCustomLeagues(
      userId: userId,
    );
  }

  @override
  Future<Either<dynamic, CustomLeaguesInfo>> getCustomLeagueInfo(
      {required int leagueId}) async {
    return _customLeaguesRemoteDataProvider.getCustomLeagueInfo(
      leagueId: leagueId,
    );
  }

  @override
  Future<Either<dynamic, CustomLeaguesInfo>> createCustomLeague(
      {required String userId, required String leagueName}) async {
    return _customLeaguesRemoteDataProvider.createCustomLeague(
      userId: AdminId(value: userId),
      leagueName: LeagueName(value: leagueName),
    );
  }

  @override
  Future<Either<dynamic, CustomLeaguesInfo>> joinCustomLeague(
      {required String userId, required String leagueCode}) async {
    return _customLeaguesRemoteDataProvider.joinCustomLeague(
      userId: AdminId(value: userId),
      leagueCode: LeagueCode(value: leagueCode),
    );
  }
}
