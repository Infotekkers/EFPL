import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:efpl/domain/league_table/value_object.dart';

part 'league_table.freezed.dart';

@freezed
abstract class LeagueTable with _$LeagueTable {
  const factory LeagueTable({
    required TeamName teamName,
    required TeamLogo teamLogo,
  }) = _LeagueTable;

  factory LeagueTable.initial() => LeagueTable(
        teamName: TeamName(value: ""),
        teamLogo: TeamLogo(value: ""),
      );
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
