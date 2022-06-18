import 'package:dartz/dartz.dart';
import 'package:efpl/domain/settings/settings.dart';
import 'package:efpl/domain/settings/settings_failures.dart';

abstract class ISettingsRepository {
  Future<Either<SettingsFailure, Settings>> getUserDetail(String userId);
  Future<Either<SettingsFailure, Unit>> update(Settings setting);
}
