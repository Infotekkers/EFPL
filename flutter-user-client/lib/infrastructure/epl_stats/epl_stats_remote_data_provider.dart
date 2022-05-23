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

  static final String _baseUrl = "${dotenv.env["API"]}";

  EPLStatsRemoteDataProvider();

  Future<Either<EPLStatsFailure, EPLStats>> getEPLStats() async {
    final Uri url = Uri.parse("$_baseUrl/eplStats/goals");

    try {
      final response = await client!.get(url);

      if (response.statusCode == 200) {
        EPLStatsDto eplStatsDto =
            EPLStatsDto.fromJson(jsonDecode(response.body));

        return right(eplStatsDto.toDomain());
      }

      return left(const EPLStatsFailure.serverError());
    } catch (e) {
      return left(const EPLStatsFailure.networkError());
    }
  }
}
