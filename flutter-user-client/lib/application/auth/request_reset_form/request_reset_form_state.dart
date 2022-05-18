part of 'request_reset_form_bloc.dart';

@freezed
abstract class RequestResetFormState with _$RequestResetFormState {
  const factory RequestResetFormState({
    required EmailAddress email,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, User>> authFailureOrSuccessOption,
  }) = _RequestResetFormState;

  factory RequestResetFormState.initial() => RequestResetFormState(
        email: EmailAddress(""),
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
