import 'package:dartz/dartz.dart';
import 'package:efpl/domain/my_team/value_objects.dart';
import '../core/value_failures.dart';

Either<ValueFailure<String>, String> validateMaxStringLength(
  String myTeamStr,
  int maxLength,
) {
  if (myTeamStr.length <= maxLength) {
    return right(myTeamStr);
  } else {
    return left(
        ValueFailure.exceedingLength(failedValue: myTeamStr, max: maxLength));
  }
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String myTeamStr) {
  if (myTeamStr.isNotEmpty) {
    return right(myTeamStr);
  } else {
    return left(ValueFailure.empty(failedValue: myTeamStr));
  }
}

Either<ValueFailure<String>, String> validateRange(
    String gameweekStr, List range) {
  int gameweekNumber = int.parse(gameweekStr);
  if (gameweekNumber >= range[0] && gameweekNumber <= range[-1]) {
    return right(gameweekStr);
  } else {
    return left(
        ValueFailure.exceedingRange(failedValue: gameweekStr, range: range));
  }
}

Either<ValueFailure<String>, String> validateChip(String chipStr) {
  if (chipStr == 'WC' ||
      chipStr == 'FH' ||
      chipStr == 'BB' ||
      chipStr == 'TC') {
    return right(chipStr);
  } else {
    return left(ValueFailure.invalid(failedValue: chipStr));
  }
}

Either<ValueFailure<List<Chip>>, List<Chip>> validateAvailabeChips(
    List<String> availableChipsStr, String activeChip) {
  List<Chip> availableChips = [];

  for (String chipStr in availableChipsStr) {
    availableChips.add(Chip(chipStr));
  }

  if (availableChipsStr.contains(activeChip)) {
    return left(ValueFailure.invalidChipUsage(
        failedValue: availableChips, activeChip: activeChip));
  } else {
    return right(availableChips);
  }
}
