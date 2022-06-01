import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/value_failures.dart';

Either<ValueFailure<String>, int> validateLeagueId({required int leagueId}) {
  return right(leagueId);
}

Either<ValueFailure<String>, String> validateLeagueName(
    {required String leagueName}) {
  return right(leagueName);
}

Either<ValueFailure<String>, int> validatePreviousRank(
    {required int previousRank}) {
  return right(previousRank);
}
