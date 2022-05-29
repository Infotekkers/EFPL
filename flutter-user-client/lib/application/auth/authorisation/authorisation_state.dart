part of 'authorisation_bloc.dart';

@freezed
abstract class AuthorisationState with _$AuthorisationState {
  const factory AuthorisationState.initial() = Initial;
  const factory AuthorisationState.authorised() = Authorised;
  const factory AuthorisationState.unauthorised() = Unautorised;
}
