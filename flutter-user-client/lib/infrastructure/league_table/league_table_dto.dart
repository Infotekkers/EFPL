// ignore_for_file: non_constant_identifier_names

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
    required String teamNameAmh,
    required String teamLogo,
    required int teamPoint,
    required int won,
    required int lost,
    required int Draw,
    required int goalsFor,
    required int goalsAgainst,
    required int goalDifferential,
  }) = _LeagueTableDto;

  factory LeagueTableDto.fromJson(Map<String, dynamic> json) =>
      _$LeagueTableDtoFromJson(json);

  LeagueTable toDomain() {
    return LeagueTable(
      teamName: TeamName(value: teamName),
      teamNameAmh: TeamName(value: teamNameAmh),
      teamLogo: TeamLogo(value: teamLogo),
      teamPoint: TeamPoint(value: teamPoint),
      won: TeamWon(value: won),
      lost: TeamLost(value: lost),
      Draw: TeamDraw(value: Draw),
      goalsFor: TeamGoalFor(value: goalsFor),
      goalsAgainst: TeamGoalAgainst(value: goalsAgainst),
      goalDifferential: TeamGoalDifferntial(value: goalDifferential),
    );
  }
}
