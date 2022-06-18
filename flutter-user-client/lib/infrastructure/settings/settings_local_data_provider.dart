import 'package:dartz/dartz.dart';
import 'package:efpl/domain/settings/settings.dart';
import 'package:efpl/domain/settings/settings_failures.dart';
import 'package:efpl/infrastructure/settings/settings_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingsLocalDataProvider {
  Box userDetailCache = Hive.box('userDetailCache');

  Future<Either<SettingsFailure, Settings>> getUserDetail(String userId) async {
    try {
      var userDetail = await userDetailCache.get('userDetail');
      return right(SettingsDto.fromJson(userDetail).toDomain());
    } catch (e) {
      print("load error");
      print(e.toString());
      return left(const SettingsFailure.localDBError());
    }
  }

  Future<Either<SettingsFailure, Unit>> updateUserDetail(
      Settings userDetail, String userId) async {
    SettingsDto userDetailDto = SettingsDto.fromDomain(userDetail);

    try {
      await userDetailCache.put('userDetail', userDetailDto.toJson());
      return right(unit);
    } catch (e) {
      print("update error");
      print(e.toString());
      return left(const SettingsFailure.localDBError());
    }
  }
}
