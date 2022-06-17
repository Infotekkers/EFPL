import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/core_value_objects.dart';
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

// class TeamPosition extends ValueObject {
//   @override
//   final Either<ValueFailure<String>, TeamPositionData> value;

//   factory TeamPosition({required TeamPositionData value}) {
//     return TeamPosition._(value: validateTeamPosition(teamPosition: value));
//   }

//   const TeamPosition._({required this.value});
// }

class TeamPoint extends ValueObject {
  @override
  final Either<ValueFailure<String>, int> value;

  factory TeamPoint({required int value}) {
    return TeamPoint._(value: validateTeamPoint(teamPoint: value));
  }

  const TeamPoint._({required this.value});
}

class TeamWon extends ValueObject {
  @override
  final Either<ValueFailure<String>, int> value;

  factory TeamWon({required int value}) {
    return TeamWon._(value: validateTeamWon(won: value));
  }

  const TeamWon._({required this.value});
}

class TeamLost extends ValueObject {
  @override
  final Either<ValueFailure<String>, int> value;

  factory TeamLost({required int value}) {
    return TeamLost._(value: validateTeamLost(lost: value));
  }

  const TeamLost._({required this.value});
}

class TeamDraw extends ValueObject {
  @override
  final Either<ValueFailure<String>, int> value;

  factory TeamDraw({required int value}) {
    return TeamDraw._(value: validateTeamDraw(Draw: value));
  }

  const TeamDraw._({required this.value});
}

class TeamGoalDifferntial extends ValueObject {
  @override
  final Either<ValueFailure<String>, int> value;

  factory TeamGoalDifferntial({required int value}) {
    return TeamGoalDifferntial._(
        value: validateTeamGoalDifferntial(goalDifferntial: value));
  }

  const TeamGoalDifferntial._({required this.value});
}

class TeamGoalAgainst extends ValueObject {
  @override
  final Either<ValueFailure<String>, int> value;

  factory TeamGoalAgainst({required int value}) {
    return TeamGoalAgainst._(
        value: validateTeamGoalAgainst(goalAgainst: value));
  }

  const TeamGoalAgainst._({required this.value});
}

class TeamGoalFor extends ValueObject {
  @override
  final Either<ValueFailure<String>, int> value;

  factory TeamGoalFor({required int value}) {
    return TeamGoalFor._(value: validateTeamGoalFor(goalFor: value));
  }

  const TeamGoalFor._({required this.value});
}
