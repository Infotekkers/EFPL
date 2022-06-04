import 'package:dartz/dartz.dart';
import 'package:efpl/domain/watch_list/watch_list_player.dart';

abstract class IWatchListRepository {
  Future<Either<dynamic, List<List<dynamic>>>> getUserWatchListPlayers();

  Future<Either<dynamic, bool>> addPlayerToWatchList(
      {required String playerId});

  Future<Either<dynamic, bool>> removePlayerFromWatchList(
      {required String playerId});

  Future<Either<dynamic, bool>> clearWatchList();
}
