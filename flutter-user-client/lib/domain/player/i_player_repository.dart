import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/value_failures.dart';
import 'package:efpl/domain/player/player.dart';

abstract class IPlayerRepository {
  Future<Either<ValueFailure<Player>, Player>> getPlayer(String playerId);
}
