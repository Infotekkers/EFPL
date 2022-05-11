import 'package:efpl/domain/core/value_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/value_objects.dart';
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
    return Chip._(validateChip(chipStr).flatMap(validateStringNotEmpty));
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

class PositionalContainer extends ValueObject<List<UserPlayer>> {
  @override
  final Either<ValueFailure<List<UserPlayer>>, List<UserPlayer>> value;

  const PositionalContainer._(this.value);

  static final positionalRange = {
    'gk': [1, 1],
    'def': [3, 5],
    'mid': [3, 5],
    'att': [1, 3],
    'sub': [4, 4]
  };

  factory PositionalContainer(List<UserPlayer> userPlayers, String position) {
    return PositionalContainer._(
        validatePositionalContainer(userPlayers, positionalRange, position));
  }
}

class UserPlayer {}
