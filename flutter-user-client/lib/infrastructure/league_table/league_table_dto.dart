import 'dart:ffi';

import 'package:efpl/domain/league_table/league_table.dart';
import 'package:efpl/domain/league_table/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'league_table_dto.freezed.dart';
part 'league_table_dto.g.dart';

@freezed
abstract class LeagueTableDto implements _$LeagueTableDto {
  const LeagueTableDto._();

  const factory LeagueTableDto({
    required String teamName,
    required String teamLogo,
    required List<dynamic> teamPosition,
    // required int teamPoint,
    // required int won,
    // required int lost,
    // required int Draw,
    // required int goalsFor,
    // required int goalsAgainst,
    // required int goalDifferntial,
  }) = _LeagueTableDto;

  factory LeagueTableDto.fromJson(Map<String, dynamic> json) =>
      _$LeagueTableDtoFromJson(json);

  LeagueTable toDomain() {
    return LeagueTable(
        teamName: TeamName(value: teamName),
        teamLogo: TeamLogo(value: teamLogo),
        teamPosition: []
        // teamPoint: TeamPoint(value: teamPoint),
        // won: TeamWon(value: won),
        // lost: TeamLost(value: lost),
        // Draw: TeamDraw(value: Draw),
        // goalFor: TeamGoalFor(value: goalsFor),
        // goalAgainst: TeamGoalAgainst(value: goalsAgainst),
        // goalDifferntial: TeamGoalDifferntial(value: goalDifferntial),
        );
  }
}
