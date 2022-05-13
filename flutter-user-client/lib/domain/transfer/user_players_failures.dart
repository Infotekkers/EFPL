import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_players_failures.freezed.dart';

@freezed
abstract class UserPlayerFailure<T> with _$UserPlayerFailure<T> {
  const factory UserPlayerFailure.empty({
    required final String failedValue,
  }) = Empty<T>;

  // price of players is over max
  const factory UserPlayerFailure.exceededPrice({
    required final String failedValue,
  }) = ExceededPrice<T>;

  const factory UserPlayerFailure.exceededTeamCount({
    required final String failedValue,
  }) = ExceededTeamCount<T>;

  const factory UserPlayerFailure.incompleteTeam({
    required final String failedValue,
  }) = IncompleteTeam<T>;

  const factory UserPlayerFailure.deadlinePassed({
    required final String failedValue,
  }) = DeadlinePassed<T>;
}
