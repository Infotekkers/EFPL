import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_failures.freezed.dart';

@freezed
abstract class HTTPFailures<T> with _$HTTPFailures<T> {
  // When no token
  const factory HTTPFailures.unauthenticated({required T failedValue}) =
      Unauthenticated<T>;

  // When invalid token
  const factory HTTPFailures.unauthorized({required T failedValue}) =
      Unauthorized<T>;

  // When no connection
  const factory HTTPFailures.noConnection({required T failedValue}) =
      NoConnection<T>;
  const factory HTTPFailures.socketError({required T failedValue}) =
      SocketError<T>;

  const factory HTTPFailures.handShakeError({required T failedValue}) =
      HandShakeError<T>;

  const factory HTTPFailures.unexpectedError({required T failedValue}) =
      UnexpectedError<T>;
  // .... more here
}
