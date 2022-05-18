part of 'register_form_bloc.dart';

@freezed
abstract class RegisterFormState with _$RegisterFormState {
  const factory RegisterFormState({
    required EmailAddress email,
    required Password password,
    required Password confirmPassword,
    required UserName userName,
    required TeamName teamName,
    required Country country,
    required FavoriteEplTeam favoriteEplTeamId,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, User>> authFailureOrSuccessOption,
  }) = _RegisterFormState;

  factory RegisterFormState.initial() => RegisterFormState(
        email: EmailAddress(""),
        password: Password(""),
        confirmPassword: Password(""),
        userName: UserName(""),
        teamName: TeamName(""),
        country: Country(""),
        favoriteEplTeamId: FavoriteEplTeam(""),
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
