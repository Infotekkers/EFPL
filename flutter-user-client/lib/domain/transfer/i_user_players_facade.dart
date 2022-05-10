import 'package:dartz/dartz.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/user_team.dart';
import 'package:efpl/domain/transfer/value_objects.dart';

abstract class ITransferRepository {
  Future<Either<dynamic, UserTeam>> getUserPlayers({
    required int gameWeekId,
  });

  Future<Either<dynamic, List<UserPlayer>>> getAllPositionPlayers({
    required String playerPosition,
  });

  Future<Either<dynamic, List<UserPlayer>>> saveUserPlayers({
    required int gameWeekId,
  });
}
