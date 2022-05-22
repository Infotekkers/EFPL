import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/value_failures.dart';
import 'package:efpl/domain/stats/stats_failures.dart';

Either<ValueFailure<String>, String> validatePlayerName(
    {required String playerName}) {
  return right(playerName);
}

Either<StatsFailures<String>, int> validateStat({required int stat}) {
  if (stat < -1) {
    return left(StatsFailures.negativeValue(failedValue: stat));
  } else {
    return right(stat);
  }
}
