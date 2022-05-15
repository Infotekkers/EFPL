import 'package:dartz/dartz.dart';
import 'package:efpl/domain/auth/auth_failure.dart';
import 'auth_value_objects.dart';

abstract class IAuthFacade {
  // register
  Future<Either<AuthFailure, Unit>> registerUser({
    required EmailAddress emailAddress,
    required Password password,
  });
  // login
  Future<Either<AuthFailure, Unit>> signInUser({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
