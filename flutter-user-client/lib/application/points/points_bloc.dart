import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/points/i_points_facade.dart';
import 'package:efpl/domain/points/points.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

part 'points_event.dart';
part 'points_state.dart';
part 'points_bloc.freezed.dart';

@lazySingleton
class PointsBloc extends Bloc<PointsEvent, PointsState> {
  final IPointInfoRepository _iPointInfoRepository;

  PointsBloc(this._iPointInfoRepository)
      : super(
          PointsState.initial(),
        ) {
    on<_getPointsInfo>(
      (event, emit) async {
        emit(
          state.copyWith(isLoading: true),
        );

        Either<dynamic, PointsInfo> eitherPointsInfo =
            await _iPointInfoRepository.getPointByGameWeekId(gameWeekId: 0);

        // get team from response
        final PointsInfo pointsInfo = eitherPointsInfo.fold(
          (l) => l[0],
          (r) => r,
        );

        emit(
          state.copyWith(
            isLoading: false,
            pointsInfo: pointsInfo,
            valueFailureOrSuccess: some(eitherPointsInfo),
          ),
        );
      },
    );

    // Increase GameWeek
    on<_increaseGameWeek>((event, emit) async {
      print(state.pointsInfo.maxActiveCount);
      // increase GWN
      int toSetGameWeek = state.pointsInfo.gameWeekId + 1;
      if (state.pointsInfo.gameWeekId > state.pointsInfo.maxActiveCount) {
        toSetGameWeek = 1;
      }

      PointsInfo pointsInfo = PointsInfo(
        allPlayers: state.pointsInfo.allPlayers,
        gameWeekId: toSetGameWeek,
        activeChip: state.pointsInfo.activeChip,
        deduction: state.pointsInfo.deduction,
        maxActiveCount: state.pointsInfo.maxActiveCount,
        teamName: state.pointsInfo.teamName,
      );

      emit(
        state.copyWith(
          pointsInfo: pointsInfo,
          isLoading: true,
        ),
      );

      Either<dynamic, PointsInfo> eitherPointsInfo =
          await _iPointInfoRepository.getPointByGameWeekId(gameWeekId: 0);

      final PointsInfo pointsInfoNew = eitherPointsInfo.fold(
        (l) => l[0],
        (r) => r,
      );

      emit(
        state.copyWith(
          isLoading: false,
          pointsInfo: pointsInfoNew,
          valueFailureOrSuccess: some(eitherPointsInfo),
        ),
      );
    });

    // Increase GameWeek
    on<_decreaseGameWeek>((event, emit) async {
      // increase GWN
      int toSetGameWeek = state.pointsInfo.gameWeekId + 1;
      if (state.pointsInfo.gameWeekId == 1) {
        toSetGameWeek = state.pointsInfo.maxActiveCount;
      }

      PointsInfo pointsInfo = PointsInfo(
        allPlayers: state.pointsInfo.allPlayers,
        gameWeekId: toSetGameWeek,
        activeChip: state.pointsInfo.activeChip,
        deduction: state.pointsInfo.deduction,
        maxActiveCount: state.pointsInfo.maxActiveCount,
        teamName: state.pointsInfo.teamName,
      );

      emit(
        state.copyWith(
          pointsInfo: pointsInfo,
          isLoading: true,
        ),
      );

      Either<dynamic, PointsInfo> eitherPointsInfo =
          await _iPointInfoRepository.getPointByGameWeekId(gameWeekId: 0);

      // get team from response
      final PointsInfo pointsInfoNew = eitherPointsInfo.fold(
        (l) => l[0],
        (r) => r,
      );

      emit(
        state.copyWith(
          isLoading: false,
          pointsInfo: pointsInfoNew,
          valueFailureOrSuccess: some(eitherPointsInfo),
        ),
      );
    });
  }
}
