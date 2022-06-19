// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'epl_stats_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EPLStatsFailureTearOff {
  const _$EPLStatsFailureTearOff();

  _ServerError<T> serverError<T>() {
    return _ServerError<T>();
  }

  _NetworkError<T> networkError<T>() {
    return _NetworkError<T>();
  }
}

/// @nodoc
const $EPLStatsFailure = _$EPLStatsFailureTearOff();

/// @nodoc
mixin _$EPLStatsFailure<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() networkError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? networkError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? networkError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError<T> value) serverError,
    required TResult Function(_NetworkError<T> value) networkError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError<T> value)? serverError,
    TResult Function(_NetworkError<T> value)? networkError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError<T> value)? serverError,
    TResult Function(_NetworkError<T> value)? networkError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EPLStatsFailureCopyWith<T, $Res> {
  factory $EPLStatsFailureCopyWith(
          EPLStatsFailure<T> value, $Res Function(EPLStatsFailure<T>) then) =
      _$EPLStatsFailureCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$EPLStatsFailureCopyWithImpl<T, $Res>
    implements $EPLStatsFailureCopyWith<T, $Res> {
  _$EPLStatsFailureCopyWithImpl(this._value, this._then);

  final EPLStatsFailure<T> _value;
  // ignore: unused_field
  final $Res Function(EPLStatsFailure<T>) _then;
}

/// @nodoc
abstract class _$ServerErrorCopyWith<T, $Res> {
  factory _$ServerErrorCopyWith(
          _ServerError<T> value, $Res Function(_ServerError<T>) then) =
      __$ServerErrorCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$ServerErrorCopyWithImpl<T, $Res>
    extends _$EPLStatsFailureCopyWithImpl<T, $Res>
    implements _$ServerErrorCopyWith<T, $Res> {
  __$ServerErrorCopyWithImpl(
      _ServerError<T> _value, $Res Function(_ServerError<T>) _then)
      : super(_value, (v) => _then(v as _ServerError<T>));

  @override
  _ServerError<T> get _value => super._value as _ServerError<T>;
}

/// @nodoc

class _$_ServerError<T> implements _ServerError<T> {
  const _$_ServerError();

  @override
  String toString() {
    return 'EPLStatsFailure<$T>.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ServerError<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() networkError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? networkError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? networkError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError<T> value) serverError,
    required TResult Function(_NetworkError<T> value) networkError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError<T> value)? serverError,
    TResult Function(_NetworkError<T> value)? networkError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError<T> value)? serverError,
    TResult Function(_NetworkError<T> value)? networkError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError<T> implements EPLStatsFailure<T> {
  const factory _ServerError() = _$_ServerError<T>;
}

/// @nodoc
abstract class _$NetworkErrorCopyWith<T, $Res> {
  factory _$NetworkErrorCopyWith(
          _NetworkError<T> value, $Res Function(_NetworkError<T>) then) =
      __$NetworkErrorCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$NetworkErrorCopyWithImpl<T, $Res>
    extends _$EPLStatsFailureCopyWithImpl<T, $Res>
    implements _$NetworkErrorCopyWith<T, $Res> {
  __$NetworkErrorCopyWithImpl(
      _NetworkError<T> _value, $Res Function(_NetworkError<T>) _then)
      : super(_value, (v) => _then(v as _NetworkError<T>));

  @override
  _NetworkError<T> get _value => super._value as _NetworkError<T>;
}

/// @nodoc

class _$_NetworkError<T> implements _NetworkError<T> {
  const _$_NetworkError();

  @override
  String toString() {
    return 'EPLStatsFailure<$T>.networkError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NetworkError<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() networkError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? networkError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? networkError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError<T> value) serverError,
    required TResult Function(_NetworkError<T> value) networkError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError<T> value)? serverError,
    TResult Function(_NetworkError<T> value)? networkError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError<T> value)? serverError,
    TResult Function(_NetworkError<T> value)? networkError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class _NetworkError<T> implements EPLStatsFailure<T> {
  const factory _NetworkError() = _$_NetworkError<T>;
}
