// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_table_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LeagueTableDto _$$_LeagueTableDtoFromJson(Map<String, dynamic> json) =>
    _$_LeagueTableDto(
      teamName: json['teamName'] as String,
      teamLogo: json['teamLogo'] as String,
      teamPosition: json['teamPosition'] as List<dynamic>,
    );

Map<String, dynamic> _$$_LeagueTableDtoToJson(_$_LeagueTableDto instance) =>
    <String, dynamic>{
      'teamName': instance.teamName,
      'teamLogo': instance.teamLogo,
      'teamPosition': instance.teamPosition,
    };
