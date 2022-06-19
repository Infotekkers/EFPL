// ignore_for_file: unused_field

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/watch_list/i_watch_list_facade.dart';
import 'package:efpl/infrastructure/watch_list/watch_list_local_data_provider.dart';
import 'package:efpl/infrastructure/watch_list/watch_list_remote_data_provider.dart';
import 'package:efpl/services/utility.dart';

class ApiWatchListRepository implements IWatchListRepository {
  Utility utility = Utility();

  final WatchListRemoteDataProvider _watchListRemoteDataProvider =
      WatchListRemoteDataProvider();

  final WatchListLocalDataProvider _watchListLocalDataProvider =
      WatchListLocalDataProvider();

  @override
  Future<Either<dynamic, bool>> addPlayerToWatchList(
      {required String playerId}) {
    // if (await utility.hasInternetConnection()) {
    return _watchListRemoteDataProvider.addPlayerToWatchList(
        playerId: playerId);
    // } else {
    //   return _transferLocalDataProvider.getAllPlayersInPosition(
    //     playerPosition: playerPosition,
    //   );
    // }
  }

  @override
  Future<Either<dynamic, List<List<dynamic>>>> getUserWatchListPlayers() {
    // if (await utility.hasInternetConnection()) {
    return _watchListRemoteDataProvider.getUserWatchList();
    // } else {
    //   return _watchListLocalDataProvider.getUserWatchList();
    // }
  }

  @override
  Future<Either<dynamic, bool>> removePlayerFromWatchList(
      {required String playerId}) {
    // if (await utility.hasInternetConnection()) {
    return _watchListRemoteDataProvider.removePlayerFromWatchList(
        playerId: playerId);
    // } else {
    //   return _watchListLocalDataProvider.getUserWatchList();
    // }
  }

  @override
  Future<Either<dynamic, bool>> clearWatchList() {
    // if (await utility.hasInternetConnection()) {
    return _watchListRemoteDataProvider.clearUserWatchList();
    // } else {
    //   return _watchListLocalDataProvider.getUserWatchList();
    // }
  }
}
