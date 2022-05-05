// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixture_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FixtureDTO _$$_FixtureDTOFromJson(Map<String, dynamic> json) =>
    _$_FixtureDTO(
      gameweekId: json['gameweekId'] as int,
      matchId: json['matchId'] as String,
      schedule: json['schedule'] as String,
      status: json['status'] as String,
      homeTeam: json['homeTeam'] as String,
      awayTeam: json['awayTeam'] as String,
      homeTeamLineUp: json['homeTeamLineUp'] as List<dynamic>,
      awayTeamLineUp: json['awayTeamLineUp'] as List<dynamic>,
      score: json['score'] as String,
      matchStat: json['matchStat'] as List<dynamic>,
    );

Map<String, dynamic> _$$_FixtureDTOToJson(_$_FixtureDTO instance) =>
    <String, dynamic>{
      'gameweekId': instance.gameweekId,
      'matchId': instance.matchId,
      'schedule': instance.schedule,
      'status': instance.status,
      'homeTeam': instance.homeTeam,
      'awayTeam': instance.awayTeam,
      'homeTeamLineUp': instance.homeTeamLineUp,
      'awayTeamLineUp': instance.awayTeamLineUp,
      'score': instance.score,
      'matchStat': instance.matchStat,
    };
