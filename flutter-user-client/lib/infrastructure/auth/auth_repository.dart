import 'dart:convert';

import 'package:efpl/domain/auth/auth_value_objects.dart';
import 'package:efpl/domain/auth/auth_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/auth/i_auth_repository.dart';
import 'package:efpl/domain/auth/user.dart';
import 'package:efpl/infrastructure/auth/auth_dtos.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  static final String _baseUrl = "${dotenv.env["API"]}/user";

  http.Client? client = http.Client();
  // signInUser
  @override
  Future<Either<AuthFailure, User>> signInUser(
      {required User user, required Password password}) async {
    final Uri url = Uri.parse("$_baseUrl/login");

    final UserDto userDtoOut = UserDto.fromDomain(user);

    final outGoingJson =
        userDtoOut.copyWith(password: password.getOrCrash()).toJson();
    try {
      final response = await client!.post(url, body: outGoingJson);
      if (response.statusCode == 201) {
        final UserDto userDtoIn =
            UserDto.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
        return right(userDtoIn.toDomain());
      } else if (response.statusCode == 400) {
        return left(const AuthFailure.invalidEmailPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    } catch (err) {
      return left(const AuthFailure.networkError());
    }
  }

  //  registerUser
  @override
  Future<Either<AuthFailure, Unit>> registerUser(
      {required User user, required Password password}) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }

  // getSignedInUser
  @override
  Future<Option<User>> getSignedInUser() {
    // TODO: implement getSignedInUser
    throw UnimplementedError();
  }

  //  requestReset
  @override
  Future<Either<AuthFailure, User>> requestReset({required User user}) async {
    final Uri url = Uri.parse("$_baseUrl/requestReset");

    final UserDto userDtoOut = UserDto.fromDomain(user);
    final outGoingJson = userDtoOut.toJson();
    try {
      final response = await client!.post(url, body: outGoingJson);
      if (response.statusCode == 200) {
        final UserDto userDtoIn =
            UserDto.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
        return right(userDtoIn.toDomain());
      } else if (response.statusCode == 400) {
        return left(const AuthFailure.emailNotFound());
      } else {
        return left(const AuthFailure.serverError());
      }
    } catch (err) {
      return left(const AuthFailure.networkError());
    }
  }

  // signOut
  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
