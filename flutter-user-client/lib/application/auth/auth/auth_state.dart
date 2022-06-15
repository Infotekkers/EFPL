part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.intial() = Initial;
  const factory AuthState.authenticated(
    User user,
  ) = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
}
