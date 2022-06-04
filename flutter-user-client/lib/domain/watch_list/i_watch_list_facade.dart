import 'package:dartz/dartz.dart';
import 'package:efpl/domain/watch_list/watch_list_player.dart';

abstract class ITransferRepository {
  Future<Either<dynamic, List<WatchListPlayer>>> getUserWatchListPlayers();

  Future<Either<dynamic, List<WatchListPlayer>>> addPlayerToWatchList(
      {required String playerId});

  Future<Either<dynamic, List<WatchListPlayer>>> removePlayerFromWatchList(
      {required String playerId});
}
