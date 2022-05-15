// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlayerDto _$$_PlayerDtoFromJson(Map<String, dynamic> json) => _$_PlayerDto(
      playerName: json['playerName'] as String,
      playerId: json['playerId'] as int,
      eplTeamId: json['eplTeamId'] as String,
      position: json['position'] as String,
      currentPrice: (json['currentPrice'] as num).toDouble(),
      availability: Map<String, String>.from(json['availability'] as Map),
      score: json['score'] as List<dynamic>? ?? const [],
      history: json['history'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$$_PlayerDtoToJson(_$_PlayerDto instance) =>
    <String, dynamic>{
      'playerName': instance.playerName,
      'playerId': instance.playerId,
      'eplTeamId': instance.eplTeamId,
      'position': instance.position,
      'currentPrice': instance.currentPrice,
      'availability': instance.availability,
      'score': instance.score,
      'history': instance.history,
    };
