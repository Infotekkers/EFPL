import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/efpl_stats/efpl_stats.dart';
import 'package:efpl/domain/efpl_stats/efpl_stats_failure.dart';
import 'package:efpl/domain/epl_stats/epl_stats_failure.dart';
import 'package:efpl/infrastructure/efpl_stats/efpl_stats_dto.dart';
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
    final Uri url = Uri.parse("$_baseUrl/efpl/gw/${gameWeekId.toString()}");

    try {
      final response = await instance.client.get(url);
      if (response.statusCode == 200) {
        // has data
        if (jsonDecode(response.body).isNotEmpty) {
          final EFPLStats efplStats =
              EFPLStatsDto.fromJson(jsonDecode(response.body)[0]['allStats'])
                  .toDomain();

          return right(efplStats);
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
      print(e);

      return left(
        const EFPLStatsFailure.unexpectedError(
            failedValue: "Something went wrong. Try again!"),
      );
    }
  }
}
