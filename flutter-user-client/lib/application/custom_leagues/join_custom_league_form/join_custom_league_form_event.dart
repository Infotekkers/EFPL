part of 'join_custom_league_form_bloc.dart';

@freezed
abstract class JoinCustomLeagueFormEvent with _$JoinCustomLeagueFormEvent {
  const factory JoinCustomLeagueFormEvent.joinLeaguePressed() =
      _joinLeaguePressed;
  const factory JoinCustomLeagueFormEvent.leagueCodeChanged(
      String leagueCodeStr) = _leagueCodeChanged;
}
