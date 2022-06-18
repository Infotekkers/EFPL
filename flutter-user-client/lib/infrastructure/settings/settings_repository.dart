import 'package:dartz/dartz.dart';
import 'package:efpl/domain/settings/i_settings_repository.dart';
import 'package:efpl/domain/settings/settings.dart';
import 'package:efpl/domain/settings/settings_failures.dart';
import 'package:efpl/infrastructure/settings/settings_remote_data_provider.dart';
import 'package:efpl/infrastructure/settings/settings_local_data_provider.dart';
import 'package:efpl/services/utility.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ISettingsRepository)
class SettingsRepository implements ISettingsRepository {
  final UserDetailLocalDataProvider _userDetailLocalDataProvider;
  final UserDetailRemoteDataProvider _userDetailRemoteDataProvider;

  SettingsRepository(
      this._userDetailLocalDataProvider, this._userDetailRemoteDataProvider);

  UserDetailLocalDataProvider get userDetailLocalDataProvider =>
      _userDetailLocalDataProvider;
  UserDetailRemoteDataProvider get userDetailRemoteDataProvider =>
      _userDetailRemoteDataProvider;

  Utility utility = Utility();

  @override
  Future<Either<SettingsFailure, UserDetail>> getUserDetail(
      String userId) async {
    // if (await utility.hasInternetConnection()) {
    return userDetailRemoteDataProvider.getUserDetail(userId);
    // } else {
    //   return myTeamLocalDataProvider.getUserTeam(userId, gameweekId);
    // }
  }

  @override
  Future<Either<SettingsFailure, Unit>> updateUserDetail(
      UserDetail userDetail, String userId) async {
    // if (await utility.hasInternetConnection()) {
    return userDetailRemoteDataProvider.updateUserDetail(userDetail, userId);
    // } else {
    //   return myTeamLocalDataProvider.saveUserTeam(myTeam, userId);
    // }
  }
}
