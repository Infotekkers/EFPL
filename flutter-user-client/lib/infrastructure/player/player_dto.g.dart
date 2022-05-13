// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlayerDto _$$_PlayerDtoFromJson(Map<String, dynamic> json) => _$_PlayerDto(
      name: json['name'] as String,
      playerId: json['playerId'] as String,
      eplTeamId: json['eplTeamId'] as String,
      position: json['position'] as String,
      multiplier: json['multiplier'] as String,
      isCaptain: json['isCaptain'] as bool,
      isViceCaptain: json['isViceCaptain'] as bool,
    );

Map<String, dynamic> _$$_PlayerDtoToJson(_$_PlayerDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'playerId': instance.playerId,
      'eplTeamId': instance.eplTeamId,
      'position': instance.position,
      'multiplier': instance.multiplier,
      'isCaptain': instance.isCaptain,
      'isViceCaptain': instance.isViceCaptain,
    };
