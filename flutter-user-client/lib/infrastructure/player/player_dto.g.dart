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
      price: json['price'] as String,
      availability: Map<String, String>.from(json['availability'] as Map),
      score: json['score'] as List<dynamic>? ?? const [],
      history: json['history'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$$_PlayerDtoToJson(_$_PlayerDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'playerId': instance.playerId,
      'eplTeamId': instance.eplTeamId,
      'position': instance.position,
      'price': instance.price,
      'availability': instance.availability,
      'score': instance.score,
      'history': instance.history,
    };
