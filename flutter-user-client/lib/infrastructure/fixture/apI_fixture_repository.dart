import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/fixture/fixture.dart';
import 'package:efpl/domain/fixture/fixture_failures.dart';
import 'package:efpl/domain/fixture/i_fixture_facade.dart';
import 'package:efpl/infrastructure/fixture/fixture_dto.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/services/http_instance.dart';
import 'package:efpl/services/http_interceptor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

class ApiFixtureRepository implements IFixtureRepository {
  @override
  Future<Either<FixtureFailures, List<Fixture>>> getFixtureByGameWeekId(
      {required int gameWeekId}) async {
    String _baseURL = dotenv.env["BASE_URL"].toString();

    HTTPInstance instance = getIt<HTTPInstance>();

    try {
      var apiResponse = await instance.client
          .get(
            Uri.parse('http://192.168.0.5'),
          )
          .timeout(
            const Duration(seconds: 5),
          );

      final allFixtures = <Fixture>[];

      // final parsed = jsonDecode(result.body) as List<dynamic>;
      // final parsedItem = Map.from(parsed[0]);

// success
      if (apiResponse.statusCode == 200) {
        print("Success");
      }
      // no token
      else if (apiResponse.statusCode == 403) {
        print("No Token");
      }

      // incorrect token
      else if (apiResponse.statusCode == 401) {
        print("Invalid Token");
      } else {
        print("Else");
      }

      // for (var fixture in parsed) {
      //   var finalParsed = <String, dynamic>{};

      //   fixture.forEach((key, value) => {
      //         if (key == "matchStat")
      //           {
      //             // print(value),
      //             finalParsed['matchStat'] = [],
      //           }
      //         else
      //           {
      //             finalParsed[key] = (value),
      //           }
      //       });

      // finalParsed['homeTeamLineUp'] = <dynamic>[];
      // finalParsed['awayTeamLineUp'] = <dynamic>[];

      // final FixtureDTO fixtureDTO = FixtureDTO.fromJson(finalParsed);
      // allFixtures.add(fixtureDTO.toDomain());
      // }

      return right(allFixtures);
    }
    // Timeout Exception
    on TimeoutException catch (_) {
      print("Time Out");
      return left(
        const FixtureFailures.noConnection(failedValue: "failedValue"),
      );
    }
    // Socket Exception
    on SocketException catch (e) {
      // print()
      return left(
        const FixtureFailures.noConnection(failedValue: "failedValue"),
      );
    } on HandshakeException catch (e) {}
  }
}
