import 'package:freezed_annotation/freezed_annotation.dart';

part 'fixture_failures.freezed.dart';

@freezed
abstract class FixtureFailures<T> with _$FixtureFailures<T> {
  const factory FixtureFailures.empty({
    required final String failedValue,
  }) = Empty<T>;
}
