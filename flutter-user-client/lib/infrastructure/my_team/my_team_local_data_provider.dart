import 'package:dartz/dartz.dart';
import 'package:efpl/domain/my_team/my_team.dart';
import 'package:efpl/domain/my_team/my_team_failures.dart';
import 'package:efpl/infrastructure/my_team/my_team_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@injectable
class MyTeamLocalDataProvider {
  Box myTeamCache = Hive.box('myTeamCache');

  Future<Either<MyTeamFailure, MyTeam>> getUserTeam(
      String userId, String gameweekId) async {
    try {
      var myTeam = await myTeamCache.get('myTeam');
      return right(MyTeamDto.fromJson(myTeam).toDomain());
    } catch (e) {
      return left(const MyTeamFailure.localDBError());
    }
  }

  Future<Either<MyTeamFailure, Unit>> saveUserTeam(
      MyTeam myTeam, String userId) async {
    MyTeamDto myTeamDto = MyTeamDto.fromDomain(myTeam);

    try {
      await myTeamCache.put('myTeam', myTeamDto.toJson());
      return right(unit);
    } catch (e) {
      return left(const MyTeamFailure.localDBError());
    }
  }
}
