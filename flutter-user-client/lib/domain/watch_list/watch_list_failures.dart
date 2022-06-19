import 'package:freezed_annotation/freezed_annotation.dart';

part 'watch_list_failures.freezed.dart';

@freezed
abstract class WatchListFailure<T> with _$WatchListFailure<T> {
  const factory WatchListFailure.noPlayerInWatchList({
    required final String failedValue,
  }) = NoPlayerInWatchList<T>;

  // When no token
  const factory WatchListFailure.unauthenticated(
      {required String failedValue}) = Unauthenticated<T>;

  // When invalid token
  const factory WatchListFailure.unauthorized({required String failedValue}) =
      Unauthorized<T>;

  // When no connection
  const factory WatchListFailure.noConnection({required String failedValue}) =
      NoConnection<T>;
  const factory WatchListFailure.socketError({required String failedValue}) =
      SocketError<T>;

  const factory WatchListFailure.handShakeError({required String failedValue}) =
      HandShakeError<T>;

  const factory WatchListFailure.unexpectedError(
      {required String failedValue}) = UnexpectedError<T>;

  // Storage Failure
  const factory WatchListFailure.hiveError({required String failedValue}) =
      HiveError<T>;

  const factory WatchListFailure.sharedPreferencesError(
      {required String failedValue}) = SharedPreferencesError<T>;

  const factory WatchListFailure.secureStorageError(
      {required String failedValue}) = SecureStorageError<T>;
}
