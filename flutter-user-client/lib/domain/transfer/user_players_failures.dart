import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_players_failures.freezed.dart';

@freezed
abstract class UserPlayerFailure<T> with _$UserPlayerFailure<T> {
  const factory UserPlayerFailure.empty({
    required final String failedValue,
  }) = Empty<T>;
}
