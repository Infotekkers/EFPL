import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/value_failures.dart';
import 'package:efpl/domain/my_team/my_team.dart';

class MyTeamRemoteDataProvider {
  Future<Either<ValueFailure<MyTeam>, MyTeam>> getUserTeam(String userId) {
    // TODO: implement getUserTeam
    throw UnimplementedError();
  }

  Future<Either<ValueFailure<MyTeam>, Unit>> saveUserTeam(
      MyTeam myTeam, String userId) {
    // TODO: implement saveUserTeam
    throw UnimplementedError();
  }
}
