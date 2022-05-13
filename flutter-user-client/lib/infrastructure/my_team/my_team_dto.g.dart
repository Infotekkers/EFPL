// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_team_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyTeamDto _$$_MyTeamDtoFromJson(Map<String, dynamic> json) => _$_MyTeamDto(
      teamName: json['teamName'] as String,
      gameweek: json['gameweek'] as String,
      availableChips: (json['availableChips'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      activeChip: json['activeChip'] as String,
      players: json['players'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$_MyTeamDtoToJson(_$_MyTeamDto instance) =>
    <String, dynamic>{
      'teamName': instance.teamName,
      'gameweek': instance.gameweek,
      'availableChips': instance.availableChips,
      'activeChip': instance.activeChip,
      'players': instance.players,
    };
