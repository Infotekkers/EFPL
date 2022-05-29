import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_failures.freezed.dart';

@freezed
abstract class HTTPFailures<T> with _$HTTPFailures<T> {
  // When no token
  const factory HTTPFailures.unauthenticated({required String failedValue}) =
      Unauthenticated<T>;

  // When invalid token
  const factory HTTPFailures.unauthorized({required String failedValue}) =
      Unauthorized<T>;

  // When no connection
  const factory HTTPFailures.noConnection({required String failedValue}) =
      NoConnection<T>;
  const factory HTTPFailures.socketError({required String failedValue}) =
      SocketError<T>;

  const factory HTTPFailures.handShakeError({required String failedValue}) =
      HandShakeError<T>;

  const factory HTTPFailures.unexpectedError({required String failedValue}) =
      UnexpectedError<T>;
  // .... more here
}
