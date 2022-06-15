part of 'custom_leagues_bloc.dart';

@freezed
class CustomLeaguesEvent with _$CustomLeaguesEvent {
  const factory CustomLeaguesEvent.getUserCustomLeagues(
      {required String userId}) = _getUserCustomLeagues;
  const factory CustomLeaguesEvent.getCustomLeagueInfo(
      {required int leagueId}) = _getCustomLeagueInfo;

  const factory CustomLeaguesEvent.joinPublicLeague({required int leagueId}) =
      _joinPublicLeague;
  const factory CustomLeaguesEvent.joinPrivateLeague(
      {required String leagueCode}) = _joinPrivateLeague;

  const factory CustomLeaguesEvent.leavePublicLeague(
      {required String userId,
      required String leagueCode}) = _leaveCustomLeague;
}
