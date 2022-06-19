// ignore_for_file: empty_catches

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/fixture/fixture.dart';
import 'package:efpl/domain/fixture/fixture_failures.dart';
import 'package:efpl/domain/fixture/value_objects.dart';
import 'package:hive/hive.dart';

class FixtureLocalDataProvider {
  Box fixturesCache = Hive.box('fixtureCache');

  FixtureLocalDataProvider();

  void saveFixtureByGameWeekId(
      {required List gameWeekFixture, required int gameWeekId}) {
    try {
      fixturesCache.put("fixtures-$gameWeekId", gameWeekFixture);
    } catch (e) {}
  }

  Future<Either<dynamic, List<Fixture>>> getFixtureByGameWeekId(
      {required int gameWeekId}) async {
    try {
      List cachedFixtures = await fixturesCache.get("fixtures-$gameWeekId");

      List<Fixture> allFixtures = <Fixture>[];

      for (var cachedFixture in cachedFixtures) {
        Map<String, dynamic> parsedCachedFixture = <String, dynamic>{};
        cachedFixture.forEach(
          (key, value) => {
            parsedCachedFixture[key] = value,
          },
        );
        parsedCachedFixture['homeTeamLineUp'] = {};
        parsedCachedFixture['awayTeamLineUp'] = {};

        final Fixture fixture = Fixture(
          fdr: parsedCachedFixture['fdr'],
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
          homeTeamAmh: Team(
            value: parsedCachedFixture['homeTeamAmh']
                ? parsedCachedFixture['homeTeamAmh']
                : "",
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
          homeTeamStadium: Stadium(
            value: parsedCachedFixture['homeTeamStadium'],
          ),
          homeTeamCapacity: StadiumCapacity(
            value: parsedCachedFixture['homeTeamCapacity'],
          ),
          awayTeam: Team(
            value: parsedCachedFixture['awayTeam'],
          ),
          awayTeamAmh: Team(
            value: parsedCachedFixture['awayTeamAmh']
                ? parsedCachedFixture['awayTeamAmh']
                : "",
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
          awayTeamStadium: Stadium(
            value: parsedCachedFixture['awayTeamStadium'],
          ),
          awayTeamCapacity: StadiumCapacity(
            value: parsedCachedFixture['awayTeamCapacity'],
          ),
          score: Score(
            value: parsedCachedFixture['score'],
          ),
        );
        allFixtures.add(fixture);

        if (cachedFixtures.isEmpty) {
          return right([
            Fixture(
              fdr: 1,
              gameWeekId: GameWeekId(value: gameWeekId),
              matchId: MatchId(value: ""),
              schedule: Schedule(value: "2022-05-24T10:40:00.000+00:00"),
              status: Status(value: ""),
              homeTeam: Team(value: ""),
              homeTeamAmh: Team(value: ""),
              homeTeamLineUp: TeamLineUp(value: const {}),
              homeTeamCity: TeamCity(value: ""),
              homeTeamCoach: TeamCoach(value: ""),
              homeTeamLogo: TeamLogo(value: ""),
              homeTeamStadium: Stadium(value: ""),
              homeTeamCapacity: StadiumCapacity(value: 0),

              //
              awayTeam: Team(value: ""),
              awayTeamAmh: Team(value: ""),
              awayTeamLineUp: TeamLineUp(value: const {}),
              awayTeamCity: TeamCity(value: ""),
              awayTeamCoach: TeamCoach(value: ""),
              awayTeamLogo: TeamLogo(value: ""),
              awayTeamStadium: Stadium(value: ""),
              awayTeamCapacity: StadiumCapacity(value: 0),
              score: Score(value: ''),
            ),
          ]);
        }
      }
      return right(allFixtures);
    } catch (e) {
      return left(
        [
          [
            Fixture(
              gameWeekId: GameWeekId(value: 0),
              matchId: MatchId(value: ""),
              schedule: Schedule(value: "2022-05-24T10:40:00.000+00:00"),
              status: Status(value: ""),
              homeTeam: Team(value: ""),
              homeTeamAmh: Team(value: ""),
              homeTeamLineUp: TeamLineUp(value: const {}),
              homeTeamCity: TeamCity(value: ""),
              homeTeamCoach: TeamCoach(value: ""),
              homeTeamLogo: TeamLogo(value: ""),
              homeTeamStadium: Stadium(value: ""),
              homeTeamCapacity: StadiumCapacity(value: 0),

              //
              awayTeam: Team(value: ""),
              awayTeamAmh: Team(value: ""),
              awayTeamLineUp: TeamLineUp(value: const {}),
              awayTeamCity: TeamCity(value: ""),
              awayTeamCoach: TeamCoach(value: ""),
              awayTeamLogo: TeamLogo(value: ""),
              awayTeamStadium: Stadium(value: ""),
              awayTeamCapacity: StadiumCapacity(value: 0),
              score: Score(value: ''),
              fdr: 1,
            ),
          ],
          const FixtureFailures.hiveError(failedValue: "Hive Error")
        ],
      );
    }
  }
}
