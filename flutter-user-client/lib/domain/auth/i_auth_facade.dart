import 'package:dartz/dartz.dart';
import 'package:efpl/domain/auth/auth_failure.dart';

import 'auth_value_objects.dart';

abstract class IAuthFacade {
  // register user
  Future<Either<AuthFailure, Unit>> registerUser({
    required EmailAddress emailAddress,
    required Password password,
  });
  // sign in user
  Future<Either<AuthFailure, Unit>> signInUser({
    required EmailAddress emailAddress,
    required Password password,
  });
}
