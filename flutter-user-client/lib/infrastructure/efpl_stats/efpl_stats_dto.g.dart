// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'efpl_stats_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EFPLStatsDto _$$_EFPLStatsDtoFromJson(Map<String, dynamic> json) =>
    _$_EFPLStatsDto(
      highestPoint: json['highestPoint'] as int,
      averagePoint: json['averagePoint'] as int,
      mostSelectedPlayer: json['mostSelectedPlayer'] as List<dynamic>,
      mostTransferredOutPlayer:
          json['mostTransferredOutPlayer'] as List<dynamic>,
      transfersMadeCount: json['transfersMadeCount'] as int,
      mostCaptainedPlayer: json['mostCaptainedPlayer'] as List<dynamic>,
      mostViceCaptainedPlayer: json['mostViceCaptainedPlayer'] as List<dynamic>,
      benchBoostCount: json['benchBoostCount'] as int,
      freeHitCount: json['freeHitCount'] as int,
      wildCardCount: json['wildCardCount'] as int,
      tripleCaptainCount: json['tripleCaptainCount'] as int,
      dreamTeam: json['dreamTeam'] as Map<String, dynamic>,
      maxActiveCount: json['maxActiveCount'] as int,
      gameWeekId: json['gameWeekId'] as int,
    );

Map<String, dynamic> _$$_EFPLStatsDtoToJson(_$_EFPLStatsDto instance) =>
    <String, dynamic>{
      'highestPoint': instance.highestPoint,
      'averagePoint': instance.averagePoint,
      'mostSelectedPlayer': instance.mostSelectedPlayer,
      'mostTransferredOutPlayer': instance.mostTransferredOutPlayer,
      'transfersMadeCount': instance.transfersMadeCount,
      'mostCaptainedPlayer': instance.mostCaptainedPlayer,
      'mostViceCaptainedPlayer': instance.mostViceCaptainedPlayer,
      'benchBoostCount': instance.benchBoostCount,
      'freeHitCount': instance.freeHitCount,
      'wildCardCount': instance.wildCardCount,
      'tripleCaptainCount': instance.tripleCaptainCount,
      'dreamTeam': instance.dreamTeam,
      'maxActiveCount': instance.maxActiveCount,
      'gameWeekId': instance.gameWeekId,
    };
