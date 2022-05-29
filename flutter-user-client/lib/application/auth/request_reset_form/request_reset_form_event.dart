part of 'request_reset_form_bloc.dart';

@freezed
abstract class RequestResetFormEvent with _$RequestResetFormEvent {
  const factory RequestResetFormEvent.emailChanged(String emailStr) =
      EmailChanged;
  const factory RequestResetFormEvent.requestPressed() = RequestPressed;
}
