import 'package:dartz/dartz.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/user_team.dart';

abstract class ITransferRepository {
  Future<Either<dynamic, UserTeam>> getUserPlayers({
    required int gameWeekId,
  });

  Future<Either<dynamic, List<UserPlayer>>> getAllPositionPlayers({
    required String playerPosition,
  });

  Future<Either<dynamic, bool>> saveUserPlayers({
    required int gameWeekId,
    required UserTeam userTeam,
  });
}
