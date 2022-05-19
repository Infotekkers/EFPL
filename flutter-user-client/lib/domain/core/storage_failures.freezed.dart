// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'storage_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StorageFailuresTearOff {
  const _$StorageFailuresTearOff();

  HiveError<T> hiveError<T>({required T failedValue}) {
    return HiveError<T>(
      failedValue: failedValue,
    );
  }

  SharedPreferencesError<T> sharedPreferencesError<T>(
      {required T failedValue}) {
    return SharedPreferencesError<T>(
      failedValue: failedValue,
    );
  }

  SecureStorageError<T> secureStorageError<T>({required T failedValue}) {
    return SecureStorageError<T>(
      failedValue: failedValue,
    );
  }
}

/// @nodoc
const $StorageFailures = _$StorageFailuresTearOff();

/// @nodoc
mixin _$StorageFailures<T> {
  T get failedValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) hiveError,
    required TResult Function(T failedValue) sharedPreferencesError,
    required TResult Function(T failedValue) secureStorageError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue)? hiveError,
    TResult Function(T failedValue)? sharedPreferencesError,
    TResult Function(T failedValue)? secureStorageError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? hiveError,
    TResult Function(T failedValue)? sharedPreferencesError,
    TResult Function(T failedValue)? secureStorageError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HiveError<T> value) hiveError,
    required TResult Function(SharedPreferencesError<T> value)
        sharedPreferencesError,
    required TResult Function(SecureStorageError<T> value) secureStorageError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HiveError<T> value)? hiveError,
    TResult Function(SharedPreferencesError<T> value)? sharedPreferencesError,
    TResult Function(SecureStorageError<T> value)? secureStorageError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HiveError<T> value)? hiveError,
    TResult Function(SharedPreferencesError<T> value)? sharedPreferencesError,
    TResult Function(SecureStorageError<T> value)? secureStorageError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StorageFailuresCopyWith<T, StorageFailures<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageFailuresCopyWith<T, $Res> {
  factory $StorageFailuresCopyWith(
          StorageFailures<T> value, $Res Function(StorageFailures<T>) then) =
      _$StorageFailuresCopyWithImpl<T, $Res>;
  $Res call({T failedValue});
}

/// @nodoc
class _$StorageFailuresCopyWithImpl<T, $Res>
    implements $StorageFailuresCopyWith<T, $Res> {
  _$StorageFailuresCopyWithImpl(this._value, this._then);

  final StorageFailures<T> _value;
  // ignore: unused_field
  final $Res Function(StorageFailures<T>) _then;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
abstract class $HiveErrorCopyWith<T, $Res>
    implements $StorageFailuresCopyWith<T, $Res> {
  factory $HiveErrorCopyWith(
          HiveError<T> value, $Res Function(HiveError<T>) then) =
      _$HiveErrorCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class _$HiveErrorCopyWithImpl<T, $Res>
    extends _$StorageFailuresCopyWithImpl<T, $Res>
    implements $HiveErrorCopyWith<T, $Res> {
  _$HiveErrorCopyWithImpl(
      HiveError<T> _value, $Res Function(HiveError<T>) _then)
      : super(_value, (v) => _then(v as HiveError<T>));

  @override
  HiveError<T> get _value => super._value as HiveError<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(HiveError<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$HiveError<T> implements HiveError<T> {
  const _$HiveError({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'StorageFailures<$T>.hiveError(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HiveError<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $HiveErrorCopyWith<T, HiveError<T>> get copyWith =>
      _$HiveErrorCopyWithImpl<T, HiveError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) hiveError,
    required TResult Function(T failedValue) sharedPreferencesError,
    required TResult Function(T failedValue) secureStorageError,
  }) {
    return hiveError(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue)? hiveError,
    TResult Function(T failedValue)? sharedPreferencesError,
    TResult Function(T failedValue)? secureStorageError,
  }) {
    return hiveError?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? hiveError,
    TResult Function(T failedValue)? sharedPreferencesError,
    TResult Function(T failedValue)? secureStorageError,
    required TResult orElse(),
  }) {
    if (hiveError != null) {
      return hiveError(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HiveError<T> value) hiveError,
    required TResult Function(SharedPreferencesError<T> value)
        sharedPreferencesError,
    required TResult Function(SecureStorageError<T> value) secureStorageError,
  }) {
    return hiveError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HiveError<T> value)? hiveError,
    TResult Function(SharedPreferencesError<T> value)? sharedPreferencesError,
    TResult Function(SecureStorageError<T> value)? secureStorageError,
  }) {
    return hiveError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HiveError<T> value)? hiveError,
    TResult Function(SharedPreferencesError<T> value)? sharedPreferencesError,
    TResult Function(SecureStorageError<T> value)? secureStorageError,
    required TResult orElse(),
  }) {
    if (hiveError != null) {
      return hiveError(this);
    }
    return orElse();
  }
}

