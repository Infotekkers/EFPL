part of 'settings_bloc.dart';

@freezed
abstract class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.loadUserDetail(String userId, String token) =
      _LoadUserDetail;

  const factory SettingsEvent.updateUserDetail(
      Settings settings, String userId, String updateType) = _UpdateSettings;
}
