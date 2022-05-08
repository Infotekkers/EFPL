part of 'util_bloc.dart';

@freezed
class UtilState with _$UtilState {
  const factory UtilState({
    required Locale locale,
  }) = _UtilState;

  factory UtilState.initial() => const UtilState(
        locale: Locale("en"),
      );
}
