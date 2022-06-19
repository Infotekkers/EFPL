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
  final SettingsLocalDataProvider _settingsLocalDataProvider;
  final UserDetailRemoteDataProvider _settingsRemoteDataProvider;

  SettingsRepository(
      this._settingsLocalDataProvider, this._settingsRemoteDataProvider);

  SettingsLocalDataProvider get settingsLocalDataProvider =>
      _settingsLocalDataProvider;
  UserDetailRemoteDataProvider get settingsRemoteDataProvider =>
      _settingsRemoteDataProvider;

  Utility utility = Utility();

  @override
  Future<Either<SettingsFailure, Settings>> getUserDetail(
      String userId, String token) async {
    return settingsRemoteDataProvider.getUserDetail(userId, token);
  }

  @override
  Future<Either<SettingsFailure, Unit>> update(
      Settings settings, String userId) async {
    return settingsRemoteDataProvider.updateUserDetail(settings, userId);
  }
}
