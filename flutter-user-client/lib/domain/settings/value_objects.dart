import 'package:efpl/domain/core/value_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/core_value_objects.dart';
import 'package:efpl/domain/settings/value_validators.dart';

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

class UserName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 60;

  const UserName._(this.value);

  factory UserName(String userNameStr) {
    return UserName._(validateMaxStringLength(userNameStr, maxLength)
        .flatMap(validateStringNotEmpty));
  }
}

class FavouriteEplTeam extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 60;

  const FavouriteEplTeam._(this.value);

  factory FavouriteEplTeam(String favouriteEplTeam) {
    return FavouriteEplTeam._(
        validateMaxStringLength(favouriteEplTeam, maxLength)
            .flatMap(validateStringNotEmpty));
  }
}
