import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/auth/auth_failure.dart';
import 'package:efpl/domain/auth/auth_value_objects.dart';
import 'package:efpl/domain/auth/i_auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/auth/user.dart';

part 'register_form_event.dart';
part 'register_form_state.dart';

part 'register_form_bloc.freezed.dart';

@injectable
class RegisterFormBloc extends Bloc<RegisterFormEvent, RegisterFormState> {
  final IAuthRepository _authRepository;

  RegisterFormBloc(this._authRepository) : super(RegisterFormState.initial()) {
    on<RegisterFormEvent>((event, emit) {
      // Email change
      on<EmailChanged>(
        (event, emit) async {
          emit(
            state.copyWith(
              email: EmailAddress(event.emailStr),
              authFailureOrSuccessOption: none(),
            ),
          );
        },
      );
      // Password change
      on<PasswordChanged>(
        (event, emit) async {
          emit(
            state.copyWith(
              password: Password(event.passwordStr),
              authFailureOrSuccessOption: none(),
            ),
          );
        },
      );

      // confirm Password change
      on<ConfirmPasswordChanged>(
        (event, emit) async {
          emit(
            state.copyWith(
              confirmPassword: Password(event.confirmPasswordStr),
              authFailureOrSuccessOption: none(),
            ),
          );
        },
      );

      // user name
      on<UserNameChanged>(
        (event, emit) async {
          emit(
            state.copyWith(
              userName: UserName(event.userNameStr),
              authFailureOrSuccessOption: none(),
            ),
          );
        },
      );

      // team name
      on<TeamNameChanged>(
        (event, emit) async {
          emit(
            state.copyWith(
              teamName: TeamName(event.teamNameStr),
              authFailureOrSuccessOption: none(),
            ),
          );
        },
      );

      // country
      on<CountryChanged>(
        (event, emit) async {
          emit(
            state.copyWith(
              country: Country(event.countryStr),
              authFailureOrSuccessOption: none(),
            ),
          );
        },
      );

      // favorite team
      on<FavoriteEplTeamChanged>(
        (event, emit) async {
          emit(
            state.copyWith(
              favouriteEplTeam: FavoriteEplTeam(event.favoriteEplTeamStr),
              authFailureOrSuccessOption: none(),
            ),
          );
        },
      );

      // register pressed
      on<RegisterUserPressed>(
        (event, emit) async {
          Either<AuthFailure, User>? failureOrSuccess;
          final isEmailValid = state.email.isValid();
          final isPassValid = state.password.isValid();
          final isConfirmPassValid = state.confirmPassword.isValid();
          final isCountryValid = state.confirmPassword.isValid();
          final isUserName = state.userName.isValid();
          final isTeamNameValid = state.teamName.isValid();
          final isFavoriteEplTeamValid = state.favouriteEplTeam.isValid();

          if (isEmailValid &&
              isPassValid &&
              isConfirmPassValid &&
              isCountryValid &&
              isUserName &&
              isTeamNameValid &&
              isFavoriteEplTeamValid) {
            emit(
              state.copyWith(
                isSubmitting: true,
                authFailureOrSuccessOption: none(),
              ),
            );
            final User user = User.initial();
            failureOrSuccess = await _authRepository.registerUser(
              user: user.copyWith(
                email: state.email,
                userName: state.userName,
                teamName: state.teamName,
                country: state.country,
                favouriteEplTeam: state.favouriteEplTeam,
              ),
              password: state.password,
            );
          }
          emit(
            state.copyWith(
              isSubmitting: false,
              showErrorMessages: true,
              authFailureOrSuccessOption: some(failureOrSuccess!),
            ),
          );
        },
      );
    });
  }
}
