import 'package:dartz/dartz.dart';
import 'package:efpl/domain/custom_leagues/custom_leagues.dart';

abstract class ICustomLeaguesRepository {
  Future<Either<dynamic, List<CustomLeagues>>> getUserCustomLeagues({
    required String userId,
  });
  Future<Either<dynamic, CustomLeaguesInfo>> getCustomLeagueInfo({
    required int leagueId,
  });
  Future<Either<dynamic, CustomLeaguesInfo>> createCustomLeague({
    required String userId,
    required String leagueName,
  });
  Future<Either<dynamic, CustomLeaguesInfo>> joinCustomLeague({
    required String userId,
    required String leagueCode,
  });
  Future<Either<dynamic, String>> leaveCustomLeague({
    required String userId,
    required String leagueCode,
  });
}
