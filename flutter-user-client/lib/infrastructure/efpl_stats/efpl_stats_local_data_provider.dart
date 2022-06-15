// ignore_for_file: empty_catches

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/efpl_stats/efpl_stats.dart';
import 'package:efpl/infrastructure/efpl_stats/efpl_stats_dto.dart';
import 'package:hive/hive.dart';

class EFPLStatsLocalDataProvider {
  Box efplCache = Hive.box('efplStats');

  EFPLStatsLocalDataProvider();

  void saveEfplStatByGameWeekId(
      {required Map efplStat, required int gameWeekId}) {
    try {
      efplCache.put("efplStats-$gameWeekId", efplStat);
    } catch (e) {}
  }

  Future<Either<dynamic, EFPLStats>> getEFPLStats(
      {required int gameWeekId}) async {
    try {
      final allStatsParsed = await efplCache.get("efplStats-$gameWeekId");

      Map<String, dynamic> statsInfo = {
        "highestPoint": allStatsParsed["highestPoint"],
        "averagePoint": allStatsParsed["averagePoint"],
        "mostSelectedPlayer": allStatsParsed["mostSelectedPlayer"],
        "mostTransferredOutPlayer": allStatsParsed["mostTransferredOutPlayer"],
        "transfersMadeCount": allStatsParsed["transfersMadeCount"],
        "mostCaptainedPlayer": allStatsParsed["mostCaptainedPlayer"],
        "mostViceCaptainedPlayer": allStatsParsed["mostViceCaptainedPlayer"],
        "benchBoostCount": allStatsParsed["benchBoostCount"],
        "freeHitCount": allStatsParsed["freeHitCount"],
        "wildCardCount": allStatsParsed["wildCardCount"],
        "tripleCaptainCount": allStatsParsed["tripleCaptainCount"],
        "dreamTeam": {
          "goalKeeper": allStatsParsed["dreamTeam"]['goalKeeper'],
          "defenders": allStatsParsed["dreamTeam"]['defenders'],
          "midfielders": allStatsParsed["dreamTeam"]['midfielders'],
          "attackers": allStatsParsed["dreamTeam"]['attackers'],
        },
        "maxActiveCount": int.parse(
          allStatsParsed["maxActiveCount"].toString(),
        ),
        "gameWeekId": allStatsParsed["gameWeekId"],
      };

      return right(
        EFPLStatsDto.fromJson(statsInfo).toDomain(),
      );
    } catch (e) {
      return left(
        const EFPLStats(
          highestPoint: 0,
          averagePoint: 0,
          mostSelectedPlayer: "",
          mostTransferredOutPlayer: "",
          transfersMadeCount: 0,
          mostCaptainedPlayer: "",
          mostViceCaptainedPlayer: "",
          benchBoostCount: 0,
          freeHitCount: 0,
          wildCardCount: 0,
          tripleCaptainCount: 0,
          dreamTeam: {},
          maxActiveCount: 0,
          gameWeekId: 0,
        ),
      );
    }
  }
}
