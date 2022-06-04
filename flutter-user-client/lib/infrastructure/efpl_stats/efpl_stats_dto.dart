import 'package:efpl/domain/efpl_stats/efpl_stats.dart';
import 'package:efpl/domain/epl_stats/epl_stats.dart';
import 'package:efpl/domain/epl_stats/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'efpl_stats_dto.freezed.dart';
part 'efpl_stats_dto.g.dart';

@freezed
abstract class EFPLStatsDto implements _$EFPLStatsDto {
  const EFPLStatsDto._();

  const factory EFPLStatsDto({
    required int highestPoint,
    required int averagePoint,
    required List mostSelectedPlayer,
    required List mostTransferredOutPlayer,
    required int transfersMadeCount,
    required List mostCaptainedPlayer,
    required List mostViceCaptainedPlayer,
    required int benchBoostCount,
    required int freeHitCount,
    required int wildCardCount,
    required int tripleCaptainCount,
    required Map dreamTeam,
  }) = _EFPLStatsDto;

  factory EFPLStatsDto.fromDomain(EFPLStats efplStats) {
    return EFPLStatsDto(
      highestPoint: efplStats.highestPoint,
      averagePoint: efplStats.averagePoint,
      mostSelectedPlayer: [efplStats.mostSelectedPlayer],
      mostTransferredOutPlayer: [efplStats.mostTransferredOutPlayer],
      transfersMadeCount: efplStats.transfersMadeCount,
      mostViceCaptainedPlayer: [efplStats.mostCaptainedPlayer],
      mostCaptainedPlayer: [efplStats.mostCaptainedPlayer],
      benchBoostCount: efplStats.benchBoostCount,
      wildCardCount: efplStats.wildCardCount,
      freeHitCount: efplStats.freeHitCount,
      tripleCaptainCount: efplStats.tripleCaptainCount,
      dreamTeam: efplStats.dreamTeam,
    );
  }

  EFPLStats toDomain() {
    return EFPLStats(
      highestPoint: highestPoint,
      averagePoint: averagePoint,
      mostSelectedPlayer: mostSelectedPlayer[0],
      mostTransferredOutPlayer: mostTransferredOutPlayer[0],
      transfersMadeCount: transfersMadeCount,
      mostViceCaptainedPlayer: mostCaptainedPlayer[0],
      mostCaptainedPlayer: mostCaptainedPlayer[0],
      benchBoostCount: benchBoostCount,
      wildCardCount: wildCardCount,
      freeHitCount: freeHitCount,
      tripleCaptainCount: tripleCaptainCount,
      dreamTeam: dreamTeam,
    );
  }

  factory EFPLStatsDto.fromJson(Map<String, dynamic> json) =>
      _$EFPLStatsDtoFromJson(json);
}
