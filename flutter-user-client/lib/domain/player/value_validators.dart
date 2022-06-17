import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/value_failures.dart';

Either<ValueFailure<String>, String> validateMaxStringLength(
  String playerStr,
  int maxLength,
) {
  if (playerStr.length <= maxLength) {
    return right(playerStr);
  } else {
    return left(
        ValueFailure.exceedingLength(failedValue: playerStr, max: maxLength));
  }
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String playerStr) {
  if (playerStr.isNotEmpty) {
    return right(playerStr);
  } else {
    return left(ValueFailure.empty(failedValue: playerStr));
  }
}

Either<ValueFailure<String>, String> validatePosition(
    String positionStr, List<String> validPositions) {
  positionStr = positionStr.toLowerCase();
  if (validPositions.contains(positionStr)) {
    return right(positionStr);
  } else {
    return left(ValueFailure.invalid(failedValue: positionStr));
  }
}

Either<ValueFailure<String>, String> validateRange(
    String gameweekStr, List range) {
  int gameweekNumber = int.parse(gameweekStr);

  if (gameweekNumber >= range[0] && gameweekNumber <= range[range.length - 1]) {
    return right(gameweekStr);
  } else {
    return left(
        ValueFailure.exceedingRange(failedValue: gameweekStr, range: range));
  }
}
