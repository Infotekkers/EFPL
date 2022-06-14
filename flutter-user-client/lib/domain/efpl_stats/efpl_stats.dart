import 'package:freezed_annotation/freezed_annotation.dart';

part 'efpl_stats.freezed.dart';

@freezed
abstract class EFPLStats with _$EFPLStats {
  const factory EFPLStats({
    required int highestPoint,
    required int averagePoint,
    required String mostSelectedPlayer,
    required String mostTransferredOutPlayer,
    required int transfersMadeCount,
    required String mostCaptainedPlayer,
    required String mostViceCaptainedPlayer,
    required int benchBoostCount,
    required int freeHitCount,
    required int wildCardCount,
    required int tripleCaptainCount,
    required Map dreamTeam,
    required int maxActiveCount,
    required int gameWeekId,
  }) = _EFPLStat;

  factory EFPLStats.initial() => const EFPLStats(
        highestPoint: 0,
        averagePoint: 0,
        mostSelectedPlayer: "",
        mostTransferredOutPlayer: "",
        transfersMadeCount: 0,
        mostCaptainedPlayer: "",
        mostViceCaptainedPlayer: "",
        benchBoostCount: 0,
        freeHitCount: 0,
        wildCardCount: 0,
        tripleCaptainCount: 0,
        maxActiveCount: 0,
        gameWeekId: 0,
        dreamTeam: {},
      );
}
