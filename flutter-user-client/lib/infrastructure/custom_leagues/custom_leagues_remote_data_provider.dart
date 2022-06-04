import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/custom_leagues/custom_leagues.dart';
import 'package:efpl/infrastructure/custom_leagues/custom_leagues_dto.dart';
import 'package:efpl/domain/custom_leagues/custom_leagues_failures.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/services/http_instance.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CustomLeaguesRemoteDataProvider {
  HTTPInstance instance = getIt<HTTPInstance>();

  final String _baseURL = dotenv.env["API"].toString();

  CustomLeaguesRemoteDataProvider();

  Future<Either<dynamic, List<CustomLeagues>>> getUserCustomLeagues({
    required String userId,
  }) async {
    try {
      var apiResponse = await instance.client
          .get(Uri.parse('$_baseURL/customLeagues/user/$userId'));

      if (apiResponse.statusCode == 200) {
        final List<CustomLeagues> allUserCustomLeagues = <CustomLeagues>[];

        final parsedResponseBody =
            jsonDecode(apiResponse.body) as List<dynamic>;

        for (var customLeagueJson in parsedResponseBody) {
          Map<String, dynamic> finalParsedCustomLeague = <String, dynamic>{};

          customLeagueJson
              .forEach((key, value) => {finalParsedCustomLeague[key] = value});

          final CustomLeaguesDTO customLeaguesDTO =
              CustomLeaguesDTO.fromJson(finalParsedCustomLeague);

          allUserCustomLeagues.add(customLeaguesDTO.toDomain());
        }

        return right(allUserCustomLeagues);
      }

      return left(const CustomLeaguesFailures.serverError());
    } catch (e) {
      print(e);
      return left(const CustomLeaguesFailures.networkError());
    }
  }

  Future<Either<dynamic, CustomLeaguesInfo>> getCustomLeagueInfo(
      {required int leagueId}) async {
    try {
      var apiResponse = await instance.client
          .get(Uri.parse('$_baseURL/customLeagues/$leagueId'));

      if (apiResponse.statusCode == 200) {
        final parsedResponseBody = jsonDecode(apiResponse.body);

        final CustomLeagueInfoDTO customLeagueInfoDTO =
            CustomLeagueInfoDTO.fromJson(parsedResponseBody);

        return right(customLeagueInfoDTO.toDomain());
      }
    } catch (e) {
      return left(const CustomLeaguesFailures.serverError());
    }

    return left(const CustomLeaguesFailures.networkError());
  }
}
