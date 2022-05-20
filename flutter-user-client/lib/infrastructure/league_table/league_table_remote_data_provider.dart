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
          Map<String, dynamic> FinalParsedLeagueTable = <String, dynamic>{};
          leagueTableDtoJson.add(FinalParsedLeagueTable);

          final LeagueTableDto leagueTableDto =
              LeagueTableDto.fromJson(FinalParsedLeagueTable);
          leagueTable.add(leagueTableDto.toDomain());
        }
        // LeagueTableDto leagueTableDto =
        //     LeagueTableDto.fromJson(jsonDecode(response.body));

        return right(leagueTable);
      }

      return left(const LeagueTableFailure.serverError());
    } catch (e) {
      return left(const LeagueTableFailure.networkError());
    }
  }
}
