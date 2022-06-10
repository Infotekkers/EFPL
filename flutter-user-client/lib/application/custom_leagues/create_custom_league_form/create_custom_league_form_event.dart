part of 'create_custom_league_form_bloc.dart';

@freezed
abstract class CreateCustomLeagueFormEvent with _$CreateCustomLeagueFormEvent {
  const factory CreateCustomLeagueFormEvent.createLeaguePressed() =
      CreateLeaguePressed;
  const factory CreateCustomLeagueFormEvent.leagueNameChanged(
      String leagueNameStr) = LeagueNameChanged;
}
