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
}
