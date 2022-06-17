import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/auth/auth_failure.dart';
import 'package:efpl/domain/auth/auth_value_objects.dart';
import 'package:efpl/domain/auth/i_auth_repository.dart';
import 'package:efpl/domain/auth/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'request_reset_form_event.dart';
part 'request_reset_form_state.dart';

part 'request_reset_form_bloc.freezed.dart';

@injectable
class RequestResetFormBloc
    extends Bloc<RequestResetFormEvent, RequestResetFormState> {
  final IAuthRepository _authRepository;
  RequestResetFormBloc(this._authRepository)
      : super(
          RequestResetFormState.initial(),
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

    // request clicked
    on<RequestPressed>((event, emit) async {
      Either<AuthFailure, User>? failureOrSuccess;
      final isEmailValid = state.email.isValid();
      if (isEmailValid) {
        emit(
          state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ),
        );
        final User user = User.initial();
        failureOrSuccess = await _authRepository.requestReset(
          user: user.copyWith(email: state.email),
        );
      }
      emit(
        state.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(failureOrSuccess),
        ),
      );
    });
  }
}
