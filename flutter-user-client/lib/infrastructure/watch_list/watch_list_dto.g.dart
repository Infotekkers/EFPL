// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WatchPlayerListDTO _$$_WatchPlayerListDTOFromJson(
        Map<String, dynamic> json) =>
    _$_WatchPlayerListDTO(
      playerId: json['playerId'] as String,
      playerName: json['playerName'] as String,
      currentPrice: (json['currentPrice'] as num).toDouble(),
      position: json['position'] as String,
      eplTeamId: json['eplTeamId'] as String,
      availability: json['availability'] as Map<String, dynamic>,
      eplTeamLogo: json['eplTeamLogo'] as String,
      score: json['score'] as int,
      upComingFixtures: json['upComingFixtures'] as List<dynamic>,
    );

Map<String, dynamic> _$$_WatchPlayerListDTOToJson(
        _$_WatchPlayerListDTO instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'playerName': instance.playerName,
      'currentPrice': instance.currentPrice,
      'position': instance.position,
      'eplTeamId': instance.eplTeamId,
      'availability': instance.availability,
      'eplTeamLogo': instance.eplTeamLogo,
      'score': instance.score,
      'upComingFixtures': instance.upComingFixtures,
    };
