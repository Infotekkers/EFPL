import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/value_failures.dart';

Either<ValueFailure<String>, String> validatePlayerName(
    {required String playerName}) {
  return right(playerName);
}

Either<ValueFailure<String>, int> validateStatCount({required int statCount}) {
  return right(statCount);
}
