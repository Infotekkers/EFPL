part of 'custom_leagues_bloc.dart';

@freezed
class CustomLeaguesEvent with _$CustomLeaguesEvent {
  const factory CustomLeaguesEvent.getUserCustomLeagues(
      {required String userId}) = _GetUserCustomLeagues;
  const factory CustomLeaguesEvent.getCustomLeagueInfo(
      {required int leagueId}) = _GetCustomLeagueInfo;
}
