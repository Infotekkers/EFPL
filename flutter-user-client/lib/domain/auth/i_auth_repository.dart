import 'package:dartz/dartz.dart';
import 'package:efpl/domain/auth/auth_failure.dart';
import 'package:efpl/domain/auth/user.dart';

import 'auth_value_objects.dart';

abstract class IAuthRepository {
  // get currently signed in user
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> setSignedInUser({required User user});
  // register user
  Future<Either<AuthFailure, User>> registerUser({
    required User user,
    required Password password,
  });

  // sign in user
  Future<Either<AuthFailure, User>> signInUser({
    required User user,
    required Password password,
  });

  // sign out user
  Future<void> signOut();

  // request password reset
  Future<Either<AuthFailure, User>> requestReset({
    required User user,
  });
}
