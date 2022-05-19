part of 'leaguetable_bloc.dart';

@freezed
abstract class LeagueTableEvent with _$LeagueTableEvent {
  const factory LeagueTableEvent.loadLeagueTable(String teamId) =
      _LoadLeagueTable;
}
