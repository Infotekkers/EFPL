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
