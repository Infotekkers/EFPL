import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/auth/auth_failure.dart';
import 'package:efpl/domain/auth/auth_value_objects.dart';
import 'package:efpl/domain/auth/i_auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthRepository _authRepository;
  SignInFormBloc(this._authRepository)
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
          emit(
            state.copyWith(
              isSubmitting: true,
              authFailureOrSuccessOption: none(),
            ),
          );
          final failureOrSuccess = await _authRepository.signInUser(
            emailAddress: state.emailAddress,
            password: state.password,
          );
          emit(
            state.copyWith(
              isSubmitting: false,
              authFailureOrSuccessOption: some(failureOrSuccess),
            ),
          );
        }
      },
    );
  }
}
