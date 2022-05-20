import 'package:dartz/dartz.dart';
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
      List<LeagueTable> leagueTables = [];
      var leagueTable = await leagueTableCache.get('leagueTable');
      leagueTable.forEach((table) =>
          {leagueTables.add(LeagueTableDto.fromJson(table).toDomain())});
      return right(leagueTables);
    } catch (e) {
      return left(const LeagueTableFailure.localDBError());
    }
  }
}
