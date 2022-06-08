part of 'custom_leagues_bloc.dart';

@freezed
class CustomLeaguesState with _$CustomLeaguesState {
  const factory CustomLeaguesState.initial() = _Initial;
  const factory CustomLeaguesState.loadInProgress() = _LoadInProgress;
  const factory CustomLeaguesState.loadUserCustomLeaguesSuccess(
      List<CustomLeagues> userCustomLeagues) = _LoadUserCustomLeaguesSuccess;
  const factory CustomLeaguesState.loadCustomLeagueInfo(
      CustomLeaguesInfo customLeaguesInfo) = _LoadCustomLeagueInfoSuccess;
  const factory CustomLeaguesState.loadFailure(CustomLeaguesFailures failure) =
      _LoadFailure;
  const factory CustomLeaguesState.createLeagueSuccess(
      CustomLeaguesInfo customLeaguesInfo) = _CreateLeagueSuccess;
}
