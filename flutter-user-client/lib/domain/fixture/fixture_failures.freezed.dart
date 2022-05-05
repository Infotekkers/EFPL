// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fixture_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FixtureFailuresTearOff {
  const _$FixtureFailuresTearOff();

  NoConnection<T> noConnection<T>({required String failedValue}) {
    return NoConnection<T>(
      failedValue: failedValue,
    );
  }

  ServerError<T> serverError<T>({required String failedValue}) {
    return ServerError<T>(
      failedValue: failedValue,
    );
  }

  UnauthorizedUser<T> unauthorizedUser<T>({required String failedValue}) {
    return UnauthorizedUser<T>(
      failedValue: failedValue,
    );
  }
}

/// @nodoc
const $FixtureFailures = _$FixtureFailuresTearOff();

/// @nodoc
mixin _$FixtureFailures<T> {
  String get failedValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) noConnection,
    required TResult Function(String failedValue) serverError,
    required TResult Function(String failedValue) unauthorizedUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? noConnection,
    TResult Function(String failedValue)? serverError,
    TResult Function(String failedValue)? unauthorizedUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? noConnection,
    TResult Function(String failedValue)? serverError,
    TResult Function(String failedValue)? unauthorizedUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoConnection<T> value) noConnection,
    required TResult Function(ServerError<T> value) serverError,
    required TResult Function(UnauthorizedUser<T> value) unauthorizedUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(ServerError<T> value)? serverError,
    TResult Function(UnauthorizedUser<T> value)? unauthorizedUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(ServerError<T> value)? serverError,
    TResult Function(UnauthorizedUser<T> value)? unauthorizedUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FixtureFailuresCopyWith<T, FixtureFailures<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FixtureFailuresCopyWith<T, $Res> {
  factory $FixtureFailuresCopyWith(
          FixtureFailures<T> value, $Res Function(FixtureFailures<T>) then) =
      _$FixtureFailuresCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class _$FixtureFailuresCopyWithImpl<T, $Res>
    implements $FixtureFailuresCopyWith<T, $Res> {
  _$FixtureFailuresCopyWithImpl(this._value, this._then);

  final FixtureFailures<T> _value;
  // ignore: unused_field
  final $Res Function(FixtureFailures<T>) _then;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $NoConnectionCopyWith<T, $Res>
    implements $FixtureFailuresCopyWith<T, $Res> {
  factory $NoConnectionCopyWith(
          NoConnection<T> value, $Res Function(NoConnection<T>) then) =
      _$NoConnectionCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class _$NoConnectionCopyWithImpl<T, $Res>
    extends _$FixtureFailuresCopyWithImpl<T, $Res>
    implements $NoConnectionCopyWith<T, $Res> {
  _$NoConnectionCopyWithImpl(
      NoConnection<T> _value, $Res Function(NoConnection<T>) _then)
      : super(_value, (v) => _then(v as NoConnection<T>));

  @override
  NoConnection<T> get _value => super._value as NoConnection<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(NoConnection<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NoConnection<T> implements NoConnection<T> {
  const _$NoConnection({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'FixtureFailures<$T>.noConnection(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NoConnection<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $NoConnectionCopyWith<T, NoConnection<T>> get copyWith =>
      _$NoConnectionCopyWithImpl<T, NoConnection<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) noConnection,
    required TResult Function(String failedValue) serverError,
    required TResult Function(String failedValue) unauthorizedUser,
  }) {
    return noConnection(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? noConnection,
    TResult Function(String failedValue)? serverError,
    TResult Function(String failedValue)? unauthorizedUser,
  }) {
    return noConnection?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? noConnection,
    TResult Function(String failedValue)? serverError,
    TResult Function(String failedValue)? unauthorizedUser,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoConnection<T> value) noConnection,
    required TResult Function(ServerError<T> value) serverError,
    required TResult Function(UnauthorizedUser<T> value) unauthorizedUser,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(ServerError<T> value)? serverError,
    TResult Function(UnauthorizedUser<T> value)? unauthorizedUser,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(ServerError<T> value)? serverError,
    TResult Function(UnauthorizedUser<T> value)? unauthorizedUser,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class NoConnection<T> implements FixtureFailures<T> {
  const factory NoConnection({required String failedValue}) = _$NoConnection<T>;

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  $NoConnectionCopyWith<T, NoConnection<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerErrorCopyWith<T, $Res>
    implements $FixtureFailuresCopyWith<T, $Res> {
  factory $ServerErrorCopyWith(
          ServerError<T> value, $Res Function(ServerError<T>) then) =
      _$ServerErrorCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class _$ServerErrorCopyWithImpl<T, $Res>
    extends _$FixtureFailuresCopyWithImpl<T, $Res>
    implements $ServerErrorCopyWith<T, $Res> {
  _$ServerErrorCopyWithImpl(
      ServerError<T> _value, $Res Function(ServerError<T>) _then)
      : super(_value, (v) => _then(v as ServerError<T>));

  @override
  ServerError<T> get _value => super._value as ServerError<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(ServerError<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServerError<T> implements ServerError<T> {
  const _$ServerError({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'FixtureFailures<$T>.serverError(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServerError<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $ServerErrorCopyWith<T, ServerError<T>> get copyWith =>
      _$ServerErrorCopyWithImpl<T, ServerError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) noConnection,
    required TResult Function(String failedValue) serverError,
    required TResult Function(String failedValue) unauthorizedUser,
  }) {
    return serverError(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? noConnection,
    TResult Function(String failedValue)? serverError,
    TResult Function(String failedValue)? unauthorizedUser,
  }) {
    return serverError?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? noConnection,
    TResult Function(String failedValue)? serverError,
    TResult Function(String failedValue)? unauthorizedUser,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoConnection<T> value) noConnection,
    required TResult Function(ServerError<T> value) serverError,
    required TResult Function(UnauthorizedUser<T> value) unauthorizedUser,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(ServerError<T> value)? serverError,
    TResult Function(UnauthorizedUser<T> value)? unauthorizedUser,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(ServerError<T> value)? serverError,
    TResult Function(UnauthorizedUser<T> value)? unauthorizedUser,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError<T> implements FixtureFailures<T> {
  const factory ServerError({required String failedValue}) = _$ServerError<T>;

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  $ServerErrorCopyWith<T, ServerError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnauthorizedUserCopyWith<T, $Res>
    implements $FixtureFailuresCopyWith<T, $Res> {
  factory $UnauthorizedUserCopyWith(
          UnauthorizedUser<T> value, $Res Function(UnauthorizedUser<T>) then) =
      _$UnauthorizedUserCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class _$UnauthorizedUserCopyWithImpl<T, $Res>
    extends _$FixtureFailuresCopyWithImpl<T, $Res>
    implements $UnauthorizedUserCopyWith<T, $Res> {
  _$UnauthorizedUserCopyWithImpl(
      UnauthorizedUser<T> _value, $Res Function(UnauthorizedUser<T>) _then)
      : super(_value, (v) => _then(v as UnauthorizedUser<T>));

  @override
  UnauthorizedUser<T> get _value => super._value as UnauthorizedUser<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(UnauthorizedUser<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnauthorizedUser<T> implements UnauthorizedUser<T> {
  const _$UnauthorizedUser({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'FixtureFailures<$T>.unauthorizedUser(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnauthorizedUser<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $UnauthorizedUserCopyWith<T, UnauthorizedUser<T>> get copyWith =>
      _$UnauthorizedUserCopyWithImpl<T, UnauthorizedUser<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) noConnection,
    required TResult Function(String failedValue) serverError,
    required TResult Function(String failedValue) unauthorizedUser,
  }) {
    return unauthorizedUser(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? noConnection,
    TResult Function(String failedValue)? serverError,
    TResult Function(String failedValue)? unauthorizedUser,
  }) {
    return unauthorizedUser?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? noConnection,
    TResult Function(String failedValue)? serverError,
    TResult Function(String failedValue)? unauthorizedUser,
    required TResult orElse(),
  }) {
    if (unauthorizedUser != null) {
      return unauthorizedUser(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoConnection<T> value) noConnection,
    required TResult Function(ServerError<T> value) serverError,
    required TResult Function(UnauthorizedUser<T> value) unauthorizedUser,
  }) {
    return unauthorizedUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(ServerError<T> value)? serverError,
    TResult Function(UnauthorizedUser<T> value)? unauthorizedUser,
  }) {
    return unauthorizedUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(ServerError<T> value)? serverError,
    TResult Function(UnauthorizedUser<T> value)? unauthorizedUser,
    required TResult orElse(),
  }) {
    if (unauthorizedUser != null) {
      return unauthorizedUser(this);
    }
    return orElse();
  }
}

abstract class UnauthorizedUser<T> implements FixtureFailures<T> {
  const factory UnauthorizedUser({required String failedValue}) =
      _$UnauthorizedUser<T>;

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  $UnauthorizedUserCopyWith<T, UnauthorizedUser<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
