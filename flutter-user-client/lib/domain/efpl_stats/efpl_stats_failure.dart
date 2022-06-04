import 'package:freezed_annotation/freezed_annotation.dart';

part 'efpl_stats_failure.freezed.dart';

@freezed
abstract class EFPLStatsFailure<T> with _$EFPLStatsFailure<T> {
  // When no token
  const factory EFPLStatsFailure.unauthenticated(
      {required String failedValue}) = Unauthenticated<T>;

  // When invalid token
  const factory EFPLStatsFailure.unauthorized({required String failedValue}) =
      Unauthorized<T>;

  // When no connection
  const factory EFPLStatsFailure.noConnection({required String failedValue}) =
      NoConnection<T>;
  const factory EFPLStatsFailure.socketError({required String failedValue}) =
      SocketError<T>;

  const factory EFPLStatsFailure.handShakeError({required String failedValue}) =
      HandShakeError<T>;

  const factory EFPLStatsFailure.unexpectedError(
      {required String failedValue}) = UnexpectedError<T>;
}
