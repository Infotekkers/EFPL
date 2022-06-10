import 'package:dartz/dartz.dart';
import 'package:efpl/domain/my_team/i_my_team_repository.dart';
import 'package:efpl/domain/my_team/my_team.dart';
import 'package:efpl/domain/my_team/my_team_failures.dart';
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
  Future<Either<MyTeamFailure, MyTeam>> getUserTeam(gameweekId) async {
    // if (await utility.hasInternetConnection()) {
    return myTeamRemoteDataProvider.getUserTeam(gameweekId);
    // } else {
    //   return myTeamLocalDataProvider.getUserTeam(userId, gameweekId);
    // }
  }

  @override
  Future<Either<MyTeamFailure, Unit>> saveUserTeam(MyTeam myTeam) async {
    // if (await utility.hasInternetConnection()) {
    return myTeamRemoteDataProvider.saveUserTeam(myTeam);
    // } else {
    //   return myTeamLocalDataProvider.saveUserTeam(myTeam, userId);
    // }
  }
}
