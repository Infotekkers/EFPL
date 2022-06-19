// ignore_for_file: unused_field

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/transfer/i_user_players_facade.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/user_team.dart';
import 'package:efpl/infrastructure/transfer/transfer_local_data_provider.dart';
import 'package:efpl/infrastructure/transfer/transfer_remote_data_provider.dart';
import 'package:efpl/infrastructure/transfer/user_player_dto.dart';
import 'package:efpl/services/utility.dart';

class ApiTransferRepository implements ITransferRepository {
  Utility utility = Utility();

  final TransferRemoteDataProvider _transferRemoteDataProvider =
      TransferRemoteDataProvider();

  final TransferLocalDataProvider _transferLocalDataProvider =
      TransferLocalDataProvider();

  // handle all players in position
  @override
  Future<Either<dynamic, List<UserPlayer>>> getAllPositionPlayers(
      {required String playerPosition}) async {
    // if (await utility.hasInternetConnection()) {
    return _transferRemoteDataProvider.getAllPositionPlayers(
      playerPosition: playerPosition,
    );
    // } else {
    //   return _transferLocalDataProvider.getAllPlayersInPosition(
    //     playerPosition: playerPosition,
    //   );
    // }
  }

  // handle user team data
  @override
  Future<Either<dynamic, UserTeam>> getUserPlayers() async {
    // if (await utility.hasInternetConnection()) {
    return _transferRemoteDataProvider.getUserPlayers();
    // } else {
    //   return _transferLocalDataProvider.getUserTeam();
    // }
  }

  @override
  Future<Either<dynamic, bool>> saveUserPlayers({
    required UserTeam userTeam,
    required int gameWeekId,
    required bool isInitial,
  }) async {
    // convert user team to json
    final userTeamPlayers = {};
    for (var userPlayer in userTeam.allUserPlayers) {
      {
        final playerJson =
            UserPlayerDTO.fromDomain(userPlayer: userPlayer).toJson();

        final playerInfoJson = {
          "playerId": playerJson['playerId'],
          "eplTeamId": playerJson["eplTeamId"],
          "price": playerJson['currentPrice'],
          "multiplier": playerJson['multiplier'],
          "isCaptain": playerJson['isCaptain'],
          "isViceCaptain": playerJson['isViceCaptain'],
        };

        // add to main json
        userTeamPlayers[playerJson['playerId']] = playerInfoJson;
      }
    }

    final userTeamJson = {
      "isInitial": isInitial,
      "incomingTeam": {
        "activeChip": userTeam.activeChip,
        "gameweekId": gameWeekId,
        "players": userTeamPlayers,
      }
    };

    //
    // if (await utility.hasInternetConnection()) {
    await _transferRemoteDataProvider.saveUserPlayers(
      userTeam: userTeamJson,
    );
    return right(true);
    // } else {
    //   _transferLocalDataProvider.saveUserTeamChanges(
    //       changedUserTeam: userTeamJson);
    //   return right(true);
    // }
  }
}
