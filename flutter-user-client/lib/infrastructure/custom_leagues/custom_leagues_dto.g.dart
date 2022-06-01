// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_leagues_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomLeaguesDTO _$$_CustomLeaguesDTOFromJson(Map<String, dynamic> json) =>
    _$_CustomLeaguesDTO(
      leagueId: json['leagueId'] as String,
      leagueName: json['leagueName'] as String,
      previousRank: json['previousRank'] as int,
    );

Map<String, dynamic> _$$_CustomLeaguesDTOToJson(_$_CustomLeaguesDTO instance) =>
    <String, dynamic>{
      'leagueId': instance.leagueId,
      'leagueName': instance.leagueName,
      'previousRank': instance.previousRank,
    };
