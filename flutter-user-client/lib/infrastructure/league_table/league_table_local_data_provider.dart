import 'package:dartz/dartz.dart';
import 'package:efpl/domain/league_table/value_object.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:efpl/domain/league_table/league_table.dart';
import 'package:efpl/domain/league_table/league_table.dart';
import 'package:efpl/domain/league_table/league_table_failure.dart';
import 'package:efpl/infrastructure/league_table/league_table_dto.dart';

@injectable
class LeagueTableLocalDataProvider {
  Box leagueTableCache = Hive.box('leagueTableCache');

  Future<Either<LeagueTableFailure, List<LeagueTable>>> getTeams() async {
    try {
      // List<LeagueTable> leagueTables = [];
      // var leagueTable = await leagueTableCache.get('leagueTable');
      // leagueTable.forEach((table) =>
      //     {leagueTables.add(LeagueTableDto.fromJson(table).toDomain())});
      // return right(leagueTables);
      List cachedLeagueTables = await leagueTableCache.get('leagueTable');

      List<LeagueTable> leagueTables = <LeagueTable>[];

      for (var cachedLeagueTable in cachedLeagueTables) {
        Map<String, dynamic> parsedCachedleagueTable = <String, dynamic>{};
        cachedLeagueTable.forEach(
          (key, value) => {
            parsedCachedleagueTable[key] = value,
          },
        );
        final LeagueTable leagueTable = LeagueTable(
            teamName: TeamName(
              value: parsedCachedleagueTable['teamName'],
            ),
            teamLogo: TeamLogo(
              value: parsedCachedleagueTable['teamLogo'],
            ));
        leagueTables.add(leagueTable);
      }
      return right(leagueTables);
    } catch (e) {
      return left(const LeagueTableFailure.localDBError());
    }
  }
}
