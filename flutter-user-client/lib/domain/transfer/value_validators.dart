import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/value_failures.dart';

Either<ValueFailure<String>, int> validateGameWeekId(
    {required int gameWeekId}) {
  return right(gameWeekId);
}

Either<ValueFailure<String>, String> validatePlayerName(
    {required String playerName}) {
  return right(playerName);
}

Either<ValueFailure<String>, double> validatePlayerPrice(
    {required double playerPrice}) {
  return right(playerPrice);
}

Either<ValueFailure<String>, String> validatePlayerPosition(
    {required String playerPosition}) {
  return right(playerPosition);
}

Either<ValueFailure<String>, String> validatePlayerEplTeam(
    {required String playerEplTeam}) {
  return right(playerEplTeam);
}

Either<ValueFailure<String>, Map> validatePlayerAvailability(
    {required Map playerAvailability}) {
  return right(playerAvailability);
}
