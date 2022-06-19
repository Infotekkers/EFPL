import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/watch_list/watch_list_failures.dart';
import 'package:efpl/infrastructure/watch_list/watch_list_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WatchListLocalDataProvider {
  Box watchListCache = Hive.box('watchListCache');

  WatchListLocalDataProvider();

  Future<Either<dynamic, List<List<dynamic>>>> getUserWatchList() async {
    try {
      List allUserWatchListPlayersJson =
          watchListCache.get('allUserWatchListPlayers');

      List<dynamic> allTeams = watchListCache.get("allTeams");

      List<dynamic> allUserWatchListPlayers = [];

      for (var watchListPlayer in allUserWatchListPlayersJson) {
        allUserWatchListPlayers
            .add(WatchPlayerListDTO.fromJson(watchListPlayer).toDomain());
      }

      return right([allUserWatchListPlayers, allTeams]);
    }

    // Unexpected Error
    catch (e) {
      return left(
        const WatchListFailure.hiveError(failedValue: "Hive Error"),
      );
    }
  }

  Future<Either<dynamic, List<List<dynamic>>>> saveUserWatchList(
      {required List userWatchList, required List allTeams}) async {
    try {
      await watchListCache.put('allUserWatchListPlayers', userWatchList);
      await watchListCache.put('allTeams', allTeams);

      return right([[], []]);
    }

    // Unexpected Error
    catch (e) {
      return left(
        const WatchListFailure.hiveError(failedValue: "Hive Error"),
      );
    }
  }
}
