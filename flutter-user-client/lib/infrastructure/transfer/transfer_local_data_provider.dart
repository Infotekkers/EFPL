import 'package:dartz/dartz.dart';
import 'package:efpl/domain/fixture/value_objects.dart';
import 'package:efpl/domain/transfer/transfer_failures.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/user_team.dart';
import 'package:efpl/infrastructure/transfer/user_player_dto.dart';
import 'package:hive/hive.dart';

class TransferLocalDataProvider {
  Box transfersCache = Hive.box('transferCache');

  TransferLocalDataProvider();

  Future<Either<dynamic, List<UserPlayer>>> getAllPositionPlayers(
      {required String playerPosition}) async {
    await Hive.openBox("efplCache");
    return left([]);
  }

  Future<Either<dynamic, bool>> saveAllPositionPlayers(
      {required List<UserPlayer> allPositionalPlayers}) async {
    await Hive.openBox("efplCache");
    return left([]);
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
      print(e);
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

  void saveUserTeam({required Map userTeam}) async {
    try {
      await transfersCache.put("userTeam", userTeam);
    } catch (e) {
      print(e);
    }
  }

  void saveAllTeamsAndLogo({required List allTeams}) async {
    try {
      await transfersCache.put("allTeams", allTeams);
    } catch (e) {
      print(e);
    }
  }

  Future<Either<dynamic, bool>> saveUserPlayers(
      {required int gameWeekId, required UserTeam userTeam}) async {
    await Hive.openBox("efplCache");
    return left([]);
  }
}
