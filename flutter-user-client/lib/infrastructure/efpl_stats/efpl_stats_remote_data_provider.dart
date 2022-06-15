import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/efpl_stats/efpl_stats.dart';
import 'package:efpl/domain/efpl_stats/efpl_stats_failure.dart';
import 'package:efpl/infrastructure/efpl_stats/efpl_stats_dto.dart';
import 'package:efpl/infrastructure/efpl_stats/efpl_stats_local_data_provider.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/services/http_instance.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@injectable
class EFPLStatsRemoteDataProvider {
  HTTPInstance instance = getIt<HTTPInstance>();

  final String _baseUrl = "${dotenv.env["API"]}";
  final EFPLStatsLocalDataProvider _efplStatsLocalDataProvider =
      EFPLStatsLocalDataProvider();

  EFPLStatsRemoteDataProvider();

  Future<Either<dynamic, EFPLStats>> getEFPLStats(
      {required int gameWeekId}) async {
    final Uri url = Uri.parse("$_baseUrl/efpl/gw/${gameWeekId.toString()}");

    try {
      final response = await instance.client.get(url);
      if (response.statusCode == 200) {
        // has data
        if (jsonDecode(response.body).isNotEmpty) {
          final allStatsParsed = jsonDecode(response.body)[0]['allStats'];

          Map<String, dynamic> statsInfo = {
            "highestPoint": allStatsParsed["highestPoint"],
            "averagePoint": allStatsParsed["averagePoint"],
            "mostSelectedPlayer": allStatsParsed["mostSelectedPlayer"],
            "mostTransferredOutPlayer":
                allStatsParsed["mostTransferredOutPlayer"],
            "transfersMadeCount": allStatsParsed["transfersMadeCount"],
            "mostCaptainedPlayer": allStatsParsed["mostCaptainedPlayer"],
            "mostViceCaptainedPlayer":
                allStatsParsed["mostViceCaptainedPlayer"],
            "benchBoostCount": allStatsParsed["benchBoostCount"],
            "freeHitCount": allStatsParsed["freeHitCount"],
            "wildCardCount": allStatsParsed["wildCardCount"],
            "tripleCaptainCount": allStatsParsed["tripleCaptainCount"],
            "dreamTeam": allStatsParsed["dreamTeam"],
            "maxActiveCount": int.parse(
              allStatsParsed["maxActiveCount"].toString(),
            ),
            "gameWeekId": allStatsParsed["gameWeekId"],
          };

          _efplStatsLocalDataProvider.saveEfplStatByGameWeekId(
              efplStat: statsInfo, gameWeekId: gameWeekId);
          return right(
            EFPLStatsDto.fromJson(statsInfo).toDomain(),
          );
        }
        // no data
        else {
          return right(
            const EFPLStats(
              highestPoint: 0,
              averagePoint: 0,
              mostSelectedPlayer: "",
              mostTransferredOutPlayer: "",
              transfersMadeCount: 0,
              mostCaptainedPlayer: "",
              mostViceCaptainedPlayer: "",
              benchBoostCount: 0,
              freeHitCount: 0,
              wildCardCount: 0,
              tripleCaptainCount: 0,
              dreamTeam: {},
              gameWeekId: 0,
              maxActiveCount: 0,
            ),
          );
        }
      }
      // No Token
      else if (response.statusCode == 401) {
        return left(
          const EFPLStatsFailure.unauthorized(
            failedValue: "Please Login!",
          ),
        );
      }
      // No Token
      else if (response.statusCode == 403) {
        return left(
          const EFPLStatsFailure.unauthenticated(
            failedValue: "Please Login!",
          ),
        );
      }

      //
      else {
        return left(
          const EFPLStatsFailure.unexpectedError(
            failedValue: "Something went wrong",
          ),
        );
      }
    }

    // Timeout Exception
    on TimeoutException catch (_) {
      return left(const EFPLStatsFailure.noConnection(
          failedValue: "Could not connect to server. Try refreshing."));
    }

    // Socket Exception
    on SocketException catch (_) {
      return left(
        const EFPLStatsFailure.socketError(
            failedValue: "Could not connect to server. Try refreshing."),
      );
    }

    // Handshake error
    on HandshakeException catch (_) {
      return left(
        const EFPLStatsFailure.handShakeError(
            failedValue: "Could not connect to server. Try refreshing."),
      );
    }

    // unexpected error
    catch (e) {
      return left(
        const EFPLStatsFailure.unexpectedError(
            failedValue: "Something went wrong. Try again!"),
      );
    }
  }
}
