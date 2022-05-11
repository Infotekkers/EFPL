import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.empty({required T failedValue}) = Empty<T>;
  const factory ValueFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) = ExceedingLength<T>;
  const factory ValueFailure.exceedingRange({
    required T failedValue,
    required List range,
  }) = ExceedingRange<T>;
  const factory ValueFailure.invalid({required T failedValue}) = Invalid<T>;

  // * My Team
  const factory ValueFailure.invalidChipUsage(
      {required T failedValue,
      required String activeChip}) = InvalidChipUsage<T>;
}
