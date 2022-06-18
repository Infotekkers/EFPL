import 'package:dartz/dartz.dart';
import 'package:efpl/domain/settings/settings.dart';
import 'package:efpl/domain/settings/settings_failures.dart';
import 'package:efpl/infrastructure/settings/settings_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserDetailLocalDataProvider {
  Box userDetailCache = Hive.box('userDetailCache');

  Future<Either<SettingsFailure, UserDetail>> getUserDetail(
      String userId) async {
    try {
      var userDetail = await userDetailCache.get('userDetail');
      return right(UserDetailDto.fromJson(userDetail).toDomain());
    } catch (e) {
      return left(const SettingsFailure.localDBError());
    }
  }

  Future<Either<SettingsFailure, Unit>> updateUserDetail(
      UserDetail userDetail, String userId) async {
    UserDetailDto userDetailDto = UserDetailDto.fromDomain(userDetail);

    try {
      await userDetailCache.put('userDetail', userDetailDto.toJson());
      return right(unit);
    } catch (e) {
      return left(const SettingsFailure.localDBError());
    }
  }
}
