import 'package:dartz/dartz.dart';
import 'package:efpl/domain/settings/value_objects.dart';
import '../core/value_failures.dart';

Either<ValueFailure<String>, String> validateStringNotEmpty(
    String teamNameStr) {
  if (teamNameStr.isNotEmpty) {
    return right(teamNameStr);
  } else {
    return left(ValueFailure.empty(failedValue: teamNameStr));
  }
}

Either<ValueFailure<String>, String> validateMaxStringLength(
  String teamNameStr,
  int maxLength,
) {
  if (teamNameStr.length <= maxLength) {
    return right(teamNameStr);
  } else {
    return left(
        ValueFailure.exceedingLength(failedValue: teamNameStr, max: maxLength));
  }
}
