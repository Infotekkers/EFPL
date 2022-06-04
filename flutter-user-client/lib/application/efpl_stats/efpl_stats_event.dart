part of 'efpl_stats_bloc.dart';

@freezed
class EfplStatsEvent with _$EfplStatsEvent {
  const factory EfplStatsEvent.getEfplStats({required int gameWeekId}) =
      _GetEfplStats;
}
