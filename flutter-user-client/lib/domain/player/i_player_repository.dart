import 'package:dartz/dartz.dart';
import 'package:efpl/domain/player/player.dart';
import 'package:efpl/domain/player/player_failures.dart';

abstract class IPlayerRepository {
  Future<Either<PlayerFailure, Player>> getPlayer(String playerId);
}
