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

  if (gameweekNumber >= range[0] && gameweekNumber <= range[range.length - 1]) {
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
      chipStr == 'TC' ||
      chipStr == '') {
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

Either<ValueFailure<Map<String, dynamic>>, Map<String, dynamic>>
    validatePositionalContainer(Map<String, dynamic> userPlayers,
        Map<String, List<int>> positionalRange, String position) {
  if (positionalRange.containsKey(position) == false) {
    return left(ValueFailure.invalidPosition(
        failedValue: userPlayers, position: position));
  }

  int numberOfPlayers = userPlayers.length;
  List<int> range = positionalRange[position]!;

  if (numberOfPlayers >= range[0] &&
      numberOfPlayers <= range[range.length - 1]) {
    return right(userPlayers);
  } else {
    return left(
        ValueFailure.exceedingRange(failedValue: userPlayers, range: range));
  }
}

Either<ValueFailure<int>, int> validateRangeOfMultiplier(
    String playerStr, List range) {
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
