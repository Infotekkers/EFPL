// / Function to Validate Game Week ID
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/value_failures.dart';

Either<ValueFailure<String>, int> validateGameWeekId(
    {required int gameWeekId}) {
  // if empty
  // ignore: unnecessary_null_comparison
  if (!(gameWeekId != null)) {
    return left(const ValueFailure.emptyGameWeekId(failedValue: ''));
  } else if (gameWeekId < 0) {
    return left(const ValueFailure.invalidGameWeekId(failedValue: ''));
  }
  // If No Space
  else if (gameWeekId > 30) {
    return left(const ValueFailure.invalidGameWeekId(failedValue: ''));
  } else {
    return right(gameWeekId);
  }
}

// Function to Validate Match ID
Either<ValueFailure<String>, String> validateMatchId(
    {required String matchId}) {
  // if empty
  if (matchId.isEmpty) {
    return left(const ValueFailure.emptyMatchId(failedValue: ''));
  } else if (!matchId.contains("|")) {
    return left(const ValueFailure.invalidMatchId(failedValue: ''));
  }
  // If No Space
  else if (matchId.split("|").length != 2) {
    return left(const ValueFailure.invalidMatchId(failedValue: ''));
  } else {
    return right(matchId);
  }
}

// Function to Validate Schedule
Either<ValueFailure<String>, String> validateSchedule(
    {required String schedule}) {
  // if empty
  if (schedule.isEmpty) {
    return left(const ValueFailure.emptySchedule(failedValue: ''));
  } else {
    return right(schedule);
  }
}

// Function to Validate Status
Either<ValueFailure<String>, String> validateStatus({required String status}) {
  // if empty
  if (status.isEmpty) {
    return left(
      const ValueFailure.emptyStatus(failedValue: ''),
    );
  } else if (!(["scheduled", "liveFH", "HT", "liveSH", "FT"]
      .contains(status))) {
    return left(
      const ValueFailure.invalidStatus(failedValue: ''),
    );
  } else {
    return right(status);
  }
}

// Function to Validate Status
Either<ValueFailure<String>, String> validateTeam({required String team}) {
  // if empty
  if (team.isEmpty) {
    return left(const ValueFailure.emptyTeam(failedValue: ''));
  } else {
    return right(team);
  }
}

// Function to Validate Status
Either<ValueFailure<String>, Map> validateTeamLineUp(
    {required Map teamLineUp}) {
  // if empty

  return right(teamLineUp);
}

// Function to Validate Score
Either<ValueFailure<String>, String> validateScore({required String score}) {
  // if empty
  if (score.isEmpty) {
    return left(const ValueFailure.emptyScore(failedValue: ''));
  } else if (!score.contains("v")) {
    return left(const ValueFailure.invalidScore(failedValue: ''));
  }
  // If No Space
  else if (score.split("v").length != 2) {
    return left(const ValueFailure.invalidScore(failedValue: ''));
  } else {
    return right(score);
  }
}

// Function to Validate Score
Either<ValueFailure<String>, Map> validateMatchStat({required Map matchStat}) {
  // if empty

  return right(matchStat);
}

Either<ValueFailure<String>, String> validateTeamCity(
    {required String teamCity}) {
  // if empty

  return right(teamCity);
}

Either<ValueFailure<String>, String> validateTeamCoach(
    {required String teamCoach}) {
  // if empty

  return right(teamCoach);
}

Either<ValueFailure<String>, String> validateTeamLogo(
    {required String teamLogo}) {
  // if empty

  return right(teamLogo);
}

Either<ValueFailure<String>, String> validateStadium(
    {required String stadium}) {
  // if empty

  return right(stadium);
}

Either<ValueFailure<String>, int> validateStadiumCapacity(
    {required int capacity}) {
  // if empty

  return right(capacity);
}
