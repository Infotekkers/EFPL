import 'package:dartz/dartz.dart';
import 'package:efpl/domain/my_team/my_team.dart';
import 'package:efpl/domain/my_team/my_team_failures.dart';

class MyTeamLocalDataProvider {
  Future<Either<MyTeamFailure, MyTeam>> getUserTeam(String userId) {
    // TODO: implement getUserTeam
    throw UnimplementedError();
  }

  Future<Either<MyTeamFailure, Unit>> saveUserTeam(
      MyTeam myTeam, String userId) {
    // TODO: implement saveUserTeam
    throw UnimplementedError();
  }
}
