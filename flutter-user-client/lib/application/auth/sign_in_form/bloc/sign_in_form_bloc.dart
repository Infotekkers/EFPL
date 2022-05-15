import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/auth/auth_failure.dart';
import 'package:efpl/domain/auth/auth_value_objects.dart';
import 'package:efpl/domain/auth/i_auth_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;
  SignInFormBloc(this._authFacade)
      : super(
          SignInFormState.initial(),
        ) {
    // Email change
    on<EmailChanged>(
      (event, emit) async {
        emit(
          state.copyWith(
            emailAddress: EmailAddress(event.emailStr),
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

    // Sign In User
    on<SignInUserPressed>(
      (event, emit) async {
        final isEmailValid = state.emailAddress.isValid();
        final isPassValid = state.password.isValid();
        if (isEmailValid && isPassValid) {
          state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          );
          final failureOrSuccess = await _authFacade.signInUser(
            emailAddress: state.emailAddress,
            password: state.password,
          );
          state.copyWith(
            isSubmitting: false,
            authFailureOrSuccessOption: some(failureOrSuccess),
          );
        }
      },
    );
  }
}
