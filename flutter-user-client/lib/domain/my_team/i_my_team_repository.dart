import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/value_failures.dart';
import 'package:efpl/domain/my_team/my_team.dart';

abstract class IMyTeamRepository {
  Future<Either<ValueFailure<MyTeam>, MyTeam>> getUserTeam(String userId);
  Future<Either<ValueFailure<MyTeam>, Unit>> saveUserTeam(
      MyTeam myTeam, String userId);
}
