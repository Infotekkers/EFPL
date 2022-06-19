// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/league_table/league_table.dart';
import 'package:efpl/domain/league_table/league_table_failure.dart';
import 'package:efpl/infrastructure/league_table/league_table_dto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@injectable
class LeagueTableRemoteDataProvider {
  http.Client? client = http.Client();

  static final String _baseUrl = "${dotenv.env["API"]}";

  LeagueTableRemoteDataProvider();

  Future<Either<LeagueTableFailure, List<LeagueTable>>> getTeams() async {
    final Uri url = Uri.parse("$_baseUrl/teams/all");

    try {
      final response = await client!.get(url);
      if (response.statusCode == 200) {
        final leagueTable = <LeagueTable>[];
        final leagueTableDtoJson = [];
        final parsedResponseBody = jsonDecode(response.body) as List<dynamic>;
        for (var leagueTableJson in parsedResponseBody) {
          // print("leagueTableJson $leagueTableJson");
          var newJson = {
            "teamName": leagueTableJson['teamName'],
            "teamNameAmh": leagueTableJson['teamNameAmh'],
            "teamLogo": leagueTableJson['teamLogo'],
            "teamPoint": leagueTableJson['teamPosition']['teamPoint'] ?? 0,
            "won": leagueTableJson['teamPosition']['won'] ?? 0,
            "lost": leagueTableJson['teamPosition']['lost'] ?? 0,
            "Draw": leagueTableJson['teamPosition']['Draw'] ?? 0,
            "goalsFor": leagueTableJson['teamPosition']['goalsFor'] ?? 0,
            "goalsAgainst":
                leagueTableJson['teamPosition']['goalsAgainst'] ?? 0,
            "goalDifferential":
                leagueTableJson['teamPosition']['goalDifferential'] ?? 0,
          };
          final LeagueTableDto leagueTableDto =
              LeagueTableDto.fromJson(newJson);
          leagueTable.add(leagueTableDto.toDomain());
        }
        leagueTable.sort(
          (teamOne, teamTwo) =>
              teamTwo.teamPoint.getOrCrash() - teamOne.teamPoint.getOrCrash(),
        );
        return right(leagueTable);
      }

      return left(const LeagueTableFailure.serverError());
    } catch (e) {
      return left(const LeagueTableFailure.networkError());
    }
  }
}
