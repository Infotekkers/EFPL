part of 'create_custom_league_form_bloc.dart';

@freezed
abstract class CreateCustomLeagueFormEvent with _$CreateCustomLeagueFormEvent {
  const factory CreateCustomLeagueFormEvent.createLeaguePressed({
    required String userId,
    required String leagueName,
  }) = _createLeaguePressed;
  const factory CreateCustomLeagueFormEvent.leagueNameChanged(
      String leagueNameStr) = _leagueNameChanged;
}
