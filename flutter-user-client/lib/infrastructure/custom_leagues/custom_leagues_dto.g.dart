// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_leagues_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomLeaguesDTO _$$_CustomLeaguesDTOFromJson(Map<String, dynamic> json) =>
    _$_CustomLeaguesDTO(
      leagueId: json['leagueId'] as int,
      leagueName: json['leagueName'] as String,
      previousRank: json['previousRank'] as int,
    );

Map<String, dynamic> _$$_CustomLeaguesDTOToJson(_$_CustomLeaguesDTO instance) =>
    <String, dynamic>{
      'leagueId': instance.leagueId,
      'leagueName': instance.leagueName,
      'previousRank': instance.previousRank,
    };

_$_CustomLeagueInfoDTO _$$_CustomLeagueInfoDTOFromJson(
        Map<String, dynamic> json) =>
    _$_CustomLeagueInfoDTO(
      leagueId: json['leagueId'] as int,
      leagueName: json['leagueName'] as String,
      leagueType: json['leagueType'] as String,
      leagueCode: json['leagueCode'] as String,
      adminId: json['adminId'] as String,
      teams: json['teams'] as List<dynamic>,
      leagueStartGameWeek: json['leagueStartGameWeek'] as int,
    );

Map<String, dynamic> _$$_CustomLeagueInfoDTOToJson(
        _$_CustomLeagueInfoDTO instance) =>
    <String, dynamic>{
      'leagueId': instance.leagueId,
      'leagueName': instance.leagueName,
      'leagueType': instance.leagueType,
      'leagueCode': instance.leagueCode,
      'adminId': instance.adminId,
      'teams': instance.teams,
      'leagueStartGameWeek': instance.leagueStartGameWeek,
    };
