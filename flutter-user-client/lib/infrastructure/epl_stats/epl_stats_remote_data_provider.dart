import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/epl_stats/epl_stats.dart';
import 'package:efpl/domain/epl_stats/epl_stats_failure.dart';
import 'package:efpl/infrastructure/epl_stats/epl_stats_dto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@injectable
class EPLStatsRemoteDataProvider {
  http.Client? client = http.Client();

  final String _baseUrl = "${dotenv.env["API"]}";

  EPLStatsRemoteDataProvider();

  Future<Either<EPLStatsFailure, EPLStats>> getEPLStats() async {
    final Uri url = Uri.parse("$_baseUrl/eplStats/topPlayers");
    // final Uri url = Uri.parse("$_baseUrl/test");

    try {
      final response = await client!.get(url);

      if (response.statusCode == 200) {
        final parsedResponseBody = jsonDecode(response.body);

        final EPLStatsDto eplStatDto = EPLStatsDto.fromJson(parsedResponseBody);

        return right(eplStatDto.toDomain());
      }

      return left(const EPLStatsFailure.serverError());
    } catch (e) {
      return left(const EPLStatsFailure.networkError());
    }
  }
}
