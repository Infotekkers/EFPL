import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_failures.freezed.dart';

@freezed
abstract class StatsFailures<T> with _$StatsFailures<T> {
  const factory StatsFailures.empty({
    required final String failedValue,
  }) = Empty<T>;

  const factory StatsFailures.negativeValue({required final int failedValue}) =
      NegativeValue<T>;
}
