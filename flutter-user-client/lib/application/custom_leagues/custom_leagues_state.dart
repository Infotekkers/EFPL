part of 'custom_leagues_bloc.dart';

@freezed
class CustomLeaguesState with _$CustomLeaguesState {
  const factory CustomLeaguesState({
    required List<CustomLeagues> userCustomLeagues,
    required CustomLeaguesInfo customLeaguesInfo,
    required bool isLoading,
    required Option<Either<dynamic, dynamic>> valueFailureOrSuccess,
  }) = _CustomLeaguesState;

  factory CustomLeaguesState.initial() => CustomLeaguesState(
        userCustomLeagues: [],
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
        valueFailureOrSuccess: none(),
      );
}
