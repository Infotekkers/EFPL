import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/core_value_objects.dart';
import 'package:efpl/domain/core/value_failures.dart';
import 'package:efpl/domain/fixture/value_validators.dart';

// Game Week ID
class GameWeekId extends ValueObject {
  @override
  final Either<ValueFailure<String>, int> value;

  factory GameWeekId({required int value}) {
    return GameWeekId._(
      value: validateGameWeekId(gameWeekId: value),
    );
  }

  const GameWeekId._({required this.value});
}

// Match ID
class MatchId extends ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MatchId({required String value}) {
    return MatchId._(
      value: validateMatchId(matchId: value),
    );
  }

  const MatchId._({required this.value});
}

//  schedule
class Schedule extends ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Schedule({required String value}) {
    return Schedule._(
      value: validateSchedule(schedule: value),
    );
  }

  const Schedule._({required this.value});
}

// status
class Status extends ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Status({required String value}) {
    return Status._(
      value: validateStatus(status: value),
    );
  }

  const Status._({required this.value});
}

// Home Team
class Team extends ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Team({required String value}) {
    return Team._(
      value: validateTeam(team: value),
    );
  }

  const Team._({required this.value});
}

// Team Lineup
class TeamLineUp extends ValueObject {
  @override
  final Either<ValueFailure<String>, Map> value;

  factory TeamLineUp({required Map value}) {
    return TeamLineUp._(
      value: validateTeamLineUp(teamLineUp: value),
    );
  }

  const TeamLineUp._({required this.value});
}

// Score
class Score extends ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Score({required String value}) {
    return Score._(
      value: validateScore(score: value),
    );
  }

  const Score._({required this.value});
}

// Match Stat
class MatchStat extends ValueObject {
  @override
  final Either<ValueFailure<String>, Map> value;

  factory MatchStat({required Map value}) {
    return MatchStat._(
      value: validateMatchStat(matchStat: value),
    );
  }

  const MatchStat._({required this.value});
}

class TeamCity extends ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  factory TeamCity({required String value}) {
    return TeamCity._(
      value: validateTeamCity(teamCity: value),
    );
  }

  const TeamCity._({required this.value});
}

class TeamCoach extends ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  factory TeamCoach({required String value}) {
    return TeamCoach._(
      value: validateTeamCoach(teamCoach: value),
    );
  }

  const TeamCoach._({required this.value});
}

class TeamLogo extends ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  factory TeamLogo({required String value}) {
    return TeamLogo._(
      value: validateTeamLogo(teamLogo: value),
    );
  }

  const TeamLogo._({required this.value});
}

class Stadium extends ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Stadium({required String value}) {
    return Stadium._(
      value: validateStadium(stadium: value),
    );
  }

  const Stadium._({required this.value});
}

class StadiumCapacity extends ValueObject {
  @override
  final Either<ValueFailure<String>, int> value;

  factory StadiumCapacity({required int value}) {
    return StadiumCapacity._(
      value: validateStadiumCapacity(capacity: value),
    );
  }

  const StadiumCapacity._({required this.value});
}
