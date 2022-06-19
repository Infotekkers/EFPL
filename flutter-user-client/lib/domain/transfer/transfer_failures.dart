import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_failures.freezed.dart';

@freezed
abstract class TransferFailure<T> with _$TransferFailure<T> {
  const factory TransferFailure.noTeamSelected({
    required final String failedValue,
  }) = NoTeamSelected<T>;

  // price of players is over max
  const factory TransferFailure.exceededPrice({
    required final String failedValue,
  }) = ExceededPrice<T>;

  const factory TransferFailure.exceededTeamCount({
    required final String failedValue,
  }) = ExceededTeamCount<T>;

  const factory TransferFailure.incompleteTeam({
    required final String failedValue,
  }) = IncompleteTeam<T>;

  const factory TransferFailure.deadlinePassed({
    required final String failedValue,
  }) = DeadlinePassed<T>;

  // HTTP Failures
  // When no token
  const factory TransferFailure.unauthenticated({required String failedValue}) =
      Unauthenticated<T>;

  // When invalid token
  const factory TransferFailure.unauthorized({required String failedValue}) =
      Unauthorized<T>;

  // When no connection
  const factory TransferFailure.noConnection({required String failedValue}) =
      NoConnection<T>;
  const factory TransferFailure.socketError({required String failedValue}) =
      SocketError<T>;

  const factory TransferFailure.handShakeError({required String failedValue}) =
      HandShakeError<T>;

  const factory TransferFailure.unexpectedError({required String failedValue}) =
      UnexpectedError<T>;

  // Storage Failure
  const factory TransferFailure.hiveError({required String failedValue}) =
      HiveError<T>;

  const factory TransferFailure.sharedPreferencesError(
      {required String failedValue}) = SharedPreferencesError<T>;

  const factory TransferFailure.secureStorageError(
      {required String failedValue}) = SecureStorageError<T>;
}
