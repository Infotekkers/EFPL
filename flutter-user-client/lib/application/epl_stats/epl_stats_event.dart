part of 'epl_stats_bloc.dart';

@freezed
abstract class EPLStatsEvent with _$EPLStatsEvent {
  const factory EPLStatsEvent.getEPLStats({required String statType}) =
      _GetEPLStats;
}
