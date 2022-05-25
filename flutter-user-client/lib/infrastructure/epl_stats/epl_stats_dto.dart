import 'package:efpl/domain/epl_stats/epl_stats.dart';
import 'package:efpl/domain/epl_stats/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'epl_stats_dto.freezed.dart';
part 'epl_stats_dto.g.dart';

@freezed
abstract class EPLStatsDto implements _$EPLStatsDto {
  const EPLStatsDto._();

  const factory EPLStatsDto({
    required String playerName,
    required int stat,
  }) = _EPLStatsDto;

  factory EPLStatsDto.fromDomain(EPLStats eplStats) {
    return EPLStatsDto(
        playerName: eplStats.name.getOrCrash(),
        stat: eplStats.stat.getOrCrash());
  }

  EPLStats toDomain() {
    return EPLStats(
        name: PlayerName(value: playerName), stat: StatCount(value: stat));
  }

  factory EPLStatsDto.fromJson(Map<String, dynamic> json) =>
      _$EPLStatsDtoFromJson(json);
}
