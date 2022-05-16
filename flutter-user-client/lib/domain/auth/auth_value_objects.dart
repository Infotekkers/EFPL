import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/core_value_objects.dart';
import 'package:efpl/domain/core/value_failures.dart';

import '../core/value_validators.dart';

// Email Address
class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    // ignore: unnecessary_null_comparison
    assert(input != null);
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
}

// Password
class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    // ignore: unnecessary_null_comparison
    assert(input != null);
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}

// UserName
class UserName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UserName(String input) {
    // ignore: unnecessary_null_comparison
    assert(input != null);
    return UserName._(
      validateUserName(input),
    );
  }

  const UserName._(this.value);
}

// TeamName
class TeamName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory TeamName(String input) {
    // ignore: unnecessary_null_comparison
    assert(input != null);
    return TeamName._(
      validateTeamName(input),
    );
  }

  const TeamName._(this.value);
}

// Country
class Country extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Country(String input) {
    // ignore: unnecessary_null_comparison
    assert(input != null);
    return Country._(
      validateNotEmpty(input),
    );
  }

  const Country._(this.value);
}

// Favorite EPl Team
class FavoriteEplTeam extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory FavoriteEplTeam(String input) {
    // ignore: unnecessary_null_comparison
    assert(input != null);
    return FavoriteEplTeam._(
      validateNotEmpty(input),
    );
  }

  const FavoriteEplTeam._(this.value);
}
