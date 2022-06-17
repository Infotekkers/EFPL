import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_failures.freezed.dart';

@freezed
abstract class SettingsFailure with _$SettingsFailure {
  const factory SettingsFailure.serverError() = _ServerError;
  const factory SettingsFailure.localDBError() = _LocalDBError;
  const factory SettingsFailure.networkError() = _NetworkError;
}
