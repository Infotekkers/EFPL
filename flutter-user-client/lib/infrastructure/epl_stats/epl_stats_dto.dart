import 'package:efpl/domain/epl_stats/epl_stats.dart';
import 'package:efpl/domain/epl_stats/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'epl_stats_dto.freezed.dart';
part 'epl_stats_dto.g.dart';

@freezed
abstract class EPLStatsDto implements _$EPLStatsDto {
  const EPLStatsDto._();

  const factory EPLStatsDto({required String name, required int amount}) =
      _EPLStatsDto;

  factory EPLStatsDto.fromDomain(EPLStats eplStats) {
    return EPLStatsDto(
      name: eplStats.name.getOrCrash(),
      amount: eplStats.amount.getOrCrash(),
    );
  }

  EPLStats toDomain() {
    return EPLStats(
        name: PlayerName(value: name), amount: StatCount(value: amount));
  }

  factory EPLStatsDto.fromJson(Map<String, dynamic> json) =>
      _$EPLStatsDtoFromJson(json);
}
