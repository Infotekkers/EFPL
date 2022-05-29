// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_player_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PointUserPlayerDTO _$$_PointUserPlayerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_PointUserPlayerDTO(
      playerId: json['playerId'] as String,
      playerName: json['playerName'] as String,
      playerPosition: json['playerPosition'] as String,
      eplTeamId: json['eplTeamId'] as String,
      multiplier: json['multiplier'] as int,
      isCaptain: json['isCaptain'] as bool,
      isViceCaptain: json['isViceCaptain'] as bool,
      score: json['score'] as List<dynamic>,
      fixtureStatus: json['fixtureStatus'] as String,
      fixtureScore: json['fixtureScore'] as String,
      fixtureTeams: json['fixtureTeams'] as String,
    );

Map<String, dynamic> _$$_PointUserPlayerDTOToJson(
        _$_PointUserPlayerDTO instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'playerName': instance.playerName,
      'playerPosition': instance.playerPosition,
      'eplTeamId': instance.eplTeamId,
      'multiplier': instance.multiplier,
      'isCaptain': instance.isCaptain,
      'isViceCaptain': instance.isViceCaptain,
      'score': instance.score,
      'fixtureStatus': instance.fixtureStatus,
      'fixtureScore': instance.fixtureScore,
      'fixtureTeams': instance.fixtureTeams,
    };
