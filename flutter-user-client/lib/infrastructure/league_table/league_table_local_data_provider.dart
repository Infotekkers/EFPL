import 'package:dartz/dartz.dart';
import 'package:efpl/domain/league_table/value_object.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:efpl/domain/league_table/league_table.dart';
import 'package:efpl/domain/league_table/league_table_failure.dart';

@injectable
class LeagueTableLocalDataProvider {
  Box leagueTableCache = Hive.box('leagueTableCache');

  Future<Either<LeagueTableFailure, List<LeagueTable>>> getTeams() async {
    try {
      var cachedLeagueTables = await leagueTableCache.get('leagueTable');

      List<LeagueTable> leagueTables = <LeagueTable>[];
      if (cachedLeagueTables != null) {
        for (var cachedLeagueTable in cachedLeagueTables) {
          Map<String, dynamic> parsedCachedleagueTable = <String, dynamic>{};
          cachedLeagueTable.forEach(
            (key, value) => {
              parsedCachedleagueTable[key] = value,
            },
          );
          final LeagueTable leagueTable = LeagueTable(
            teamPoint: TeamPoint(
              value: parsedCachedleagueTable['teamPoint'],
            ),
            teamName: TeamName(
              value: parsedCachedleagueTable['teamName'],
            ),
            teamNameAmh: TeamName(
              value: parsedCachedleagueTable['teamNameAmh'],
            ),
            teamLogo: TeamLogo(
              value: parsedCachedleagueTable['teamLogo'],
            ),
            won: TeamWon(
              value: parsedCachedleagueTable['won'],
            ),
            lost: TeamLost(
              value: parsedCachedleagueTable['lost'],
            ),
            Draw: TeamDraw(
              value: parsedCachedleagueTable['Draw'],
            ),
            goalsFor: TeamGoalFor(
              value: parsedCachedleagueTable['goalsFor'],
            ),
            goalsAgainst: TeamGoalAgainst(
              value: parsedCachedleagueTable['goalsAgainst'],
            ),
            goalDifferential: TeamGoalDifferntial(
              value: parsedCachedleagueTable['goalDifferential'],
            ),
          );
          leagueTables.add(leagueTable);
        }
      }

      return right(leagueTables);
    } catch (e) {
      return left(const LeagueTableFailure.localDBError());
    }
  }
}
// teamPoint: TeamPoint(
//   value: parsedCachedleagueTable['teamPoint'],
// ),
// won: TeamWon(
//   value: parsedCachedleagueTable['teamWon'],
// ),
// lost: TeamLost(
//   value: parsedCachedleagueTable['teamLost'],
// ),
// Draw: TeamDraw(
//   value: parsedCachedleagueTable['teamDraw'],
// ),
// goalDifferntial: TeamGoalDifferntial(
//   value: parsedCachedleagueTable['teamGoalDifferntial'],
// ),
// goalAgainst: TeamGoalAgainst(
//   value: parsedCachedleagueTable['teamGoalAgainst'],
// ),
// goalFor: TeamGoalFor(
//   value: parsedCachedleagueTable['teamGoalFor'],
// ),
