import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/points/point_user_player.dart';
import 'package:efpl/domain/points/points.dart';
import 'package:efpl/domain/points/points_failures.dart';
import 'package:efpl/infrastructure/points/points_player_dto.dart';
import 'package:efpl/infrastructure/points/points_local_data_provider.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/services/constants.dart';
import 'package:efpl/services/http_instance.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PointsInfoRemoteDataProvider {
  HTTPInstance instance = getIt<HTTPInstance>();

  final String _baseURL = dotenv.env["API"].toString();

  PointsInfoRemoteDataProvider();

  final PointsInfoLocalDataProvider _pointsInfoLocalDataProvider =
      PointsInfoLocalDataProvider();

  Future<Either<dynamic, PointsInfo>> getPointsInfoByGameWeekId(
      {required int gameWeekId}) async {
    try {
      // make api call
      var apiResponse = await instance.client
          .get(Uri.parse("$_baseURL/user/point/$gameWeekId"))
          .timeout(
            Duration(seconds: ConstantValues().httpTimeOutDuration),
          );

      // success
      if (apiResponse.statusCode == 200) {
        dynamic parsedBody = jsonDecode(apiResponse.body);
        List<dynamic> parsedResponseBody = parsedBody['allPlayers'];

        List<PointUserPlayer> allPlayersDomain = [];
        List<Map> allPlayersJson = [];

        for (var i = 0; i < parsedResponseBody.length; i++) {
          final currentPlayerMap = {
            "playerId": parsedResponseBody[i]['playerId'].toString(),
            "playerName": parsedResponseBody[i]['playerName'],
            "playerPosition": parsedResponseBody[i]['playerPosition'],
            "eplTeamId": parsedResponseBody[i]['eplTeamId'],
            "multiplier":
                int.parse(parsedResponseBody[i]['multiplier'].toString()),
            "isCaptain": parsedResponseBody[i]['isCaptain'],
            "isViceCaptain": parsedResponseBody[i]['isViceCaptain'],
            "score": parsedResponseBody[i]['score'],
            "fixtureStatus": parsedResponseBody[i]['fixtureStatus'],
            "fixtureScore": parsedResponseBody[i]['fixtureScore'],
            "fixtureTeams": parsedResponseBody[i]['fixtureTeams'],
          };

          PointUserPlayerDTO pointUserPlayerDTO =
              PointUserPlayerDTO.fromJson(currentPlayerMap);

          allPlayersJson.add(currentPlayerMap);
          allPlayersDomain.add(pointUserPlayerDTO.toDomain());
        }

        PointsInfo pointsInfo = PointsInfo(
          allPlayers: allPlayersDomain,
          gameWeekId: int.parse(parsedBody['gameWeekId'].toString()),
          activeChip: parsedBody['activeChip'],
          deduction: int.parse(parsedBody['deduction'].toString()),
          maxActiveCount: int.parse(parsedBody['maxActiveCount'].toString()),
          teamName: parsedBody['teamName'],
        );

        // cache
        final Map pointsInfoJson = {
          "allPlayers": allPlayersJson,
          "gameWeekId": parsedBody['gameWeekId'],
          "activeChip": parsedBody['activeChip'],
          "deduction": int.parse(parsedBody['deduction'].toString()),
          "maxActiveCount": int.parse(parsedBody['maxActiveCount'].toString()),
          "teamName": parsedBody['teamName'],
        };

        _pointsInfoLocalDataProvider.saveUserPointsInfo(
            gameWeekId: gameWeekId, userPointTeam: pointsInfoJson);

        return right(pointsInfo);
      }

      // no token
      else if (apiResponse.statusCode == 401) {
        return left([
          const PointsInfo(
            allPlayers: [],
            gameWeekId: 0,
            activeChip: '',
            deduction: 0,
            maxActiveCount: 1,
            teamName: '',
          ),
          const PointFailure.unauthenticated(failedValue: "")
        ]);
      }

      // no token
      else if (apiResponse.statusCode == 403) {
        return left([
          const PointsInfo(
            allPlayers: [],
            gameWeekId: 0,
            activeChip: '',
            deduction: 0,
            maxActiveCount: 1,
            teamName: '',
          ),
          const PointFailure.unauthorized(failedValue: "")
        ]);
      }

      // 404
      else if (apiResponse.statusCode == 404) {
        final parsedResponseBody = (jsonDecode(apiResponse.body));
        return left([
          PointsInfo(
            allPlayers: [],
            gameWeekId: 0,
            activeChip: '',
            deduction: 0,
            maxActiveCount: 1,
            teamName: parsedResponseBody['teamName'],
          ),
          const PointFailure.noTeamSelected(failedValue: "")
        ]);
      }

      // unexpected
      else {
        return left([
          const PointsInfo(
            allPlayers: [],
            gameWeekId: 0,
            activeChip: '',
            deduction: 0,
            maxActiveCount: 1,
            teamName: '',
          ),
          const PointFailure.unexpectedError(failedValue: "")
        ]);
      }
    }
    // Timeout Exception
    on TimeoutException catch (_) {
      Either<dynamic, PointsInfo> cacheCall = await _pointsInfoLocalDataProvider
          .getCachedPointInfo(gameWeekId: gameWeekId);

      PointsInfo pointsInfo = cacheCall.fold(
        (l) => const PointsInfo(
          allPlayers: [],
          gameWeekId: 1,
          teamName: '',
          activeChip: '',
          deduction: 0,
          maxActiveCount: 2,
        ),
        (r) => r,
      );
      return left([
        pointsInfo,
        const PointFailure.noConnection(
            failedValue: "Could not connect to server. Try refreshing.")
      ]);
    }

    // Socket Exception
    on SocketException catch (_) {
      Either<dynamic, PointsInfo> cacheCall = await _pointsInfoLocalDataProvider
          .getCachedPointInfo(gameWeekId: gameWeekId);

      PointsInfo pointsInfo = cacheCall.fold(
        (l) => const PointsInfo(
          allPlayers: [],
          gameWeekId: 1,
          teamName: '',
          activeChip: '',
          deduction: 0,
          maxActiveCount: 2,
        ),
        (r) => r,
      );
      return left(
        [
          pointsInfo,
          const PointFailure.socketError(
              failedValue: "Could not connect to server. Try refreshing."),
        ],
      );
    }

    // Handshake error
    on HandshakeException catch (_) {
      Either<dynamic, PointsInfo> cacheCall = await _pointsInfoLocalDataProvider
          .getCachedPointInfo(gameWeekId: gameWeekId);

      PointsInfo pointsInfo = cacheCall.fold(
        (l) => const PointsInfo(
          allPlayers: [],
          gameWeekId: 1,
          teamName: '',
          activeChip: '',
          deduction: 0,
          maxActiveCount: 2,
        ),
        (r) => r,
      );
      return left(
        [
          pointsInfo,
          const PointFailure.handShakeError(
              failedValue: "Could not connect to server. Try refreshing."),
        ],
      );
    }

    // unexpected error
    catch (e) {
      Either<dynamic, PointsInfo> cacheCall = await _pointsInfoLocalDataProvider
          .getCachedPointInfo(gameWeekId: gameWeekId);

      PointsInfo pointsInfo = cacheCall.fold(
        (l) => const PointsInfo(
          allPlayers: [],
          gameWeekId: 1,
          teamName: '',
          activeChip: '',
          deduction: 0,
          maxActiveCount: 2,
        ),
        (r) => r,
      );
      return left(
        [
          pointsInfo,
          const PointFailure.unexpectedError(
              failedValue: "Something went wrong. Try again!"),
        ],
      );
    }
  }
}
