part of 'authorisation_bloc.dart';

@freezed
abstract class AuthorisationEvent with _$AuthorisationEvent {
  const factory AuthorisationEvent.authorisationCheckRequested(
      {@Default("") String token}) = AuthorisationCheckRequested;
}
