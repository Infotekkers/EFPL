part of 'efpl_stats_bloc.dart';

@freezed
class EfplStatsState with _$EfplStatsState {
  const factory EfplStatsState({
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
    required bool isLoading,
    required int gameWeekId,
    required int maxActiveCount,
    required Option<Either<dynamic, dynamic>> valueFailureOrSuccess,
  }) = _EfplState;

  factory EfplStatsState.initial() => EfplStatsState(
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
        dreamTeam: {},
        isLoading: false,
        gameWeekId: 0,
        maxActiveCount: 0,
        valueFailureOrSuccess: none(),
      );
}
