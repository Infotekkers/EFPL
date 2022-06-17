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
      teamLogoUrl: json['teamLogoUrl'] as String? ?? "",
      availability: (json['availability'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {"injuryStatus": "100", "injuryMessage": "fit to play"},
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
      'teamLogoUrl': instance.teamLogoUrl,
      'availability': instance.availability,
      'score': instance.score,
      'history': instance.history,
    };
