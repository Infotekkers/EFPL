import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/value_objects.dart';
import 'package:efpl/domain/core/value_failures.dart';
import 'package:efpl/domain/league_table/value_validators.dart';

class TeamName extends ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  factory TeamName({required String value}) {
    return TeamName._(value: validateTeamName(teamName: value));
  }

  const TeamName._({required this.value});
}

class TeamLogo extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory TeamLogo({required String value}) {
    return TeamLogo._(value: validateTeamLogo(teamLogo: value));
  }

  const TeamLogo._({required this.value});
}

class TeamPoint extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const TeamPoint._(this.value);

  factory TeamPoint(String teamPointStr) {
    return TeamPoint._(validateStringNotEmpty(teamPointStr));
  }
}

class TeamWon extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const TeamWon._(this.value);

  factory TeamWon(String teamWonStr) {
    return TeamWon._(validateStringNotEmpty(teamWonStr));
  }
}

class TeamLost extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const TeamLost._(this.value);

  factory TeamLost(String teamLostStr) {
    return TeamLost._(validateStringNotEmpty(teamLostStr));
  }
}

class TeamDraw extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const TeamDraw._(this.value);

  factory TeamDraw(String teamDrawStr) {
    return TeamDraw._(validateStringNotEmpty(teamDrawStr));
  }
}

class TeamGoalDifferntial extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const TeamGoalDifferntial._(this.value);

  factory TeamGoalDifferntial(String teamGoalDifferntialStr) {
    return TeamGoalDifferntial._(
        validateStringNotEmpty(teamGoalDifferntialStr));
  }
}

class TeamGoalAgainst extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const TeamGoalAgainst._(this.value);

  factory TeamGoalAgainst(String teamGoalAgainstStr) {
    return TeamGoalAgainst._(validateStringNotEmpty(teamGoalAgainstStr));
  }
}

class TeamGoalFor extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const TeamGoalFor._(this.value);

  factory TeamGoalFor(String teamGoalForStr) {
    return TeamGoalFor._(validateStringNotEmpty(teamGoalForStr));
  }
}
