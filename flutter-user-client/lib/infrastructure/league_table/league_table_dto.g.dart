// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_table_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LeagueTableDto _$$_LeagueTableDtoFromJson(Map<String, dynamic> json) =>
    _$_LeagueTableDto(
      teamName: json['teamName'] as String,
      teamNameAmh: json['teamNameAmh'] as String,
      teamLogo: json['teamLogo'] as String,
      teamPoint: json['teamPoint'] as int,
      won: json['won'] as int,
      lost: json['lost'] as int,
      Draw: json['Draw'] as int,
      goalsFor: json['goalsFor'] as int,
      goalsAgainst: json['goalsAgainst'] as int,
      goalDifferential: json['goalDifferential'] as int,
    );

Map<String, dynamic> _$$_LeagueTableDtoToJson(_$_LeagueTableDto instance) =>
    <String, dynamic>{
      'teamName': instance.teamName,
      'teamNameAmh': instance.teamNameAmh,
      'teamLogo': instance.teamLogo,
      'teamPoint': instance.teamPoint,
      'won': instance.won,
      'lost': instance.lost,
      'Draw': instance.Draw,
      'goalsFor': instance.goalsFor,
      'goalsAgainst': instance.goalsAgainst,
      'goalDifferential': instance.goalDifferential,
    };
