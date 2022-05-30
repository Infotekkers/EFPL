part of 'custom_leagues_bloc.dart';

@freezed
class CustomLeaguesState with _$CustomLeaguesState {
  const factory CustomLeaguesState({
    required bool isLoading,
    required List userCustomLeagues,
  }) = _CustomLeaguesState;

  // ignore: prefer_const_constructors
  factory CustomLeaguesState.initial() => CustomLeaguesState(
        isLoading: false,
        userCustomLeagues: [],
      );
}
