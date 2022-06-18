part of 'settings_bloc.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;
  const factory SettingsState.loadInProgress() = _Loading;
  const factory SettingsState.loadSuccess(UserDetail userDetail) = _LoadSuccess;
  const factory SettingsState.loadFailure(SettingsFailure settingsFailure) =
      _LoadFailure;
  const factory SettingsState.update(UserDetail userDetail) = _Update;
}
