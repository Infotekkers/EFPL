import 'package:dartz/dartz.dart';
import 'package:efpl/domain/auth/auth_failure.dart';
import 'package:efpl/domain/auth/user.dart';
import 'package:efpl/domain/core/core_value_objects.dart';

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
  Future<Either<AuthFailure, Unit>> removeUser();

  // request password reset
  Future<Either<AuthFailure, User>> requestReset({
    required User user,
  });

// authorise token
  Future<Either<AuthFailure, Unit>> checkToken({
    required Token token,
  });
}
