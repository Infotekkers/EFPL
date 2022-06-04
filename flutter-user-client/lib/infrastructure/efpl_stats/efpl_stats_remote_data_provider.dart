import 'package:dartz/dartz.dart';
import 'package:efpl/domain/efpl_stats/efpl_stats.dart';
import 'package:efpl/domain/epl_stats/epl_stats_failure.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/services/http_instance.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@injectable
class EFPLStatsRemoteDataProvider {
  HTTPInstance instance = getIt<HTTPInstance>();

  final String _baseUrl = "${dotenv.env["API"]}";

  EFPLStatsRemoteDataProvider();

  Future<Either<dynamic, EFPLStats>> getEFPLStats(
      {required int gameWeekId}) async {
    final Uri url =
        Uri.parse("$_baseUrl/gw/efplStats/${gameWeekId.toString()}");

    try {
      final response = await instance.client.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {}

      return left(const EPLStatsFailure.serverError());
    } catch (e) {
      print(e);
      return left(const EPLStatsFailure.networkError());
    }
  }
}
