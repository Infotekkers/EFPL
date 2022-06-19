import 'package:dartz/dartz.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/user_team.dart';

abstract class ITransferRepository {
  Future<Either<dynamic, UserTeam>> getUserPlayers();

  Future<Either<dynamic, List<UserPlayer>>> getAllPositionPlayers({
    required String playerPosition,
  });

  Future<Either<dynamic, bool>> saveUserPlayers(
      {required UserTeam userTeam,
      required int gameWeekId,
      required bool isInitial});
}
