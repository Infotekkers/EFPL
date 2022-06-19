import 'package:dartz/dartz.dart';
import 'package:efpl/domain/my_team/my_team.dart';
import 'package:efpl/domain/my_team/my_team_failures.dart';

abstract class IMyTeamRepository {
  Future<Either<MyTeamFailure, MyTeam>> getUserTeam(String gameweekId);
  Future<Either<MyTeamFailure, Unit>> saveUserTeam(MyTeam myTeam);
}
