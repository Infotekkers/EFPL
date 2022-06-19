part of 'epl_stats_bloc.dart';

@freezed
abstract class EPLStatsState with _$EPLStatsState {
  const factory EPLStatsState.initial() = _Initial;
  const factory EPLStatsState.loadInProgress() = _LoadInProgress;
  const factory EPLStatsState.loadSuccess(EPLStats eplStats) = _LoadSuccess;
  const factory EPLStatsState.loadFailure(EPLStatsFailure eplStatsFailure) =
      _LoadFailure;
}
