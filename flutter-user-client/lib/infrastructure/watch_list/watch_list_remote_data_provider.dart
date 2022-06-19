import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/watch_list/watch_list_failures.dart';
import 'package:efpl/domain/watch_list/watch_list_player.dart';
import 'package:efpl/infrastructure/watch_list/watch_list_dto.dart';
import 'package:efpl/infrastructure/watch_list/watch_list_local_data_provider.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/services/constants.dart';
import 'package:efpl/services/http_instance.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WatchListRemoteDataProvider {
  HTTPInstance instance = getIt<HTTPInstance>();

  final String _baseURL = dotenv.env["API"].toString();

  WatchListRemoteDataProvider();

  final WatchListLocalDataProvider _watchListRemoteDataProvider =
      WatchListLocalDataProvider();

  Future<Either<dynamic, List<List<dynamic>>>> getUserWatchList() async {
    try {
      var apiResponse = await instance.client
          .get(
            Uri.parse('$_baseURL/user/watchList'),
          )
          .timeout(
            Duration(seconds: ConstantValues().httpTimeOutDuration),
          );

      // success
      if (apiResponse.statusCode == 200) {
        Map allWatchListPlayersJson = jsonDecode(apiResponse.body);
        List<WatchListPlayer> allWatchListPlayer = [];
        List allWatchPlayerJsonCache = [];

        List allWatchListPlayersList =
            (allWatchListPlayersJson['watchListInfo']);

        // if players exist

        for (var i = 0; i < allWatchListPlayersList.length; i++) {
          Map<String, dynamic> playerMap = {
            "playerId": allWatchListPlayersList[i]['playerId'].toString(),
            "playerName": allWatchListPlayersList[i]['playerName'].toString(),
            "currentPrice":
                allWatchListPlayersList[i]['currentPrice'].toDouble(),
            "position": allWatchListPlayersList[i]['playerPosition'].toString(),
            "eplTeamId": allWatchListPlayersList[i]['eplTeamId'].toString(),
            "eplTeamLogo": allWatchListPlayersList[i]['eplTeamLogo'].toString(),
            "availability": allWatchListPlayersList[i]['availability'],
            "score": int.parse(allWatchListPlayersList[i]['score'].toString()),
            "upComingFixtures": allWatchListPlayersList[i]['upComingFixtures'],
          };

          allWatchPlayerJsonCache.add(playerMap);

          allWatchListPlayer
              .add(WatchPlayerListDTO.fromJson(playerMap).toDomain());
        }

        await _watchListRemoteDataProvider.saveUserWatchList(
          userWatchList: allWatchPlayerJsonCache,
          allTeams: allWatchListPlayersJson['allTeams'],
        );

        return right([allWatchListPlayer, allWatchListPlayersJson['allTeams']]);
      }

      // 401
      else if (apiResponse.statusCode == 401) {
        return left(
          const WatchListFailure.unauthorized(failedValue: "Unauthorized"),
        );
      }

      // 403
      else if (apiResponse.statusCode == 403) {
        return left(
          const WatchListFailure.unauthenticated(
              failedValue: "Unauthenticated"),
        );
      }

      // 404
      else if (apiResponse.statusCode == 404) {
        return left(
          const WatchListFailure.unexpectedError(
              failedValue: "Unauthenticated"),
        );
      }

      // 422
      else if (apiResponse.statusCode == 422) {
        return left(
          const WatchListFailure.unexpectedError(
              failedValue: "Unauthenticated"),
        );
      }

      // else
      else {
        return right([]);
      }
    }

    // Timeout Exception
    on TimeoutException catch (_) {
      return left(
        const WatchListFailure.noConnection(failedValue: "No Connection"),
      );
    }

    // Socket Exception
    on SocketException catch (_) {
      return left(
        const WatchListFailure.noConnection(failedValue: "No Connection"),
      );
    }

    // Handshake error
    on HandshakeException catch (_) {
      return left(
        const WatchListFailure.noConnection(failedValue: "No Connection"),
      );
    }

    // Unexpected Error
    catch (e) {
      return left(
        const WatchListFailure.unexpectedError(failedValue: "Unexpected Error"),
      );
    }
  }

  Future<Either<dynamic, bool>> addPlayerToWatchList(
      {required String playerId}) async {
    try {
      var apiResponse = await instance.client
          .patch(Uri.parse('$_baseURL/user/watchList'), body: {
        "playerId": playerId,
      }).timeout(
        Duration(seconds: ConstantValues().httpTimeOutDuration),
      );

      if (apiResponse.statusCode == 201) {
        return right(true);
      } else {
        return left(false);
      }
    }
    // Timeout Exception
    on TimeoutException catch (_) {
      return left(
        const WatchListFailure.noConnection(failedValue: "No Connection"),
      );
    }

    // Socket Exception
    on SocketException catch (_) {
      return left(
        const WatchListFailure.noConnection(failedValue: "No Connection"),
      );
    }

    // Handshake error
    on HandshakeException catch (_) {
      return left(
        const WatchListFailure.noConnection(failedValue: "No Connection"),
      );
    }

    // Unexpected Error
    catch (e) {
      return left(
        const WatchListFailure.unexpectedError(failedValue: "No Connection"),
      );
    }
  }

  Future<Either<dynamic, bool>> removePlayerFromWatchList(
      {required String playerId}) async {
    try {
      var apiResponse = await instance.client
          .delete(Uri.parse('$_baseURL/user/watchList'), body: {
        "playerId": playerId,
      }).timeout(
        Duration(seconds: ConstantValues().httpTimeOutDuration),
      );

      if (apiResponse.statusCode == 201) {
        return right(true);
      } else {
        return left(false);
      }
    }
    // Timeout Exception
    on TimeoutException catch (_) {
      return left(
        const WatchListFailure.noConnection(failedValue: "No Connection"),
      );
    }

    // Socket Exception
    on SocketException catch (_) {
      return left(
        const WatchListFailure.noConnection(failedValue: "No Connection"),
      );
    }

    // Handshake error
    on HandshakeException catch (_) {
      return left(
        const WatchListFailure.noConnection(failedValue: "No Connection"),
      );
    }

    // Unexpected Error
    catch (e) {
      return left(false);
    }
  }

  Future<Either<dynamic, bool>> clearUserWatchList() async {
    try {
      var apiResponse = await instance.client
          .delete(Uri.parse('$_baseURL/user/watchList/all'), body: {}).timeout(
        Duration(seconds: ConstantValues().httpTimeOutDuration),
      );

      if (apiResponse.statusCode == 201) {
        return right(true);
      } else {
        return left(false);
      }
    }
    // Timeout Exception
    on TimeoutException catch (_) {
      return left(false);
    }

    // Socket Exception
    on SocketException catch (_) {
      return left(false);
    }

    // Handshake error
    on HandshakeException catch (_) {
      return left(false);
    }

    // Unexpected Error
    catch (e) {
      return left(false);
    }
  }
}
