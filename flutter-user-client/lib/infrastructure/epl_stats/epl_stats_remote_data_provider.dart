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

  Future<Either<EPLStatsFailure, List<EPLStats>>> getEPLStats(
      String _statType) async {
    final Uri url = Uri.parse("$_baseUrl/eplStats/$_statType");
    // final Uri url = Uri.parse("$_baseUrl/test");

    try {
      final response = await client!.get(url);

      if (response.statusCode == 200) {
        final allStats = <EPLStats>[];

        final parsedResponseBody = jsonDecode(response.body);

        for (var stat in parsedResponseBody) {
          final EPLStatsDto eplStatDto = EPLStatsDto.fromJson(stat);
          allStats.add(eplStatDto.toDomain());
        }

        print(allStats);

        return right(allStats);
      }

      return left(const EPLStatsFailure.serverError());
    } catch (e) {
      print(e);
      return left(const EPLStatsFailure.networkError());
    }
  }
}
