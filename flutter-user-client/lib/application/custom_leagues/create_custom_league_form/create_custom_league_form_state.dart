part of 'create_custom_league_form_bloc.dart';

@freezed
abstract class CreateCustomLeagueFormState with _$CreateCustomLeagueFormState {
  const factory CreateCustomLeagueFormState({
    required LeagueName leagueName,
    required AdminId userId,
    required LeagueStartGameWeek leagueStartGameWeek,
    required CustomLeaguesInfo customLeaguesInfo,
    required bool isLoading,
  }) = _CreateCustomLeagueFormState;

  factory CreateCustomLeagueFormState.initial() => CreateCustomLeagueFormState(
        leagueName: LeagueName(value: ""),
        userId: AdminId(value: ""),
        leagueStartGameWeek: LeagueStartGameWeek(value: 1),
        customLeaguesInfo: CustomLeaguesInfo(
          leagueId: LeagueId(value: 0),
          leagueName: LeagueName(value: ''),
          leagueCode: LeagueCode(value: ''),
          leagueType: LeagueType(value: ''),
          adminId: AdminId(value: ''),
          customLeagueMembers: CustomLeagueMembers(value: const []),
          leagueStartGameWeek: LeagueStartGameWeek(value: 1),
        ),
        isLoading: false,
      );
}
