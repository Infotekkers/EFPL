import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/value_failures.dart';

Either<ValueFailure<String>, List> validateTopScorers(
    {required List topScorers}) {
  return right(topScorers);
}

Either<ValueFailure<String>, List> validateMostAssists(
    {required List mostAssists}) {
  return right(mostAssists);
}

Either<ValueFailure<String>, List> validateMostCleanSheets(
    {required List mostCleanSheets}) {
  return right(mostCleanSheets);
}

Either<ValueFailure<String>, List> validateMostReds({required List mostReds}) {
  return right(mostReds);
}

Either<ValueFailure<String>, List> validateMostYellows(
    {required List mostYellows}) {
  return right(mostYellows);
}

Either<ValueFailure<String>, List> validateMostSaves(
    {required List mostSaves}) {
  return right(mostSaves);
}

Either<ValueFailure<String>, List> validateMostMinutesPlayed(
    {required List mostMinutesPlayed}) {
  return right(mostMinutesPlayed);
}
