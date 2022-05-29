part of 'util_bloc.dart';

@freezed
class UtilEvent with _$UtilEvent {
  const factory UtilEvent.setDefaultLocale() = _SetDefaultLocale;
  const factory UtilEvent.setLocale({
    required Locale newLocale,
  }) = _SetLocale;

  const factory UtilEvent.clearLocale({
    required Locale newLocale,
  }) = _ClearLocale;
}
