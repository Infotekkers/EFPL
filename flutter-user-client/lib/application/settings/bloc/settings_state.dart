part of 'settings_bloc.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;
  const factory SettingsState.loadInProgress() = _Loading;
  const factory SettingsState.loadSuccess(Settings settings) = _LoadSuccess;
  const factory SettingsState.loadFailure(SettingsFailure settingsFailure) =
      _LoadFailure;
  const factory SettingsState.settingsUpdateSuccess(String message) =
      _UpdateSettingsSuccess;
}
