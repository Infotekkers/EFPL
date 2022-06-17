// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'epl_stats_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EPLStatsDto _$$_EPLStatsDtoFromJson(Map<String, dynamic> json) =>
    _$_EPLStatsDto(
      topScorers: json['topScorers'] as List<dynamic>,
      mostAssists: json['mostAssists'] as List<dynamic>,
      mostCleanSheets: json['mostCleanSheets'] as List<dynamic>,
      mostReds: json['mostReds'] as List<dynamic>,
      mostYellows: json['mostYellows'] as List<dynamic>,
      mostSaves: json['mostSaves'] as List<dynamic>,
      mostMinutesPlayed: json['mostMinutesPlayed'] as List<dynamic>,
    );

Map<String, dynamic> _$$_EPLStatsDtoToJson(_$_EPLStatsDto instance) =>
    <String, dynamic>{
      'topScorers': instance.topScorers,
      'mostAssists': instance.mostAssists,
      'mostCleanSheets': instance.mostCleanSheets,
      'mostReds': instance.mostReds,
      'mostYellows': instance.mostYellows,
      'mostSaves': instance.mostSaves,
      'mostMinutesPlayed': instance.mostMinutesPlayed,
    };
