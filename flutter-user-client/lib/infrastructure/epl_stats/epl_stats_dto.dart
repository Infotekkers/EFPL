import 'package:efpl/domain/epl_stats/epl_stats.dart';
import 'package:efpl/domain/epl_stats/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'epl_stats_dto.freezed.dart';
part 'epl_stats_dto.g.dart';

@freezed
abstract class EPLStatsDto implements _$EPLStatsDto {
  const EPLStatsDto._();

  const factory EPLStatsDto({
    required List topScorers,
    required List mostAssists,
    required List mostCleanSheets,
    required List mostReds,
    required List mostYellows,
    required List mostSaves,
    required List mostMinutesPlayed,
  }) = _EPLStatsDto;

  factory EPLStatsDto.fromDomain(EPLStats eplStats) {
    return EPLStatsDto(
      topScorers: eplStats.topScorers.getOrCrash(),
      mostAssists: eplStats.mostAssists.getOrCrash(),
      mostCleanSheets: eplStats.mostCleanSheets.getOrCrash(),
      mostReds: eplStats.mostReds.getOrCrash(),
      mostYellows: eplStats.mostYellows.getOrCrash(),
      mostSaves: eplStats.mostSaves.getOrCrash(),
      mostMinutesPlayed: eplStats.mostMinutesPlayed.getOrCrash(),
    );
  }

  EPLStats toDomain() {
    return EPLStats(
      topScorers: TopScorers(value: topScorers),
      mostAssists: MostAssists(value: mostAssists),
      mostCleanSheets: MostCleanSheets(value: mostCleanSheets),
      mostReds: MostReds(value: mostReds),
      mostYellows: MostYellows(value: mostYellows),
      mostSaves: MostSaves(value: mostSaves),
      mostMinutesPlayed: MostMinutesPlayed(value: mostMinutesPlayed),
    );
  }

  factory EPLStatsDto.fromJson(Map<String, dynamic> json) =>
      _$EPLStatsDtoFromJson(json);
}
