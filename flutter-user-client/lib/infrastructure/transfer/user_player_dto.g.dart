// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_player_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserPlayerDTO _$$_UserPlayerDTOFromJson(Map<String, dynamic> json) =>
    _$_UserPlayerDTO(
      playerId: json['playerId'] as String,
      playerName: json['playerName'] as String,
      currentPrice: (json['currentPrice'] as num).toDouble(),
      position: json['position'] as String,
      eplTeamId: json['eplTeamId'] as String,
      multiplier: json['multiplier'] as int,
      isCaptain: json['isCaptain'] as bool,
      isViceCaptain: json['isViceCaptain'] as bool,
      availability: json['availability'] as Map<String, dynamic>,
      eplTeamLogo: json['eplTeamLogo'] as String,
      score: json['score'] as int,
      upComingFixtures: json['upComingFixtures'] as List<dynamic>,
    );

Map<String, dynamic> _$$_UserPlayerDTOToJson(_$_UserPlayerDTO instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'playerName': instance.playerName,
      'currentPrice': instance.currentPrice,
      'position': instance.position,
      'eplTeamId': instance.eplTeamId,
      'multiplier': instance.multiplier,
      'isCaptain': instance.isCaptain,
      'isViceCaptain': instance.isViceCaptain,
      'availability': instance.availability,
      'eplTeamLogo': instance.eplTeamLogo,
      'score': instance.score,
      'upComingFixtures': instance.upComingFixtures,
    };
