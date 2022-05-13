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

Either<ValueFailure<int>, int> validateRange(String playerStr, List range) {
  int playerNumber = int.parse(playerStr);

  if (playerNumber >= range[0] && playerNumber <= range[range.length - 1]) {
    return right(playerNumber);
  } else {
    return left(
        ValueFailure.exceedingRange(failedValue: playerNumber, range: range));
  }
}

Either<ValueFailure<String>, String> validatePosition(
    String positionStr, List<String> validPositions) {
  if (validPositions.contains(positionStr)) {
    return right(positionStr);
  } else {
    return left(ValueFailure.invalid(failedValue: positionStr));
  }
}
