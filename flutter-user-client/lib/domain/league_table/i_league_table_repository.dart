import 'package:efpl/domain/league_table/league_table.dart';

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/league_table/league_table_failure.dart';

abstract class ILeagueTableRepository {
  Future<Either<LeagueTableFailure, List<LeagueTable>>> getTeams();
}
