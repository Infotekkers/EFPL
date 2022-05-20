part of 'points_bloc.dart';

@freezed
class PointsState with _$PointsState {
  const factory PointsState({
    required int gameWeekId,
    required int allPlayersPointSum,
    required PointsInfo pointsInfo,
    required bool isLoading,
    required Option<Either<dynamic, dynamic>> valueFailureOrSuccess,
  }) = _PointsState;

  factory PointsState.initial() => PointsState(
        gameWeekId: 0,
        allPlayersPointSum: 0,
        pointsInfo: const PointsInfo(
          allPlayers: [],
          activeChip: '',
          deduction: 0,
          maxActiveCount: 0,
          teamName: '',
          gameWeekId: 0,
        ),
        isLoading: false,
        valueFailureOrSuccess: none(),
      );
}
