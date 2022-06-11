part of 'create_custom_league_form_bloc.dart';

@freezed
abstract class CreateCustomLeagueFormState with _$CreateCustomLeagueFormState {
  const factory CreateCustomLeagueFormState({
    required LeagueName leagueName,
    required AdminId userId,
    required bool isLoading,
  }) = _CreateCustomLeagueFormState;

  factory CreateCustomLeagueFormState.initial() => CreateCustomLeagueFormState(
        leagueName: LeagueName(value: ""),
        userId: AdminId(value: ""),
        isLoading: false,
      );
}
