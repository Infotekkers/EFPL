import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/settings/settings.dart';
import 'package:efpl/domain/settings/settings_failures.dart';
import 'package:efpl/infrastructure/settings/settings_dto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@injectable
class UserDetailRemoteDataProvider {
  http.Client? client = http.Client();

  static final String _baseUrl = "${dotenv.env["API"]}";

  UserDetailRemoteDataProvider();

  Future<Either<SettingsFailure, Settings>> getUserDetail(String userId) async {
    final Uri url = Uri.parse("$_baseUrl/user/fetchOne/$userId");

    try {
      final response = await client!.get(url);

      if (response.statusCode == 200) {
        SettingsDto settingsDto =
            SettingsDto.fromJson(jsonDecode(response.body));

        return right(settingsDto.toDomain());
      }

      return left(const SettingsFailure.serverError());
    } catch (e) {
      return left(const SettingsFailure.networkError());
    }
  }

  Future<Either<SettingsFailure, Unit>> updateUserDetail(
      Settings settings, String userId) async {
    final Uri url = Uri.parse("$_baseUrl/updateUser/$userId");

    SettingsDto settingsDto = SettingsDto.fromDomain(settings);

    final outgoingJson = jsonEncode({
      "userId": userId,
      "data": {
        "IncomingUserDetail": settingsDto.toJson(),
      }
    });

    try {
      final response = await client!.put(url,
          body: outgoingJson, headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        return right(unit);
      }
      return left(const SettingsFailure.serverError());
    } catch (e) {
      return left(const SettingsFailure.networkError());
    }
  }
}
