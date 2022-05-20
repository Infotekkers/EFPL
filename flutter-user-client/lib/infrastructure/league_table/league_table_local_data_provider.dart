import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:efpl/domain/league_table/league_table.dart';
import 'package:efpl/domain/league_table/league_table.dart';
import 'package:efpl/domain/league_table/league_table_failure.dart';
import 'package:efpl/infrastructure/league_table/league_table_dto.dart';

@injectable
class LeagueTableLocalDataProvider {
  Box leagueTableCache = Hive.box('myTeamCache');

  Future<Either<LeagueTableFailure, LeagueTable>> getTeams() async {
    try {
      var leagueTable = await leagueTableCache.get('leagueTable');
      return right(LeagueTableDto.fromJson(leagueTable).toDomain());
    } catch (e) {
      return left(const LeagueTableFailure.localDBError());
    }
  }
}
