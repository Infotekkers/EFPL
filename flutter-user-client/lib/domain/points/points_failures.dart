import 'package:freezed_annotation/freezed_annotation.dart';

part 'points_failures.freezed.dart';

@freezed
abstract class PointFailure<T> with _$PointFailure<T> {
  const factory PointFailure.noTeamSelected({
    required final String failedValue,
  }) = NoTeamSelected<T>;

  const factory PointFailure.incompleteTeam({
    required final String failedValue,
  }) = IncompleteTeam<T>;

  // HTTP Failures
  // When no token
  const factory PointFailure.unauthenticated({required String failedValue}) =
      Unauthenticated<T>;

  // When invalid token
  const factory PointFailure.unauthorized({required String failedValue}) =
      Unauthorized<T>;

  // When no connection
  const factory PointFailure.noConnection({required String failedValue}) =
      NoConnection<T>;
  const factory PointFailure.socketError({required String failedValue}) =
      SocketError<T>;

  const factory PointFailure.handShakeError({required String failedValue}) =
      HandShakeError<T>;

  const factory PointFailure.unexpectedError({required String failedValue}) =
      UnexpectedError<T>;

  // Storage Failure
  const factory PointFailure.hiveError({required String failedValue}) =
      HiveError<T>;

  const factory PointFailure.sharedPreferencesError(
      {required String failedValue}) = SharedPreferencesError<T>;

  const factory PointFailure.secureStorageError({required String failedValue}) =
      SecureStorageError<T>;
}
