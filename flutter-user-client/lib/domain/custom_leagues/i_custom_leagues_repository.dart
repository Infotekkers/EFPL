import 'package:dartz/dartz.dart';
import 'package:efpl/domain/custom_leagues/custom_leagues.dart';

abstract class ICustomLeaguesRepository {
  Future<Either<dynamic, List<CustomLeagues>>> getUserCustomLeagues({
    required String userId,
  });
}
