import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/auth/auth_failure.dart';
import 'package:efpl/domain/auth/auth_value_objects.dart';
import 'package:efpl/domain/auth/i_auth_repository.dart';
import 'package:efpl/domain/auth/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

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

    // show password
    on<ShowPressed>(
      (event, emit) {
        emit(
          state.copyWith(
            showPass: !state.showPass,
          ),
        );
      },
    );

    // Sign In User
    on<SignInUserPressed>(
      (event, emit) async {
        Either<AuthFailure, User>? failureOrSuccess;
        final isEmailValid = state.email.isValid();
        final isPassValid = state.password.isValid();
        if (isEmailValid && isPassValid) {
          emit(
            state.copyWith(
              isSubmitting: true,
              authFailureOrSuccessOption: none(),
            ),
          );
          final User user = User.initial();
          failureOrSuccess = await _authRepository.signInUser(
            user: user.copyWith(
              email: state.email,
            ),
            password: state.password,
          );
        }
        emit(
          state.copyWith(
            isSubmitting: false,
            showErrorMessages: true,
            authFailureOrSuccessOption: optionOf(failureOrSuccess),
          ),
        );

        if (failureOrSuccess?.isRight() ?? false) {
          failureOrSuccess!.fold((l) => {}, (r) async {
            await _authRepository.setSignedInUser(user: r);
          });
        }
      },
    );
  }
}
