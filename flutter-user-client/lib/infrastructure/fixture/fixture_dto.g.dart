// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixture_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FixtureDTO _$$_FixtureDTOFromJson(Map<String, dynamic> json) =>
    _$_FixtureDTO(
      gameWeekId: json['gameWeekId'] as int,
      matchId: json['matchId'] as String,
      schedule: json['schedule'] as String,
      status: json['status'] as String,
      fdr: json['fdr'] as int,
      homeTeam: json['homeTeam'] as String,
      homeTeamAmh: json['homeTeamAmh'] as String,
      homeTeamLineUp: json['homeTeamLineUp'] as Map<String, dynamic>,
      homeTeamCity: json['homeTeamCity'] as String,
      homeTeamCoach: json['homeTeamCoach'] as String,
      homeTeamLogo: json['homeTeamLogo'] as String,
      homeTeamStadium: json['homeTeamStadium'] as String,
      homeTeamCapacity: json['homeTeamCapacity'] as int,
      awayTeam: json['awayTeam'] as String,
      awayTeamAmh: json['awayTeamAmh'] as String,
      awayTeamLineUp: json['awayTeamLineUp'] as Map<String, dynamic>,
      awayTeamCity: json['awayTeamCity'] as String,
      awayTeamCoach: json['awayTeamCoach'] as String,
      awayTeamLogo: json['awayTeamLogo'] as String,
      awayTeamStadium: json['awayTeamStadium'] as String,
      awayTeamCapacity: json['awayTeamCapacity'] as int,
      score: json['score'] as String,
    );

Map<String, dynamic> _$$_FixtureDTOToJson(_$_FixtureDTO instance) =>
    <String, dynamic>{
      'gameWeekId': instance.gameWeekId,
      'matchId': instance.matchId,
      'schedule': instance.schedule,
      'status': instance.status,
      'fdr': instance.fdr,
      'homeTeam': instance.homeTeam,
      'homeTeamAmh': instance.homeTeamAmh,
      'homeTeamLineUp': instance.homeTeamLineUp,
      'homeTeamCity': instance.homeTeamCity,
      'homeTeamCoach': instance.homeTeamCoach,
      'homeTeamLogo': instance.homeTeamLogo,
      'homeTeamStadium': instance.homeTeamStadium,
      'homeTeamCapacity': instance.homeTeamCapacity,
      'awayTeam': instance.awayTeam,
      'awayTeamAmh': instance.awayTeamAmh,
      'awayTeamLineUp': instance.awayTeamLineUp,
      'awayTeamCity': instance.awayTeamCity,
      'awayTeamCoach': instance.awayTeamCoach,
      'awayTeamLogo': instance.awayTeamLogo,
      'awayTeamStadium': instance.awayTeamStadium,
      'awayTeamCapacity': instance.awayTeamCapacity,
      'score': instance.score,
    };
