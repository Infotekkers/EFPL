part of 'points_bloc.dart';

@freezed
class PointsState with _$PointsState {
  const factory PointsState({
    required PointsInfo pointsInfo,
    required bool isLoading,
    required Option<Either<dynamic, dynamic>> valueFailureOrSuccess,
  }) = _PointsState;

  factory PointsState.initial() => PointsState(
        pointsInfo: const PointsInfo(
          allPlayers: [],
          activeChip: '',
          deduction: 0,
          gameWeekId: 0,
          maxActiveCount: 0,
          teamName: '',
        ),
        isLoading: false,
        valueFailureOrSuccess: none(),
      );
}
