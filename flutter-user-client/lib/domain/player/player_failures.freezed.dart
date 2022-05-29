// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'player_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlayerFailureTearOff {
  const _$PlayerFailureTearOff();

  _PlayerNotFound playerNotFound() {
    return const _PlayerNotFound();
  }

  _ServerError serverError() {
    return const _ServerError();
  }

  _NetworkError networkError() {
    return const _NetworkError();
  }
}

/// @nodoc
const $PlayerFailure = _$PlayerFailureTearOff();

/// @nodoc
mixin _$PlayerFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() playerNotFound,
    required TResult Function() serverError,
    required TResult Function() networkError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? playerNotFound,
    TResult Function()? serverError,
    TResult Function()? networkError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? playerNotFound,
    TResult Function()? serverError,
    TResult Function()? networkError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PlayerNotFound value) playerNotFound,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NetworkError value) networkError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PlayerNotFound value)? playerNotFound,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkError value)? networkError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PlayerNotFound value)? playerNotFound,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkError value)? networkError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerFailureCopyWith<$Res> {
  factory $PlayerFailureCopyWith(
          PlayerFailure value, $Res Function(PlayerFailure) then) =
      _$PlayerFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$PlayerFailureCopyWithImpl<$Res>
    implements $PlayerFailureCopyWith<$Res> {
  _$PlayerFailureCopyWithImpl(this._value, this._then);

  final PlayerFailure _value;
  // ignore: unused_field
  final $Res Function(PlayerFailure) _then;
}

/// @nodoc
abstract class _$PlayerNotFoundCopyWith<$Res> {
  factory _$PlayerNotFoundCopyWith(
          _PlayerNotFound value, $Res Function(_PlayerNotFound) then) =
      __$PlayerNotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class __$PlayerNotFoundCopyWithImpl<$Res>
    extends _$PlayerFailureCopyWithImpl<$Res>
    implements _$PlayerNotFoundCopyWith<$Res> {
  __$PlayerNotFoundCopyWithImpl(
      _PlayerNotFound _value, $Res Function(_PlayerNotFound) _then)
      : super(_value, (v) => _then(v as _PlayerNotFound));

  @override
  _PlayerNotFound get _value => super._value as _PlayerNotFound;
}

/// @nodoc

class _$_PlayerNotFound implements _PlayerNotFound {
  const _$_PlayerNotFound();

  @override
  String toString() {
    return 'PlayerFailure.playerNotFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PlayerNotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() playerNotFound,
    required TResult Function() serverError,
    required TResult Function() networkError,
  }) {
    return playerNotFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? playerNotFound,
    TResult Function()? serverError,
    TResult Function()? networkError,
  }) {
    return playerNotFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? playerNotFound,
    TResult Function()? serverError,
    TResult Function()? networkError,
    required TResult orElse(),
  }) {
    if (playerNotFound != null) {
      return playerNotFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PlayerNotFound value) playerNotFound,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NetworkError value) networkError,
  }) {
    return playerNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PlayerNotFound value)? playerNotFound,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkError value)? networkError,
  }) {
    return playerNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PlayerNotFound value)? playerNotFound,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkError value)? networkError,
    required TResult orElse(),
  }) {
    if (playerNotFound != null) {
      return playerNotFound(this);
    }
    return orElse();
  }
}

abstract class _PlayerNotFound implements PlayerFailure {
  const factory _PlayerNotFound() = _$_PlayerNotFound;
}

/// @nodoc
abstract class _$ServerErrorCopyWith<$Res> {
  factory _$ServerErrorCopyWith(
          _ServerError value, $Res Function(_ServerError) then) =
      __$ServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$ServerErrorCopyWithImpl<$Res> extends _$PlayerFailureCopyWithImpl<$Res>
    implements _$ServerErrorCopyWith<$Res> {
  __$ServerErrorCopyWithImpl(
      _ServerError _value, $Res Function(_ServerError) _then)
      : super(_value, (v) => _then(v as _ServerError));

  @override
  _ServerError get _value => super._value as _ServerError;
}

/// @nodoc

class _$_ServerError implements _ServerError {
  const _$_ServerError();

  @override
  String toString() {
    return 'PlayerFailure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() playerNotFound,
    required TResult Function() serverError,
    required TResult Function() networkError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? playerNotFound,
    TResult Function()? serverError,
    TResult Function()? networkError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? playerNotFound,
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
    required TResult Function(_PlayerNotFound value) playerNotFound,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NetworkError value) networkError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PlayerNotFound value)? playerNotFound,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkError value)? networkError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PlayerNotFound value)? playerNotFound,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkError value)? networkError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError implements PlayerFailure {
  const factory _ServerError() = _$_ServerError;
}

/// @nodoc
abstract class _$NetworkErrorCopyWith<$Res> {
  factory _$NetworkErrorCopyWith(
          _NetworkError value, $Res Function(_NetworkError) then) =
      __$NetworkErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$NetworkErrorCopyWithImpl<$Res>
    extends _$PlayerFailureCopyWithImpl<$Res>
    implements _$NetworkErrorCopyWith<$Res> {
  __$NetworkErrorCopyWithImpl(
      _NetworkError _value, $Res Function(_NetworkError) _then)
      : super(_value, (v) => _then(v as _NetworkError));

  @override
  _NetworkError get _value => super._value as _NetworkError;
}

/// @nodoc

class _$_NetworkError implements _NetworkError {
  const _$_NetworkError();

  @override
  String toString() {
    return 'PlayerFailure.networkError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NetworkError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() playerNotFound,
    required TResult Function() serverError,
    required TResult Function() networkError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? playerNotFound,
    TResult Function()? serverError,
    TResult Function()? networkError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? playerNotFound,
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
    required TResult Function(_PlayerNotFound value) playerNotFound,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NetworkError value) networkError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PlayerNotFound value)? playerNotFound,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkError value)? networkError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PlayerNotFound value)? playerNotFound,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkError value)? networkError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class _NetworkError implements PlayerFailure {
  const factory _NetworkError() = _$_NetworkError;
}
