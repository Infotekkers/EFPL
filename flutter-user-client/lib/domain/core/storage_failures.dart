import 'package:freezed_annotation/freezed_annotation.dart';

part 'storage_failures.freezed.dart';

@freezed
abstract class StorageFailures<T> with _$StorageFailures<T> {
  const factory StorageFailures.hiveError({required T failedValue}) =
      HiveError<T>;

  const factory StorageFailures.sharedPreferencesError(
      {required T failedValue}) = SharedPreferencesError<T>;

  const factory StorageFailures.secureStorageError({required T failedValue}) =
      SecureStorageError<T>;
}
