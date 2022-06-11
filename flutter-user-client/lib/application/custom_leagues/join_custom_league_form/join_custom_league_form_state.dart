part of 'join_custom_league_form_bloc.dart';

@freezed
abstract class JoinCustomLeagueFormState with _$JoinCustomLeagueFormState {
  const factory JoinCustomLeagueFormState({
    required LeagueCode leagueCode,
    required bool isLoading,
  }) = _JoinCustomLeagueFormState;

  factory JoinCustomLeagueFormState.initial() => JoinCustomLeagueFormState(
        leagueCode: LeagueCode(value: ""),
        isLoading: false,
      );
}
