import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:efpl/domain/league_table/value_object.dart';

part 'league_table.freezed.dart';

@freezed
abstract class LeagueTable with _$LeagueTable {
  const factory LeagueTable({
    required TeamName teamName,
    required TeamName teamNameAmh,
    required TeamLogo teamLogo,
    required TeamPoint teamPoint,
    required TeamWon won,
    required TeamLost lost,
    // ignore: non_constant_identifier_names
    required TeamDraw Draw,
    required TeamGoalDifferntial goalDifferential,
    required TeamGoalAgainst goalsAgainst,
    required TeamGoalFor goalsFor,
  }) = _LeagueTable;

  factory LeagueTable.initial() => LeagueTable(
        teamName: TeamName(value: ""),
        teamNameAmh: TeamName(value: ""),
        teamLogo: TeamLogo(value: ""),
        teamPoint: TeamPoint(value: 0),
        won: TeamWon(value: 0),
        lost: TeamLost(value: 0),
        Draw: TeamDraw(value: 0),
        goalDifferential: TeamGoalDifferntial(value: 0),
        goalsAgainst: TeamGoalAgainst(value: 0),
        goalsFor: TeamGoalFor(value: 0),
      );
}
