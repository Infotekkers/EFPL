import 'package:efpl/domain/core/value_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/core_value_objects.dart';
import 'package:efpl/domain/settings/value_validators.dart';

class TeamName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 10;

  factory TeamName(String input) {
    return TeamName._(validateMaxStringLength(input, maxLength)
        .flatMap(validateStringNotEmpty));
  }

  const TeamName._(this.value);
}

class UserName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 10;

  factory UserName(String input) {
    return UserName._(validateMaxStringLength(input, maxLength)
        .flatMap(validateStringNotEmpty));
  }

  const UserName._(this.value);
}

class FavouriteEplTeam extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 60;

  factory FavouriteEplTeam(String input) {
    return FavouriteEplTeam._(validateMaxStringLength(input, maxLength)
        .flatMap(validateStringNotEmpty));
  }

  const FavouriteEplTeam._(this.value);
}