abstract class HiveError<T> implements StorageFailures<T> {
  const factory HiveError({required T failedValue}) = _$HiveError<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  $HiveErrorCopyWith<T, HiveError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SharedPreferencesErrorCopyWith<T, $Res>
    implements $StorageFailuresCopyWith<T, $Res> {
  factory $SharedPreferencesErrorCopyWith(SharedPreferencesError<T> value,
          $Res Function(SharedPreferencesError<T>) then) =
      _$SharedPreferencesErrorCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class _$SharedPreferencesErrorCopyWithImpl<T, $Res>
    extends _$StorageFailuresCopyWithImpl<T, $Res>
    implements $SharedPreferencesErrorCopyWith<T, $Res> {
  _$SharedPreferencesErrorCopyWithImpl(SharedPreferencesError<T> _value,
      $Res Function(SharedPreferencesError<T>) _then)
      : super(_value, (v) => _then(v as SharedPreferencesError<T>));

  @override
  SharedPreferencesError<T> get _value =>
      super._value as SharedPreferencesError<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(SharedPreferencesError<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SharedPreferencesError<T> implements SharedPreferencesError<T> {
  const _$SharedPreferencesError({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'StorageFailures<$T>.sharedPreferencesError(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SharedPreferencesError<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $SharedPreferencesErrorCopyWith<T, SharedPreferencesError<T>> get copyWith =>
      _$SharedPreferencesErrorCopyWithImpl<T, SharedPreferencesError<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) hiveError,
    required TResult Function(T failedValue) sharedPreferencesError,
    required TResult Function(T failedValue) secureStorageError,
  }) {
    return sharedPreferencesError(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue)? hiveError,
    TResult Function(T failedValue)? sharedPreferencesError,
    TResult Function(T failedValue)? secureStorageError,
  }) {
    return sharedPreferencesError?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? hiveError,
    TResult Function(T failedValue)? sharedPreferencesError,
    TResult Function(T failedValue)? secureStorageError,
    required TResult orElse(),
  }) {
    if (sharedPreferencesError != null) {
      return sharedPreferencesError(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HiveError<T> value) hiveError,
    required TResult Function(SharedPreferencesError<T> value)
        sharedPreferencesError,
    required TResult Function(SecureStorageError<T> value) secureStorageError,
  }) {
    return sharedPreferencesError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HiveError<T> value)? hiveError,
    TResult Function(SharedPreferencesError<T> value)? sharedPreferencesError,
    TResult Function(SecureStorageError<T> value)? secureStorageError,
  }) {
    return sharedPreferencesError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HiveError<T> value)? hiveError,
    TResult Function(SharedPreferencesError<T> value)? sharedPreferencesError,
    TResult Function(SecureStorageError<T> value)? secureStorageError,
    required TResult orElse(),
  }) {
    if (sharedPreferencesError != null) {
      return sharedPreferencesError(this);
    }
    return orElse();
  }
}

abstract class SharedPreferencesError<T> implements StorageFailures<T> {
  const factory SharedPreferencesError({required T failedValue}) =
      _$SharedPreferencesError<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  $SharedPreferencesErrorCopyWith<T, SharedPreferencesError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecureStorageErrorCopyWith<T, $Res>
    implements $StorageFailuresCopyWith<T, $Res> {
  factory $SecureStorageErrorCopyWith(SecureStorageError<T> value,
          $Res Function(SecureStorageError<T>) then) =
      _$SecureStorageErrorCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class _$SecureStorageErrorCopyWithImpl<T, $Res>
    extends _$StorageFailuresCopyWithImpl<T, $Res>
    implements $SecureStorageErrorCopyWith<T, $Res> {
  _$SecureStorageErrorCopyWithImpl(
      SecureStorageError<T> _value, $Res Function(SecureStorageError<T>) _then)
      : super(_value, (v) => _then(v as SecureStorageError<T>));

  @override
  SecureStorageError<T> get _value => super._value as SecureStorageError<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(SecureStorageError<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SecureStorageError<T> implements SecureStorageError<T> {
  const _$SecureStorageError({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'StorageFailures<$T>.secureStorageError(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SecureStorageError<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $SecureStorageErrorCopyWith<T, SecureStorageError<T>> get copyWith =>
      _$SecureStorageErrorCopyWithImpl<T, SecureStorageError<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) hiveError,
    required TResult Function(T failedValue) sharedPreferencesError,
    required TResult Function(T failedValue) secureStorageError,
  }) {
    return secureStorageError(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue)? hiveError,
    TResult Function(T failedValue)? sharedPreferencesError,
    TResult Function(T failedValue)? secureStorageError,
  }) {
    return secureStorageError?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? hiveError,
    TResult Function(T failedValue)? sharedPreferencesError,
    TResult Function(T failedValue)? secureStorageError,
    required TResult orElse(),
  }) {
    if (secureStorageError != null) {
      return secureStorageError(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HiveError<T> value) hiveError,
    required TResult Function(SharedPreferencesError<T> value)
        sharedPreferencesError,
    required TResult Function(SecureStorageError<T> value) secureStorageError,
  }) {
    return secureStorageError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HiveError<T> value)? hiveError,
    TResult Function(SharedPreferencesError<T> value)? sharedPreferencesError,
    TResult Function(SecureStorageError<T> value)? secureStorageError,
  }) {
    return secureStorageError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HiveError<T> value)? hiveError,
    TResult Function(SharedPreferencesError<T> value)? sharedPreferencesError,
    TResult Function(SecureStorageError<T> value)? secureStorageError,
    required TResult orElse(),
  }) {
    if (secureStorageError != null) {
      return secureStorageError(this);
    }
    return orElse();
  }
}

abstract class SecureStorageError<T> implements StorageFailures<T> {
  const factory SecureStorageError({required T failedValue}) =
      _$SecureStorageError<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  $SecureStorageErrorCopyWith<T, SecureStorageError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
