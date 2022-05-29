part of 'custom_leagues_bloc.dart';

@freezed
class CustomLeaguesState with _$CustomLeaguesState {
  const factory CustomLeaguesState({
    required CustomLeagues userCustomLeagues,
  }) = _CustomLeaguesState;

  // ignore: prefer_const_constructors
  factory CustomLeaguesState.initial() => CustomLeaguesState(
        userCustomLeagues: const CustomLeagues(
          userCustomLeagues: [],
        ),
      );
}
