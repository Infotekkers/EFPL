import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/fixture/fixture.dart';
import 'package:efpl/domain/fixture/fixture_failures.dart';
import 'package:efpl/domain/fixture/i_fixture_facade.dart';
import 'package:efpl/infrastructure/fixture/fixture_dto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

class ApiFixtureRepository implements IFixtureRepository {
  @override
  Future<Either<FixtureFailures, List<Fixture>>> getFixtureByGameWeekId(
      {required int gameWeekId}) async {
    String _baseURL = dotenv.env["BASE_URL"].toString();

    try {
      var result = await http.get(
        Uri.parse('$_baseURL/fixtures/$gameWeekId'),
      );

      final allFixtures = <Fixture>[];

      final parsed = jsonDecode(result.body) as List<dynamic>;
      final parsedItem = Map.from(parsed[0]);

      for (var fixture in parsed) {
        var finalParsed = <String, dynamic>{};

        fixture.forEach((key, value) => {
              if (key == "matchStat")
                {
                  // print(value),
                  finalParsed['matchStat'] = [],
                }
              else
                {
                  finalParsed[key] = (value),
                }
            });

        finalParsed['homeTeamLineUp'] = <dynamic>[];
        finalParsed['awayTeamLineUp'] = <dynamic>[];

        final FixtureDTO fixtureDTO = FixtureDTO.fromJson(finalParsed);
        allFixtures.add(fixtureDTO.toDomain());
      }

      return right(allFixtures);
    } catch (e) {
      print(e);
      return left(
        FixtureFailures.noConnection(failedValue: "failedValue"),
      );
    }
  }
}
