import 'package:efpl/domain/core/value_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/my_team/i_my_team_repository.dart';
import 'package:efpl/domain/my_team/my_team.dart';
import 'package:efpl/infrastructure/my_team/my_team_remote_data_provider.dart';
import 'package:efpl/infrastructure/my_team/my_team_local_data_provider.dart';
import 'package:efpl/services/utility.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IMyTeamRepository)
class MyTeamRepository implements IMyTeamRepository {
  final MyTeamLocalDataProvider _myTeamLocalDataProvider;
  final MyTeamRemoteDataProvider _myTeamRemoteDataProvider;

  MyTeamRepository(
      this._myTeamLocalDataProvider, this._myTeamRemoteDataProvider);

  MyTeamLocalDataProvider get myTeamLocalDataProvider =>
      _myTeamLocalDataProvider;
  MyTeamRemoteDataProvider get myTeamRemoteDataProvider =>
      _myTeamRemoteDataProvider;

  Utility utility = Utility();

  @override
  Future<Either<ValueFailure<MyTeam>, MyTeam>> getUserTeam(
      String userId) async {
    if (await utility.hasInternetConnection()) {
      return myTeamRemoteDataProvider.getUserTeam(userId);
    } else {
      return myTeamLocalDataProvider.getUserTeam(userId);
    }
  }

  @override
  Future<Either<ValueFailure<MyTeam>, Unit>> saveUserTeam(
      MyTeam myTeam, String userId) async {
    if (await utility.hasInternetConnection()) {
      return myTeamRemoteDataProvider.saveUserTeam(myTeam, userId);
    } else {
      return myTeamLocalDataProvider.saveUserTeam(myTeam, userId);
    }
  }
}
