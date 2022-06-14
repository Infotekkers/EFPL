import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/efpl_stats/efpl_stats.dart';
import 'package:efpl/domain/efpl_stats/i_efpl_stats_facade..dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'efpl_stats_event.dart';
part 'efpl_stats_state.dart';
part 'efpl_stats_bloc.freezed.dart';

@lazySingleton
class EfplStatsBloc extends Bloc<EfplStatsEvent, EfplStatsState> {
  final IEFPLStatsRepository _iefplStatsRepository;

  EfplStatsBloc(this._iefplStatsRepository) : super(EfplStatsState.initial()) {
    on<_GetEfplStats>(
      (event, emit) async {
        emit(state.copyWith(
          isLoading: true,
        ));

        // get team from api
        final Either<dynamic, dynamic> failureOrSuccess =
            await _iefplStatsRepository.getEFPLStats(
          gameWeekId: event.gameWeekId,
        );

        // get team from response
        final EFPLStats efplStats = failureOrSuccess.fold(
          (l) => const EFPLStats(
            highestPoint: 0,
            averagePoint: 0,
            mostSelectedPlayer: "LEFT",
            mostTransferredOutPlayer: "",
            transfersMadeCount: 0,
            mostCaptainedPlayer: "",
            mostViceCaptainedPlayer: "",
            benchBoostCount: 0,
            freeHitCount: 0,
            wildCardCount: 0,
            tripleCaptainCount: 0,
            dreamTeam: {},
            maxActiveCount: 0,
            gameWeekId: 0,
          ),
          (r) => r,
        );

        emit(state.copyWith(
          isLoading: false,
          valueFailureOrSuccess: some(failureOrSuccess),
          highestPoint: efplStats.highestPoint,
          averagePoint: efplStats.averagePoint,
          mostSelectedPlayer: efplStats.mostSelectedPlayer,
          mostTransferredOutPlayer: efplStats.mostTransferredOutPlayer,
          transfersMadeCount: efplStats.transfersMadeCount,
          mostCaptainedPlayer: efplStats.mostCaptainedPlayer,
          mostViceCaptainedPlayer: efplStats.mostViceCaptainedPlayer,
          benchBoostCount: efplStats.benchBoostCount,
          freeHitCount: efplStats.freeHitCount,
          wildCardCount: efplStats.wildCardCount,
          tripleCaptainCount: efplStats.tripleCaptainCount,
          dreamTeam: efplStats.dreamTeam,
          maxActiveCount: efplStats.maxActiveCount,
          gameWeekId: efplStats.gameWeekId,
        ));
      },
    );

    on<_IncreaseGameWeek>(
      (event, emit) async {
        // increase GWN
        int toSetGameWeek = state.gameWeekId + 1;
        if (state.gameWeekId > state.maxActiveCount - 1) {
          toSetGameWeek = 1;
        }

        emit(
          state.copyWith(
            gameWeekId: toSetGameWeek,
            isLoading: true,
          ),
        );

        // get team from api
        final Either<dynamic, dynamic> failureOrSuccess =
            await _iefplStatsRepository.getEFPLStats(
          gameWeekId: toSetGameWeek,
        );

        // get team from response
        final EFPLStats efplStats = failureOrSuccess.fold(
          (l) => const EFPLStats(
            highestPoint: 0,
            averagePoint: 0,
            mostSelectedPlayer: "LEFT INC",
            mostTransferredOutPlayer: "",
            transfersMadeCount: 0,
            mostCaptainedPlayer: "",
            mostViceCaptainedPlayer: "",
            benchBoostCount: 0,
            freeHitCount: 0,
            wildCardCount: 0,
            tripleCaptainCount: 0,
            dreamTeam: {},
            maxActiveCount: 0,
            gameWeekId: 0,
          ),
          (r) => r,
        );

        emit(
          state.copyWith(
            isLoading: false,
            valueFailureOrSuccess: some(failureOrSuccess),
            highestPoint: efplStats.highestPoint,
            averagePoint: efplStats.averagePoint,
            mostSelectedPlayer: efplStats.mostSelectedPlayer,
            mostTransferredOutPlayer: efplStats.mostTransferredOutPlayer,
            transfersMadeCount: efplStats.transfersMadeCount,
            mostCaptainedPlayer: efplStats.mostCaptainedPlayer,
            mostViceCaptainedPlayer: efplStats.mostViceCaptainedPlayer,
            benchBoostCount: efplStats.benchBoostCount,
            freeHitCount: efplStats.freeHitCount,
            wildCardCount: efplStats.wildCardCount,
            tripleCaptainCount: efplStats.tripleCaptainCount,
            dreamTeam: efplStats.dreamTeam,
            gameWeekId: efplStats.gameWeekId,
          ),
        );
      },
    );

    on<_DecreaseGameWeek>(
      (event, emit) async {
        // increase GWN
        int toSetGameWeek = state.gameWeekId - 1;
        if (state.gameWeekId == 1) {
          toSetGameWeek = state.maxActiveCount;
        }

        emit(
          state.copyWith(
            gameWeekId: toSetGameWeek,
            isLoading: true,
          ),
        );

        // get team from api
        final Either<dynamic, dynamic> failureOrSuccess =
            await _iefplStatsRepository.getEFPLStats(
          gameWeekId: toSetGameWeek,
        );

        // get team from response
        final EFPLStats efplStats = failureOrSuccess.fold(
          (l) => const EFPLStats(
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
            gameWeekId: 0,
            maxActiveCount: 0,
          ),
          (r) => r,
        );

        emit(
          state.copyWith(
            isLoading: false,
            valueFailureOrSuccess: some(failureOrSuccess),
            highestPoint: efplStats.highestPoint,
            averagePoint: efplStats.averagePoint,
            mostSelectedPlayer: efplStats.mostSelectedPlayer,
            mostTransferredOutPlayer: efplStats.mostTransferredOutPlayer,
            transfersMadeCount: efplStats.transfersMadeCount,
            mostCaptainedPlayer: efplStats.mostCaptainedPlayer,
            mostViceCaptainedPlayer: efplStats.mostViceCaptainedPlayer,
            benchBoostCount: efplStats.benchBoostCount,
            freeHitCount: efplStats.freeHitCount,
            wildCardCount: efplStats.wildCardCount,
            tripleCaptainCount: efplStats.tripleCaptainCount,
            dreamTeam: efplStats.dreamTeam,
            gameWeekId: efplStats.gameWeekId,
          ),
        );
      },
    );
  }
}
