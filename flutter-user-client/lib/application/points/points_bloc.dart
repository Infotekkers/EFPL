import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/points/i_points_facade.dart';
import 'package:efpl/domain/points/points.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

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
    // get points
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

        // calculate score
        int pointSum = 0;
        for (var playerInfo in pointsInfo.allPlayers) {
          // if no fantasy score add 0
          if (playerInfo.score.isNotEmpty &&
              playerInfo.score[0]['fantasyScore'] == null) {
            playerInfo.score[0]['fantasyScore'] = 0;
          }
          // if score isn't empty sum
          else if (playerInfo.score.isNotEmpty) {
            pointSum = pointSum +
                (playerInfo.multiplier *
                    int.parse(playerInfo.score[0]['fantasyScore'].toString()));
          } else {
            pointSum = pointSum + 0;
          }
        }

        emit(
          state.copyWith(
            isLoading: false,
            allPlayersPointSum: pointSum,
            gameWeekId: pointsInfo.gameWeekId,
            pointsInfo: pointsInfo,
            valueFailureOrSuccess: some(eitherPointsInfo),
          ),
        );
      },
    );

    // Increase GameWeek
    on<_increaseGameWeek>((event, emit) async {
      // increase GWN
      int toSetGameWeek = state.gameWeekId + 1;
      if (state.gameWeekId > state.pointsInfo.maxActiveCount - 1) {
        toSetGameWeek = 1;
      }

      emit(
        state.copyWith(
          gameWeekId: toSetGameWeek,
          isLoading: true,
        ),
      );

      Either<dynamic, PointsInfo> eitherPointsInfo = await _iPointInfoRepository
          .getPointByGameWeekId(gameWeekId: state.gameWeekId);

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
      int toSetGameWeek = state.gameWeekId - 1;
      if (state.gameWeekId == 1) {
        toSetGameWeek = state.pointsInfo.maxActiveCount;
      }

      emit(
        state.copyWith(
          gameWeekId: toSetGameWeek,
          isLoading: true,
        ),
      );

      Either<dynamic, PointsInfo> eitherPointsInfo = await _iPointInfoRepository
          .getPointByGameWeekId(gameWeekId: state.gameWeekId);

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
