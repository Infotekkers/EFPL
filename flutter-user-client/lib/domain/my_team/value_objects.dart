import 'package:efpl/domain/core/value_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/core_value_objects.dart';
import 'package:efpl/domain/my_team/value_validators.dart';

class TeamName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 60;

  const TeamName._(this.value);

  factory TeamName(String teamNameStr) {
    return TeamName._(validateMaxStringLength(teamNameStr, maxLength)
        .flatMap(validateStringNotEmpty));
  }
}

class Gameweek extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static final range = [1, 30];

  const Gameweek._(this.value);

  factory Gameweek(String gameweekStr) {
    return Gameweek._(
        validateRange(gameweekStr, range).flatMap(validateStringNotEmpty));
  }
}

class Chip extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const Chip._(this.value);

  factory Chip(String chipStr) {
    return Chip._(validateChip(chipStr));
  }
}

class AvailableChips extends ValueObject<List<Chip>> {
  @override
  final Either<ValueFailure<List<Chip>>, List<Chip>> value;

  const AvailableChips._(this.value);

  factory AvailableChips(List<String> availableChipsStr, String activeChip) {
    return AvailableChips._(
        validateAvailabeChips(availableChipsStr, activeChip));
  }
}

class PositionalContainer extends ValueObject<Map<String, dynamic>> {
  @override
  final Either<ValueFailure<Map<String, dynamic>>, Map<String, dynamic>> value;

  const PositionalContainer._(this.value);

  static final positionalRange = {
    'gk': [1, 1],
    'def': [3, 5],
    'mid': [3, 5],
    'att': [1, 3],
    'sub': [4, 4]
  };

  factory PositionalContainer(
      Map<String, dynamic> userPlayers, String position) {
    return PositionalContainer._(
        validatePositionalContainer(userPlayers, positionalRange, position));
  }
}

// * VOs for simplified player in my team
class PlayerName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 60;

  const PlayerName._(this.value);

  factory PlayerName(String nameStr) {
    return PlayerName._(validateMaxStringLength(nameStr, maxLength)
        .flatMap(validateStringNotEmpty));
  }
}

class PlayerId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const PlayerId._(this.value);

  factory PlayerId(String idStr) {
    return PlayerId._(validateStringNotEmpty(idStr));
  }
}

class EplTeamId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const EplTeamId._(this.value);

  factory EplTeamId(String eplTeamIdStr) {
    return EplTeamId._(validateStringNotEmpty(eplTeamIdStr));
  }
}

class Position extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const validPositions = ['gk', 'def', 'mid', 'att', 'sub'];

  const Position._(this.value);

  factory Position(String positionStr) {
    return Position._(validatePosition(positionStr, validPositions)
        .flatMap(validateStringNotEmpty));
  }
}

class Multiplier extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  static const range = [0, 3];

  const Multiplier._(this.value);

  factory Multiplier(String multiplierValue) {
    return Multiplier._(validateRangeOfMultiplier(multiplierValue, range));
  }
}

class IsCaptain extends ValueObject<bool> {
  @override
  final Either<ValueFailure<bool>, bool> value;

  const IsCaptain._(this.value);

  factory IsCaptain(bool isCaptainValue) {
    return IsCaptain._(right(isCaptainValue));
  }
}

class IsViceCaptain extends ValueObject<bool> {
  @override
  final Either<ValueFailure<bool>, bool> value;

  const IsViceCaptain._(this.value);

  factory IsViceCaptain(bool isViceCaptainValue) {
    return IsViceCaptain._(right(isViceCaptainValue));
  }
}
