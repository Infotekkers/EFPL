import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/fixture/value_objects.dart';
import 'package:efpl/domain/transfer/i_user_players_facade.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/user_team.dart';
import 'package:efpl/infrastructure/transfer/transfer_local_data_provider.dart';
import 'package:efpl/infrastructure/transfer/transfer_remote_data_provider.dart';
import 'package:efpl/infrastructure/transfer/user_player_dto.dart';
import 'package:efpl/services/utility.dart';
import 'package:hive/hive.dart';

class ApiTransferRepository implements ITransferRepository {
  Utility utility = Utility();

  final TransferRemoteDataProvider _transferRemoteDataProvider =
      TransferRemoteDataProvider();

  final TransferLocalDataProvider _transferLocalDataProvider =
      TransferLocalDataProvider();

  @override
  Future<Either<dynamic, List<UserPlayer>>> getAllPositionPlayers(
      {required String playerPosition}) async {
    if (await utility.hasInternetConnection()) {
      // return _transferRemoteDataProvider.getAllPositionPlayers(
      //   playerPosition: playerPosition,
      // );

      return right([]);
    } else {
      // return transferLocalDataProvider.getAllPositionPlayers(
      //     playerPosition: playerPosition);

      print("Get All Players");
      return right([]);
    }
  }

  @override
  Future<Either<dynamic, UserTeam>> getUserPlayers() async {
    if (await utility.hasInternetConnection()) {
      return _transferRemoteDataProvider.getUserPlayers();
    } else {
      print("Getting From Cache");
      return _transferLocalDataProvider.getUserTeam();
      // return transferLocalDataProvider.getUserPlayers();
    }
  }

  @override
  Future<Either<dynamic, bool>> saveUserPlayers(
      {required int gameWeekId, required UserTeam userTeam}) async {
    if (await utility.hasInternetConnection()) {
      return left([]);
    } else {
      return left([]);
    }
  }
}

Map userTeamToJson({required UserTeam userTeam}) {
  Map userTeamJson = {};
  Map incomingTeam = {};

  // userTeamJson['userId'] = userID;

  incomingTeam['activeChip'] = "";

  incomingTeam['gameweekId'] =
      userTeam.gameWeekId.value.fold((l) => 1, (r) => r);

  userTeamJson['incomingTeam'] = incomingTeam;

  // set gameweek id
  userTeamJson['gameWeekId'] = userTeam.gameWeekId.value.fold(
    (l) => '',
    (r) => r,
  );

  // set free transfers
  userTeamJson['freeTransfers'] = userTeam.freeTransfers;

  // set deduction
  userTeamJson['deduction'] = userTeam.deduction;

  // set active chip
  userTeamJson['activeChip'] = userTeam.activeChip;

  List allPlayerIds = [];

  for (var player in userTeam.allUserPlayers) {
    allPlayerIds.add(player.playerId);
  }

  userTeamJson['allPlayers'] = allPlayerIds;

  return userTeamJson;
}

Future<List<UserPlayer>> getUserPlayerFromCache(
    {required String playerPosition}) async {
  var efplCache = await Hive.openBox('efplCache');
  List? allPlayers = efplCache.get("allPlayers");

  List<UserPlayer> allUserPlayers = [];

  for (var player in allPlayers!) {
    if (player['position'] == playerPosition) {
      final currentPlayerMap = {
        "playerId": (player['playerId']).toString(),
        "playerName": player['playerName'],
        "eplTeamId": player['eplTeamId'],
        "eplTeamLogo": player['eplTeamLogo'],
        "currentPrice": player['currentPrice'],
        "position": player['position'],
        "availability": {
          "injuryStatus": (player['availability']['injuryStatus']).toString(),
          "injuryMessage": (player['availability']['injuryMessage']).toString(),
        },
        "score": player['score'] ?? 0,
        "multiplier": 0,
        "isCaptain": false,
        "isViceCaptain": false,
        "upComingFixtures": player['upComingFixtures'] ?? [],
      };

      final UserPlayerDTO userPlayerDTO =
          UserPlayerDTO.fromJson(currentPlayerMap);

      allUserPlayers.add(userPlayerDTO.toDomain());
    }
  }
  return allUserPlayers;
}
