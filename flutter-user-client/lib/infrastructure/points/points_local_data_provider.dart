// ignore_for_file: empty_catches

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/points/point_user_player.dart';
import 'package:efpl/domain/points/points.dart';
import 'package:efpl/domain/points/points_failures.dart';
import 'package:efpl/infrastructure/points/points_player_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PointsInfoLocalDataProvider {
  Box pointsCache = Hive.box('pointsCache');

  PointsInfoLocalDataProvider();

  Future<Either<dynamic, PointsInfo>> getCachedPointInfo(
      {required int gameWeekId}) async {
    try {
      final userPointGw = pointsCache.get('userPoint-$gameWeekId');

      List<PointUserPlayer> allPointUserPlayers = [];

      int gameweekId = int.parse(userPointGw['gameWeekId'].toString());
      String activeChip = userPointGw['activeChip'];
      int deduction = int.parse(userPointGw['deduction'].toString());
      int maxActiveCount = int.parse(userPointGw['maxActiveCount'].toString());
      String teamName = userPointGw['teamName'];

      List allPlayers = userPointGw['allPlayers'];

      for (var i = 0; i < allPlayers.length; i++) {
        final currentPlayerMap = {
          "playerId": allPlayers[i]['playerId'].toString(),
          "playerName": allPlayers[i]['playerName'],
          "playerPosition": allPlayers[i]['playerPosition'],
          "eplTeamId": allPlayers[i]['eplTeamId'],
          "multiplier": int.parse(allPlayers[i]['multiplier'].toString()),
          "isCaptain": allPlayers[i]['isCaptain'],
          "isViceCaptain": allPlayers[i]['isViceCaptain'],
          "score": allPlayers[i]['score'],
          "fixtureStatus": allPlayers[i]['fixtureStatus'],
          "fixtureScore": allPlayers[i]['fixtureScore'],
          "fixtureTeams": allPlayers[i]['fixtureTeams'],
        };

        PointUserPlayerDTO pointUserPlayerDTO =
            PointUserPlayerDTO.fromJson(currentPlayerMap);

        allPointUserPlayers.add(pointUserPlayerDTO.toDomain());
      }

      // print(allPointUserPlayers);
      PointsInfo pointsInfoCache = PointsInfo(
        allPlayers: allPointUserPlayers,
        gameWeekId: gameweekId,
        teamName: teamName,
        activeChip: activeChip,
        deduction: deduction,
        maxActiveCount: maxActiveCount,
      );

      return right(pointsInfoCache);
    }
    //
    catch (e) {
      return left([
        const PointsInfo(
          allPlayers: [],
          gameWeekId: 0,
          teamName: '',
          activeChip: '',
          deduction: 0,
          maxActiveCount: 0,
        ),
        const PointFailure.hiveError(failedValue: "Hive Error")
      ]);
    }
  }

  void saveUserPointsInfo(
      {required int gameWeekId, required Map userPointTeam}) {
    try {
      pointsCache.put('userPoint-$gameWeekId', userPointTeam);
    } catch (e) {}
  }
}
