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
    required FavoriteEplTeam favouriteEplTeam,
    required bool showErrorMessages,
    required bool isSubmitting,
    required bool showPass,
    required bool showConfirmPass,
    required Option<Either<AuthFailure, User>> authFailureOrSuccessOption,
  }) = _RegisterFormState;

  factory RegisterFormState.initial() => RegisterFormState(
        email: EmailAddress(""),
        password: Password(""),
        confirmPassword: Password(""),
        userName: UserName(""),
        teamName: TeamName(""),
        country: Country("Ethiopia"),
        favouriteEplTeam: FavoriteEplTeam("Saint George S.C"),
        showErrorMessages: false,
        isSubmitting: false,
        showPass: false,
        showConfirmPass: false,
        authFailureOrSuccessOption: none(),
      );
}
