// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/fixture/fixture.dart';
import 'package:efpl/domain/fixture/fixture_failures.dart';
import 'package:efpl/infrastructure/fixture/fixture_dto.dart';
import 'package:efpl/infrastructure/fixture/fixture_local_data_provider.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/services/constants.dart';
import 'package:efpl/services/http_instance.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FixtureRemoteDataProvider {
  HTTPInstance instance = getIt<HTTPInstance>();

  final String _baseURL = dotenv.env["API"].toString();

  FixtureRemoteDataProvider();

  final FixtureLocalDataProvider _fixtureLocalDataProvider =
      FixtureLocalDataProvider();

  Future<Either<dynamic, List<Fixture>>> getFixtureByGameWeekId(
      {required int gameWeekId}) async {
    HTTPInstance instance = getIt<HTTPInstance>();
    try {
      // make api call
      var apiResponse = await instance.client
          .get(
            Uri.parse('$_baseURL/fixtures/gw/$gameWeekId'),
          )
          .timeout(
            Duration(seconds: ConstantValues().httpTimeOutDuration),
          );

      // success
      if (apiResponse.statusCode == 200) {
        // to store all fixtures
        final List<Fixture> allFixtures = <Fixture>[];
        final allFixtureJson = [];

        // parsing body
        final parsedResponseBody =
            jsonDecode(apiResponse.body) as List<dynamic>;

        // iterate fixtures
        for (var fixtureJson in parsedResponseBody) {
          Map<String, dynamic> finalParsedFixture = <String, dynamic>{};
          fixtureJson.forEach(
            (key, value) => {
              if (key == "homeTeamInfo" || key == 'awayTeamInfo')
                {}
              else
                {
                  finalParsedFixture[key] = value,
                }
            },
          );

          if (finalParsedFixture['awayTeamLineUp'] == null) {
            finalParsedFixture['awayTeamLineUp'] = {};
          }

          if (finalParsedFixture['matchStat'] == null) {
            finalParsedFixture['matchStat'] = {};
          }

          // cache
          allFixtureJson.add(finalParsedFixture);

          // convert to domain
          final FixtureDTO fixtureDTO = FixtureDTO.fromJson(finalParsedFixture);
          allFixtures.add(fixtureDTO.toDomain());
        }

        // cache
        _fixtureLocalDataProvider.saveFixtureByGameWeekId(
            gameWeekFixture: allFixtureJson, gameWeekId: gameWeekId);

        return right(allFixtures);
      }

      // incorrect token
      else if (apiResponse.statusCode == 401) {
        return left(
          [
            [],
            const FixtureFailures.unauthorized(failedValue: "Please Login!"),
          ],
        );
      }

      // no token
      else if (apiResponse.statusCode == 403) {
        return left(
          [
            [],
            const FixtureFailures.unauthenticated(failedValue: "Please Login!"),
          ],
        );
      }

      // 404 error
      else if (apiResponse.statusCode == 404) {
        return left(
          [
            [],
            const FixtureFailures.unexpectedError(failedValue: "Please Login!"),
          ],
        );
      }

      // unexpected error
      else {
        return left(
          [
            [],
            const FixtureFailures.unexpectedError(
                failedValue: "Error Fetching Fixtures"),
          ],
        );
      }
    }
    // Timeout Exception
    on TimeoutException catch (_) {
      // print("TimeOut");
      // get cache
      Either<dynamic, List<Fixture>> allCachedFixtureCall =
          await _fixtureLocalDataProvider.getFixtureByGameWeekId(
              gameWeekId: gameWeekId);

      List<Fixture> allGWFixture = allCachedFixtureCall.fold(
        (l) => l[0],
        (r) => r,
      );

      return left(
        [
          allGWFixture,
          const FixtureFailures.noConnection(failedValue: "failedValue"),
        ],
      );
    }
    // Socket Exception
    on SocketException catch (_) {
      // get cache
      Either<dynamic, List<Fixture>> allCachedFixtureCall =
          await _fixtureLocalDataProvider.getFixtureByGameWeekId(
              gameWeekId: gameWeekId);

      List<Fixture> allGWFixture = allCachedFixtureCall.fold(
        (l) => [],
        (r) => r,
      );
      return left([
        const FixtureFailures.socketError(failedValue: "failedValue"),
      ]);
    }
    //
    on HandshakeException catch (_) {
      // get cache
      Either<dynamic, List<Fixture>> allCachedFixtureCall =
          await _fixtureLocalDataProvider.getFixtureByGameWeekId(
              gameWeekId: gameWeekId);

      List<Fixture> allGWFixture = allCachedFixtureCall.fold(
        (l) => [],
        (r) => r,
      );
      return left(
        [
          allGWFixture,
          const FixtureFailures.handShakeError(failedValue: "failedValue"),
        ],
      );
    }
    //
    catch (e) {
      // get cache
      Either<dynamic, List<Fixture>> allCachedFixtureCall =
          await _fixtureLocalDataProvider.getFixtureByGameWeekId(
              gameWeekId: gameWeekId);

      List<Fixture> allGWFixture = allCachedFixtureCall.fold(
        (l) => [],
        (r) => r,
      );
      return left(
        [
          allGWFixture,
          const FixtureFailures.unexpectedError(failedValue: "failedValue"),
        ],
      );
    }
  }
}
