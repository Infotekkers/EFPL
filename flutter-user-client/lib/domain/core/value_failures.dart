// import 'package:efpl/domain/auth/email_address.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({required String failedValue}) =
      InvalidEmail<T>;
  const factory ValueFailure.shortPassword({required String failedValue}) =
      ShortPassword<T>;

  const factory ValueFailure.invalidName({required T failedValue}) =
      InvalidName<T>;
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
  const factory ValueFailure.invalidPosition({
    required T failedValue,
    required String position,
  }) = InvalidPosition<T>;

  // GameWeekId Failure
  const factory ValueFailure.emptyGameWeekId({
    required T failedValue,
  }) = EmptyGameWeekId<T>;
  const factory ValueFailure.invalidGameWeekId({
    required T failedValue,
  }) = InvalidGameWeekId<T>;

  // MatchID Failure
  const factory ValueFailure.emptyMatchId({
    required T failedValue,
  }) = EmptyMatchId<T>;
  const factory ValueFailure.invalidMatchId({
    required T failedValue,
  }) = InvalidMatchId<T>;

  // Schedule Failure
  const factory ValueFailure.emptySchedule({
    required T failedValue,
  }) = EmptySchedule<T>;
  const factory ValueFailure.invalidSchedule({
    required T failedValue,
  }) = InvalidSchedule<T>;

  // Schedule Failure
  const factory ValueFailure.emptyStatus({
    required T failedValue,
  }) = EmptyStatus<T>;
  const factory ValueFailure.invalidStatus({
    required T failedValue,
  }) = InvalidStatus<T>;

  // Team Failure
  const factory ValueFailure.emptyTeam({
    required T failedValue,
  }) = EmptyTeam<T>;
  const factory ValueFailure.invalidTeam({
    required T failedValue,
  }) = InvalidTeam<T>;

  // Team Lineup Failure
  const factory ValueFailure.invalidTeamLineUp({
    required T failedValue,
  }) = InvalidTeamLineUp<T>;

  // Score Failure
  const factory ValueFailure.emptyScore({
    required T failedValue,
  }) = EmptyScore<T>;
  const factory ValueFailure.invalidScore({
    required T failedValue,
  }) = InvalidScore<T>;

  // Match Stat Failure
  const factory ValueFailure.invalidMatchStat({
    required T failedValue,
  }) = InvalidMatchStat<T>;
}
