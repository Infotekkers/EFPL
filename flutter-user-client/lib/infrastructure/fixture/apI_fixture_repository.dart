import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/http_failures.dart';
import 'package:efpl/domain/fixture/fixture.dart';
import 'package:efpl/domain/fixture/i_fixture_facade.dart';
import 'package:efpl/domain/fixture/value_objects.dart';
import 'package:efpl/infrastructure/fixture/fixture_dto.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/services/http_instance.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';

class ApiFixtureRepository implements IFixtureRepository {
  @override
  Future<Either<dynamic, List<Fixture>>> getFixtureByGameWeekId(
      {required int gameWeekId}) async {
    String _baseURL = dotenv.env["BASE_URL"].toString();

    HTTPInstance instance = getIt<HTTPInstance>();

    try {
      var apiResponse = await instance.client
          .get(
            Uri.parse('$_baseURL/fixtures/gw/$gameWeekId'),
          )
          .timeout(
            const Duration(seconds: 120),
          );

      // success
      if (apiResponse.statusCode == 200) {
        // to store all fixtures
        final allFixtures = <Fixture>[];

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

          if (finalParsedFixture['homeTeamLineUp'] == null) {
            finalParsedFixture['homeTeamLineUp'] = {};
          }

          if (finalParsedFixture['awayTeamLineUp'] == null) {
            finalParsedFixture['awayTeamLineUp'] = {};
          }

          if (finalParsedFixture['matchStat'] == null) {
            finalParsedFixture['matchStat'] = {};
          }

          // add to cache
          try {
            var efplCache = await Hive.openBox('efplCache');
            List? cachedFixtures = efplCache.get("fixtures");

            if (cachedFixtures == null) {
              efplCache.put("fixtures", [finalParsedFixture]);
            }
            //
            else {
              List newCachedFixture = [];
              for (var element in cachedFixtures) {
                newCachedFixture.add(element);
              }

              newCachedFixture.add(finalParsedFixture);
              List fixtureCacheCheck = cachedFixtures
                  .where(
                    (fixture) =>
                        fixture['matchId'] ==
                        finalParsedFixture['matchId'].toString(),
                  )
                  .toList();

              if (fixtureCacheCheck.isEmpty) {
                efplCache.put("fixtures", newCachedFixture);
              }
            }
          }
          //
          catch (e) {
            print(e);
          }

          // convert to domain
          final FixtureDTO fixtureDTO = FixtureDTO.fromJson(finalParsedFixture);
          allFixtures.add(fixtureDTO.toDomain());
        }

        return right(allFixtures);
      }

      // no token
      else if (apiResponse.statusCode == 403) {
        return left(
          const HTTPFailures.unauthenticated(failedValue: "Please Login!"),
        );
      }

      // incorrect token
      else if (apiResponse.statusCode == 401) {
        // get cached
        try {
          var efplCache = await Hive.openBox('efplCache');
          List? cachedFixtures = efplCache.get("fixtures");

          List<Fixture> allFixtures = [];

          if (cachedFixtures!.isNotEmpty) {
            for (var cachedFixture in cachedFixtures) {
              Map<String, dynamic> parsedCachedFixture = <String, dynamic>{};
              cachedFixture.forEach(
                (key, value) => {
                  parsedCachedFixture[key] = value,
                },
              );
              parsedCachedFixture['homeTeamLineUp'] = {};
              parsedCachedFixture['awayTeamLineUp'] = {};

              if (parsedCachedFixture['gameWeekId'] == gameWeekId) {
                final Fixture fixture = Fixture(
                  gameWeekId: GameWeekId(
                    value: parsedCachedFixture['gameWeekId'],
                  ),
                  matchId: MatchId(
                    value: parsedCachedFixture['matchId'],
                  ),
                  schedule: Schedule(
                    value: parsedCachedFixture['schedule'],
                  ),
                  status: Status(
                    value: parsedCachedFixture['status'],
                  ),
                  homeTeam: Team(
                    value: parsedCachedFixture['homeTeam'],
                  ),
                  homeTeamLineUp: TeamLineUp(
                    value: parsedCachedFixture['homeTeamLineUp'],
                  ),
                  homeTeamCity: TeamCity(
                    value: parsedCachedFixture['homeTeamCity'],
                  ),
                  homeTeamCoach: TeamCoach(
                    value: parsedCachedFixture['homeTeamCoach'],
                  ),
                  homeTeamLogo: TeamLogo(
                    value: parsedCachedFixture['homeTeamLogo'],
                  ),
                  homeTeamCapacity: StadiumCapacity(
                    value: parsedCachedFixture['homeTeamCapacity'],
                  ),
                  awayTeam: Team(
                    value: parsedCachedFixture['awayTeam'],
                  ),
                  awayTeamLineUp: TeamLineUp(
                    value: parsedCachedFixture['awayTeamLineUp'],
                  ),
                  awayTeamCity: TeamCity(
                    value: parsedCachedFixture['awayTeamCity'],
                  ),
                  awayTeamCoach: TeamCoach(
                    value: parsedCachedFixture['awayTeamCoach'],
                  ),
                  awayTeamLogo: TeamLogo(
                    value: parsedCachedFixture['awayTeamLogo'],
                  ),
                  awayTeamCapacity: StadiumCapacity(
                    value: parsedCachedFixture['awayTeamCapacity'],
                  ),
                  score: Score(
                    value: parsedCachedFixture['score'],
                  ),
                  matchStat: MatchStat(
                    value: parsedCachedFixture['matchStat'],
                  ),
                );
                allFixtures.add(fixture);
              }
            }
            return right(allFixtures);
          } else {
            return left(
              const HTTPFailures.unauthorized(
                  failedValue: "Please Login Again!"),
            );
          }
        }
        //
        catch (e) {
          print(e);
          return left(
            const HTTPFailures.unauthorized(failedValue: "Please Login Again!"),
          );
        }
      }

      // unexpected error
      else {
        return left(
          const HTTPFailures.unexpectedError(
              failedValue: "Error Fetching Fixtures"),
        );
      }
    }
    // Timeout Exception
    on TimeoutException catch (_) {
      return left(
        const HTTPFailures.noConnection(failedValue: "failedValue"),
      );
    }
    // Socket Exception
    on SocketException catch (e) {
      print("Socket Error");
      return left(
        const HTTPFailures.socketError(failedValue: "failedValue"),
      );
    }
    //
    on HandshakeException catch (e) {
      print("HandShake Error");
      return left(
        const HTTPFailures.handShakeError(failedValue: "failedValue"),
      );
    }
    //
    catch (e) {
      print(e);
      return left(
        const HTTPFailures.unexpectedError(failedValue: "failedValue"),
      );
    }
  }
}
