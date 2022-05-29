import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/value_failures.dart';

Either<ValueFailure<String>, String> validateLeagueCode(
    {required String leagueCode}) {
  return right(leagueCode);
}
