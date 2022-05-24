import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:efpl/domain/league_table/value_object.dart';

part 'league_table.freezed.dart';

@freezed
abstract class LeagueTable with _$LeagueTable {
  const factory LeagueTable({
    required TeamName teamName,
    required TeamLogo teamLogo,
    required List<dynamic> teamPosition,
    // required TeamPoint teamPoint,
    // required TeamWon won,
    // required TeamLost lost,
    // required TeamDraw Draw,
    // required TeamGoalDifferntial goalDifferntial,
    // required TeamGoalAgainst goalAgainst,
    // required TeamGoalFor goalFor,
  }) = _LeagueTable;

  factory LeagueTable.initial() => LeagueTable(
        teamName: TeamName(value: ""),
        teamLogo: TeamLogo(value: ""),
        teamPosition: [],
      );
  // teamPoint: TeamPoint(value: 0),
  // won: TeamWon(value: 0),
  // lost: TeamLost(value: 0),
  // Draw: TeamDraw(value: 0),
  // goalDifferntial: TeamGoalDifferntial(value: 0),
  // goalAgainst: TeamGoalAgainst(value: 0),
  // goalFor: TeamGoalFor(value: 0));

// @freezed
// abstract class TeamLeagueTable with _$TeamLeagueTable {
//   const factory TeamLeagueTable({
//     required TeamPoint teamPoint,
//     required TeamWon won,
//     required TeamLost lost,
//     required TeamDraw Draw,
//     required TeamGoalDifferntial goalDifferntial,
//     required TeamGoalAgainst goalAgainst,
//     required TeamGoalFor goalFor,
//   }) = _TeamLeagueTable;

}
