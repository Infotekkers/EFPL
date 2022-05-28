import 'package:efpl/domain/epl_stats/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'epl_stats.freezed.dart';

@freezed
abstract class EPLStats with _$EPLStats {
  const factory EPLStats({
    required TopScorers topScorers,
    required MostAssists mostAssists,
    required MostCleanSheets mostCleanSheets,
    required MostReds mostReds,
    required MostYellows mostYellows,
    required MostSaves mostSaves,
    required MostMinutesPlayed mostMinutesPlayed,
  }) = _EPLStat;

  factory EPLStats.initial() => EPLStats(
        topScorers: TopScorers(value: const []),
        mostAssists: MostAssists(value: const []),
        mostCleanSheets: MostCleanSheets(value: const []),
        mostReds: MostReds(value: const []),
        mostYellows: MostYellows(value: const []),
        mostSaves: MostSaves(value: const []),
        mostMinutesPlayed: MostMinutesPlayed(value: const []),
      );
}
