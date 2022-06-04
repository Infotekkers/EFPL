import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/efpl_stats/efpl_stats.dart';
import 'package:efpl/domain/efpl_stats/i_efpl_stats_facade..dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
        ));
      },
    );
  }
}
