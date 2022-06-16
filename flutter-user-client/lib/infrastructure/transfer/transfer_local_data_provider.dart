// ignore_for_file: empty_catches

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/transfer/transfer_failures.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/user_team.dart';
import 'package:efpl/domain/transfer/value_objects.dart';
import 'package:efpl/infrastructure/transfer/user_player_dto.dart';
import 'package:hive/hive.dart';

class TransferLocalDataProvider {
  Box transfersCache = Hive.box('transferCache');

  TransferLocalDataProvider();

  Future<Either<dynamic, List<UserPlayer>>> getAllPlayersInPosition(
      {required String playerPosition}) async {
    try {
      List allPlayers =
          transfersCache.get('allPlayersInPosition-$playerPosition');

      List<UserPlayer> allUserPlayers = [];

      for (var player in allPlayers) {
        if (player['position'] == playerPosition) {
          final currentPlayerMap = {
            "playerId": (player['playerId']).toString(),
            "playerName": player['playerName'],
            "eplTeamId": player['eplTeamId'],
            "eplTeamLogo": player['eplTeamLogo'],
            "currentPrice": player['currentPrice'],
            "position": player['position'],
            "availability": {
              "injuryStatus":
                  (player['availability']['injuryStatus']).toString(),
              "injuryMessage":
                  (player['availability']['injuryMessage']).toString(),
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
      return right(allUserPlayers);
    } catch (e) {
      return left([
        <UserPlayer>[],
        const TransferFailure.hiveError(failedValue: "Hive Error")
      ]);
    }
  }

  Future<Either<dynamic, UserTeam>> getUserTeam() async {
    try {
      dynamic allUserPlayers = transfersCache.get("userTeam");

      // cache is not empty
      if (allUserPlayers != null) {
        List allUserPlayerJson = allUserPlayers['allUserPlayers'];
        List<UserPlayer> allUserPlayersDomain = [];

        for (var player in allUserPlayerJson) {
          final currentPlayerMap = {
            "playerId": player['playerId'],
            "multiplier": player['multiplier'],
            "isCaptain": player['isCaptain'],
            "isViceCaptain": player['isViceCaptain'],
            "playerName": player['playerName'],
            "eplTeamId": player['eplTeamId'],
            "eplTeamLogo": player['eplTeamLogo'],
            "currentPrice": player['currentPrice'],
            "position": player['position'],
            "availability": {
              "injuryStatus": player['availability']['injuryStatus'],
              "injuryMessage": player['availability']['injuryMessage'],
            },
            "score": player['score'],
            "upComingFixtures": player['upComingFixtures'] ?? [],
          };

          final UserPlayerDTO userPlayerDTO =
              UserPlayerDTO.fromJson(currentPlayerMap);

          allUserPlayersDomain.add(userPlayerDTO.toDomain());
        }

        UserTeam userTeam = UserTeam(
          gameWeekId: GameWeekId(value: allUserPlayers['gameWeekId']),
          gameWeekDeadline: allUserPlayers['gameWeekDeadline'].toString(),
          allUserPlayers: allUserPlayersDomain,
          freeTransfers: allUserPlayers['freeTransfers'],
          deduction: allUserPlayers['deduction'],
          activeChip: allUserPlayers['activeChip'],
          availableChips: allUserPlayers['availableChips'],
          maxBudget: double.parse(
            allUserPlayers['maxBudget'].toString(),
          ),
          teamName: allUserPlayers['teamName'],
        );

        return right(userTeam);
      } else {
        return right(
          UserTeam(
            gameWeekId: GameWeekId(value: 1),
            gameWeekDeadline: "",
            allUserPlayers: [],
            freeTransfers: 0,
            deduction: 0,
            activeChip: '',
            availableChips: [],
            maxBudget: 0,
            teamName: '',
          ),
        );
      }
    } catch (e) {
      return left([
        UserTeam(
          gameWeekId: GameWeekId(value: 1),
          gameWeekDeadline: "",
          allUserPlayers: [],
          freeTransfers: 0,
          deduction: 0,
          activeChip: '',
          availableChips: [],
          maxBudget: 0,
          teamName: '',
        ),
        const TransferFailure.hiveError(failedValue: "Give Failed")
      ]);
    }
  }

  Future<Either<dynamic, List>> getAllPlayers() async {
    try {
      List allPlayers = [];

      dynamic allGkCheck = await transfersCache.get("allPlayersInPosition-GK");
      List allPlayersGK = allGkCheck ?? [];

      dynamic allDefCheck =
          await transfersCache.get("allPlayersInPosition-DEF");
      List allPlayersDEF = allDefCheck ?? [];

      dynamic allMidCheck =
          await transfersCache.get("allPlayersInPosition-MID");
      List allPlayersMID = allMidCheck ?? [];

      dynamic allAttCheck =
          await transfersCache.get("allPlayersInPosition-ATT");
      List allPlayersATT = allAttCheck ?? [];

      for (var gk in allPlayersGK) {
        allPlayers.add(gk);
      }

      for (var def in allPlayersDEF) {
        allPlayers.add(def);
      }

      for (var mid in allPlayersMID) {
        allPlayers.add(mid);
      }

      for (var att in allPlayersATT) {
        allPlayers.add(att);
      }

      var newList = [allPlayersGK, allPlayersDEF, allPlayersMID, allPlayersATT]
          .expand((x) => x)
          .toList();

      return right(newList);
    } catch (e) {
      return left(
        [
          [],
          const TransferFailure.hiveError(failedValue: "Hive Error"),
        ],
      );
    }
  }

  Future<Either<dynamic, List>> getAllTeams() async {
    try {
      List allTeams = await transfersCache.get("allTeams");
      return right(allTeams);
    } catch (e) {
      return left([
        [],
        const TransferFailure.hiveError(failedValue: "Hive Error"),
      ]);
    }
  }

  Future<Either<dynamic, Map>> getChangedUserTeam() async {
    try {
      Map allTeams = await transfersCache.get("changedUserTeam");
      return right(allTeams);
    } catch (e) {
      return left([
        [],
        const TransferFailure.hiveError(failedValue: "Hive Error"),
      ]);
    }
  }

  void saveUserTeam({required Map userTeam}) async {
    try {
      await transfersCache.put("userTeam", userTeam);
    } catch (e) {}
  }

  void saveAllTeamsAndLogo({required List allTeams}) async {
    try {
      await transfersCache.put("allTeams", allTeams);
    } catch (e) {}
  }

  void saveAllPlayersInPosition(
      {required List allPlayersInPosition,
      required String playersPosition}) async {
    try {
      await transfersCache.put(
          'allPlayersInPosition-$playersPosition', allPlayersInPosition);
    } catch (e) {}
  }

  void saveUserTeamChanges({required Map changedUserTeam}) async {
    try {
      await transfersCache.put("changedUserTeam", changedUserTeam);
    } catch (e) {}
  }
}
