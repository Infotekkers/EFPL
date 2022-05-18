import 'package:freezed_annotation/freezed_annotation.dart';

part 'fixture_failures.freezed.dart';

@freezed
abstract class FixtureFailures<T> with _$FixtureFailures<T> {
  // When no token
  const factory FixtureFailures.unauthenticated({required String failedValue}) =
      Unauthenticated<T>;

  // When invalid token
  const factory FixtureFailures.unauthorized({required String failedValue}) =
      Unauthorized<T>;

  // When no connection
  const factory FixtureFailures.noConnection({required String failedValue}) =
      NoConnection<T>;
  const factory FixtureFailures.socketError({required String failedValue}) =
      SocketError<T>;

  const factory FixtureFailures.handShakeError({required String failedValue}) =
      HandShakeError<T>;

  const factory FixtureFailures.unexpectedError({required String failedValue}) =
      UnexpectedError<T>;

  const factory FixtureFailures.hiveError({required T failedValue}) =
      HiveError<T>;

  const factory FixtureFailures.sharedPreferencesError(
      {required T failedValue}) = SharedPreferencesError<T>;

  const factory FixtureFailures.secureStorageError({required T failedValue}) =
      SecureStorageError<T>;
}
