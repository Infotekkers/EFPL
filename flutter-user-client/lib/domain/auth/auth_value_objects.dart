import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/core_value_objects.dart';
import 'package:efpl/domain/core/value_failures.dart';

import '../core/value_validators.dart';

// Email Address
class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory EmailAddress(String emailStr) {
    return EmailAddress._(
      validateEmailAddress(emailStr),
    );
  }

  const EmailAddress._(this.value);
}

// Password
class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String passStr) {
    return Password._(
      validatePassword(passStr),
    );
  }

  const Password._(this.value);
}

// UserName
class UserName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UserName(String userNameStr) {
    return UserName._(
      validateName(userNameStr),
    );
  }

  const UserName._(this.value);
}

// TeamName
class TeamName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory TeamName(String teamNameStr) {
    return TeamName._(
      validateName(teamNameStr),
    );
  }

  const TeamName._(this.value);
}

// Country
class Country extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Country(String countryStr) {
    return Country._(validateNotEmpty(countryStr));
  }

  const Country._(this.value);
}

// Favorite EPl Team
class FavoriteEplTeam extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory FavoriteEplTeam(String favTeamStr) {
    return FavoriteEplTeam._(validateNotEmpty(favTeamStr));
  }

  const FavoriteEplTeam._(this.value);
}
