import 'package:dartz/dartz.dart';
import 'package:efpl/domain/player/i_player_repository.dart';
import 'package:efpl/domain/player/player.dart';
import 'package:efpl/domain/player/player_failures.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IPlayerRepository)
class PlayerRepository implements IPlayerRepository {
  @override
  Future<Either<PlayerFailure, Player>> getPlayer(String playerId) {
    // TODO: implement getPlayer
    throw UnimplementedError();
  }
}
