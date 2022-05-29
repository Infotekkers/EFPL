import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:efpl/infrastructure/custom_leagues/custom_leagues_dto.dart';
import 'package:efpl/domain/custom_leagues/custom_leagues_failures.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/services/http_instance.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CustomLeaguesRemoteDataProvider {
  HTTPInstance instance = getIt<HTTPInstance>();

  final String _baseURL = dotenv.env["API"].toString();

  CustomLeaguesRemoteDataProvider();

  Future<Either<dynamic, List>> getUserCustomLeagues({
    required String userId,
  }) async {
    try {
      var apiResponse = await instance.client
          .get(Uri.parse('$_baseURL/customLeagues/user/$userId'));

      if (apiResponse.statusCode == 200) {
        final parsedReponseBody = jsonDecode(apiResponse.body);

        print(parsedReponseBody);

        final CustomLeaguesDTO customLeaguesDTO =
            CustomLeaguesDTO.fromJson(parsedReponseBody);

        print(customLeaguesDTO);

        return right([]);
      }

      return left(const CustomLeaguesFailures.serverError());
    } catch (e) {
      print(e);
      return left(const CustomLeaguesFailures.networkError());
    }
  }
}
