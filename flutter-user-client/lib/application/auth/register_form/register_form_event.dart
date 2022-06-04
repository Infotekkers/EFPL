part of 'register_form_bloc.dart';

@freezed
abstract class RegisterFormEvent with _$RegisterFormEvent {
  const factory RegisterFormEvent.emailChanged(String emailStr) = EmailChanged;
  const factory RegisterFormEvent.passwordChanged(String passwordStr) =
      PasswordChanged;
  const factory RegisterFormEvent.confirmPasswordChanged(
      String confirmPasswordStr) = ConfirmPasswordChanged;
  const factory RegisterFormEvent.userNameChanged(String userNameStr) =
      UserNameChanged;
  const factory RegisterFormEvent.teamNameChanged(String teamNameStr) =
      TeamNameChanged;
  const factory RegisterFormEvent.countryChanged(String countryStr) =
      CountryChanged;
  const factory RegisterFormEvent.favoriteEplTeamChanged(
      String favoriteEplTeamStr) = FavoriteEplTeamChanged;
  const factory RegisterFormEvent.showPressed() = ShowPressed;
  const factory RegisterFormEvent.showConfirmPressed() = ShowConfirmPressed;

  const factory RegisterFormEvent.registerUserPressed() = RegisterUserPressed;
}
