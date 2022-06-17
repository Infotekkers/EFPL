import 'package:dartz/dartz.dart';
import 'package:efpl/domain/settings/settings.dart';
import 'package:efpl/domain/settings/settings_failures.dart';

abstract class ISettingsRepository {
  Future<Either<SettingsFailure, UserDetail>> getUserDetail(String userId);
  Future<Either<SettingsFailure, Unit>> updateUserDetail(
      UserDetail userDetail, String userId);
}
