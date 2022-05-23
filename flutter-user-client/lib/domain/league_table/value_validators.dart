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
