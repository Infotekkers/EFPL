// ignore_for_file: camel_case_types

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:efpl/domain/auth/auth_value_objects.dart';
import 'package:efpl/domain/auth/auth_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/auth/i_auth_repository.dart';
import 'package:efpl/domain/auth/user.dart';
import 'package:efpl/domain/core/core_value_objects.dart';
import 'package:efpl/infrastructure/auth/auth_dtos.dart';
import 'package:efpl/services/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: IAuthRepository)
class authorize implements IAuthRepository {
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
      final response = await client!.post(url, body: outGoingJson).timeout(
            Duration(seconds: ConstantValues().httpTimeOutDuration),
          );

      if (response.statusCode == 201) {
        final UserDto userDtoIn =
            UserDto.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

        return right(userDtoIn.toDomain());
      } else if (response.statusCode == 400) {
        return left(const AuthFailure.invalidEmailPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
    // Timeout Exception
    on TimeoutException catch (_) {
      return left(const AuthFailure.networkError());
    }
    // Socket Exception
    on SocketException catch (_) {
      return left(const AuthFailure.networkError());
    }
    // Handshake Exception
    on HandshakeException catch (_) {
      return left(const AuthFailure.networkError());
    }

    // unexpected error
    catch (err) {
      return left(const AuthFailure.networkError());
    }
  }

  //  registerUser
  @override
  Future<Either<AuthFailure, User>> registerUser(
      {required User user, required Password password}) async {
    final Uri url = Uri.parse("$_baseUrl/register");
    final UserDto userDtoOut = UserDto.fromDomain(user);

    final outGoingJson =
        userDtoOut.copyWith(password: password.getOrCrash()).toJson();
    try {
      final response = await client!.post(url, body: outGoingJson).timeout(
            Duration(seconds: ConstantValues().httpTimeOutDuration),
          );

      // success
      if (response.statusCode == 201) {
        final UserDto userDtoIn =
            UserDto.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

        return right(userDtoIn.toDomain());
      }
      // email in use
      else if (response.statusCode == 400) {
        return left(const AuthFailure.emailAlreadyInUse());
      }
      // other error
      else {
        return left(const AuthFailure.serverError());
      }
    }

    // Timeout Exception
    on TimeoutException catch (_) {
      return left(const AuthFailure.networkError());
    }
    // Socket Exception
    on SocketException catch (_) {
      return left(const AuthFailure.networkError());
    }
    // Handshake Exception
    on HandshakeException catch (_) {
      return left(const AuthFailure.networkError());
    }

    // Unexpected Error
    catch (err) {
      // ignore: avoid_print
      print(err);
      return left(const AuthFailure.networkError());
    }
  }

  // getSignedInUser
  @override
  Future<Option<User>> getSignedInUser() async {
    const storage = FlutterSecureStorage();

    try {
      String? value = await storage.read(key: 'user');
      final UserDto userDtoIn =
          UserDto.fromJson(jsonDecode(value!) as Map<String, dynamic>);
      return optionOf(userDtoIn.toDomain());
    } catch (err) {
      return none();
    }
  }

// set user
  @override
  Future<Either<AuthFailure, Unit>> setSignedInUser(
      {required User user}) async {
    try {
      const storage = FlutterSecureStorage();

      final UserDto userDtoOut = UserDto.fromDomain(user);

      storage.write(key: 'user', value: jsonEncode(userDtoOut.toJson()));

      return right(unit);
    }

    // TODO:MAKE STORAGE ERROR NOT SEVER
    catch (err) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> removeUser() async {
    try {
      const storage = FlutterSecureStorage();
      await storage.delete(key: 'user');
      print(storage);
      return right(unit);
    }
    // TODO:MAKE STORAGE ERROR NOT SEVER
    catch (err) {
      return left(const AuthFailure.serverError());
    }
  }

  //  requestReset
  @override
  Future<Either<AuthFailure, User>> requestReset({required User user}) async {
    final Uri url = Uri.parse("$_baseUrl/requestReset");

    final UserDto userDtoOut = UserDto.fromDomain(user);
    final outGoingJson = userDtoOut.toJson();
    try {
      final response = await client!.post(url, body: outGoingJson).timeout(
            Duration(seconds: ConstantValues().httpTimeOutDuration),
          );

      // success
      if (response.statusCode == 200) {
        return right(user);
      }
      // email not found
      else if (response.statusCode == 404) {
        return left(const AuthFailure.emailNotFound());
      }
      // error
      else {
        return left(const AuthFailure.serverError());
      }
    }
    // Timeout Exception
    on TimeoutException catch (_) {
      return left(const AuthFailure.networkError());
    }
    // Socket Exception
    on SocketException catch (_) {
      return left(const AuthFailure.networkError());
    }
    // Handshake Exception
    on HandshakeException catch (_) {
      return left(const AuthFailure.networkError());
    } catch (e) {
      return left(const AuthFailure.serverError());
    }
  }

// authorise token
  @override
  Future<Either<AuthFailure, Unit>> checkToken({required Token token}) async {
    final Uri url = Uri.parse("$_baseUrl/validateUser");
    try {
      final response =
          await client!.post(url, body: {"token": token.getOrCrash()});

      if (response.statusCode == 200) {
        return right(unit);
      } else if (response.statusCode == 403) {
        return left(const AuthFailure.emailNotFound());
      } else if (response.statusCode == 404) {
        return left(const AuthFailure.emailNotFound());
      } else {
        return left(const AuthFailure.serverError());
      }
    } catch (err) {
      return left(const AuthFailure.networkError());
    }
  }
}
