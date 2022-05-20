part of 'leaguetable_bloc.dart';

@freezed
abstract class LeagueTableState with _$LeagueTableState {
  const factory LeagueTableState.initial() = _Initial;
  const factory LeagueTableState.loadInProgress() = _Loading;
  const factory LeagueTableState.loadSuccess(List<LeagueTable> leagueTable) =
      _LoadSuccess;
  const factory LeagueTableState.loadFailure(
      LeagueTableFailure leagueTableFailure) = _LoadFailure;
}
