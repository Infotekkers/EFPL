import 'package:freezed_annotation/freezed_annotation.dart';

part 'fixture_failures.freezed.dart';

@freezed
abstract class FixtureFailures<T> with _$FixtureFailures<T> {
  // Auth Failures
  const factory FixtureFailures.noConnection({
    required final String failedValue,
  }) = NoConnection<T>;

  // Auth Failures
  const factory FixtureFailures.serverError({
    required final String failedValue,
  }) = ServerError<T>;

  // invalid email/password
  const factory FixtureFailures.unauthorizedUser({
    required final String failedValue,
  }) = UnauthorizedUser<T>;
}
