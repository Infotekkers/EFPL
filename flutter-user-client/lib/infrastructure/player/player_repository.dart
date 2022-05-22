import 'package:dartz/dartz.dart';
import 'package:efpl/domain/player/i_player_repository.dart';
import 'package:efpl/domain/player/player.dart';
import 'package:efpl/domain/player/player_failures.dart';
import 'package:efpl/infrastructure/player/player_remote_data_provider.dart';
import 'package:efpl/services/utility.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IPlayerRepository)
class PlayerRepository implements IPlayerRepository {
  final PlayerRemoteDataProvider _playerRemoteDataProvider;

  PlayerRepository(this._playerRemoteDataProvider);

  PlayerRemoteDataProvider get playerRemoteDataProvider =>
      _playerRemoteDataProvider;

  Utility utility = Utility();

  @override
  Future<Either<PlayerFailure, Player>> getPlayer(String playerId) async {
    // if (await utility.hasInternetConnection()) {
    return playerRemoteDataProvider.getPlayer(playerId);
    // } else {
    //   return left(const PlayerFailure.networkError());
    // }
  }
}
