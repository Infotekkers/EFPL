part of 'settings_bloc.dart';

@freezed
abstract class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.loadUserDetail(String userId) = _LoadUserDetail;

  const factory SettingsEvent.updateUserDetail(
      UserDetail userDetail, String userId) = _UpdateUserDetail;
}
