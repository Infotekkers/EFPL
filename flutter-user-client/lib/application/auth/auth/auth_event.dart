part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authCheckRequested() = AuthCheckRequested;
  const factory AuthEvent.tokenCheckRequested({@Default("") String token}) =
      TokenCheckRequested;
  const factory AuthEvent.signedOut() = SignedOut;
}
