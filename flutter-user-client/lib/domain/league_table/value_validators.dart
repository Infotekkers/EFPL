import 'package:dartz/dartz.dart';
import '../core/value_failures.dart';

// Either<ValueFailure<String>, String> validateMaxStringLength(
//   String myTeamStr,
//   int maxLength,
// ) {
//   if (myTeamStr.length <= maxLength) {
//     return right(myTeamStr);
//   } else {
//     return left(
//         ValueFailure.exceedingLength(failedValue: myTeamStr, max: maxLength));
//   }
// }

Either<ValueFailure<String>, String> validateStringNotEmpty(String myTeamStr) {
  if (myTeamStr.isNotEmpty) {
    return right(myTeamStr);
  } else {
    return left(ValueFailure.empty(failedValue: myTeamStr));
  }
}

Either<ValueFailure<String>, String> validateTeamName(
    {required String teamName}) {
  return right(teamName);
}

Either<ValueFailure<String>, String> validateTeamLogo(
    {required String teamLogo}) {
  return right(teamLogo);
}

Either<ValueFailure<String>, int> validateTeamPoint({required int teamPoint}) {
  return right(teamPoint);
}

Either<ValueFailure<String>, int> validateTeamWon({required int won}) {
  return right(won);
}

Either<ValueFailure<String>, int> validateTeamLost({required int lost}) {
  return right(lost);
}

// ignore: non_constant_identifier_names
Either<ValueFailure<String>, int> validateTeamDraw({required int Draw}) {
  return right(Draw);
}

Either<ValueFailure<String>, int> validateTeamGoalDifferntial(
    {required int goalDifferntial}) {
  return right(goalDifferntial);
}

Either<ValueFailure<String>, int> validateTeamGoalAgainst(
    {required int goalAgainst}) {
  return right(goalAgainst);
}

Either<ValueFailure<String>, int> validateTeamGoalFor({required int goalFor}) {
  return right(goalFor);
}

Either<ValueFailure<String>, Map> validateTeamPosition(
    {required Map teamPosition}) {
  return right(teamPosition);
}
