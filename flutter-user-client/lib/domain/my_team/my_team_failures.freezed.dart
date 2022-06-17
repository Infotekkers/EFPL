// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_team_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MyTeamFailureTearOff {
  const _$MyTeamFailureTearOff();

  _ServerError serverError() {
    return const _ServerError();
  }

  _LocalDBError localDBError() {
    return const _LocalDBError();
  }

  _AuthError authError() {
    return const _AuthError();
  }

  _NetworkError networkError() {
    return const _NetworkError();
  }
}

/// @nodoc
const $MyTeamFailure = _$MyTeamFailureTearOff();

/// @nodoc
mixin _$MyTeamFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() localDBError,
    required TResult Function() authError,
    required TResult Function() networkError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? localDBError,
    TResult Function()? authError,
    TResult Function()? networkError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? localDBError,
    TResult Function()? authError,
    TResult Function()? networkError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_LocalDBError value) localDBError,
    required TResult Function(_AuthError value) authError,
    required TResult Function(_NetworkError value) networkError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_LocalDBError value)? localDBError,
    TResult Function(_AuthError value)? authError,
    TResult Function(_NetworkError value)? networkError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_LocalDBError value)? localDBError,
    TResult Function(_AuthError value)? authError,
    TResult Function(_NetworkError value)? networkError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyTeamFailureCopyWith<$Res> {
  factory $MyTeamFailureCopyWith(
          MyTeamFailure value, $Res Function(MyTeamFailure) then) =
      _$MyTeamFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$MyTeamFailureCopyWithImpl<$Res>
    implements $MyTeamFailureCopyWith<$Res> {
  _$MyTeamFailureCopyWithImpl(this._value, this._then);

  final MyTeamFailure _value;
  // ignore: unused_field
  final $Res Function(MyTeamFailure) _then;
}

/// @nodoc
abstract class _$ServerErrorCopyWith<$Res> {
  factory _$ServerErrorCopyWith(
          _ServerError value, $Res Function(_ServerError) then) =
      __$ServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$ServerErrorCopyWithImpl<$Res> extends _$MyTeamFailureCopyWithImpl<$Res>
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
    return 'MyTeamFailure.serverError()';
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
    required TResult Function() serverError,
    required TResult Function() localDBError,
    required TResult Function() authError,
    required TResult Function() networkError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? localDBError,
    TResult Function()? authError,
    TResult Function()? networkError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? localDBError,
    TResult Function()? authError,
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
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_LocalDBError value) localDBError,
    required TResult Function(_AuthError value) authError,
    required TResult Function(_NetworkError value) networkError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_LocalDBError value)? localDBError,
    TResult Function(_AuthError value)? authError,
    TResult Function(_NetworkError value)? networkError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_LocalDBError value)? localDBError,
    TResult Function(_AuthError value)? authError,
    TResult Function(_NetworkError value)? networkError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError implements MyTeamFailure {
  const factory _ServerError() = _$_ServerError;
}

/// @nodoc
abstract class _$LocalDBErrorCopyWith<$Res> {
  factory _$LocalDBErrorCopyWith(
          _LocalDBError value, $Res Function(_LocalDBError) then) =
      __$LocalDBErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$LocalDBErrorCopyWithImpl<$Res>
    extends _$MyTeamFailureCopyWithImpl<$Res>
    implements _$LocalDBErrorCopyWith<$Res> {
  __$LocalDBErrorCopyWithImpl(
      _LocalDBError _value, $Res Function(_LocalDBError) _then)
      : super(_value, (v) => _then(v as _LocalDBError));

  @override
  _LocalDBError get _value => super._value as _LocalDBError;
}

/// @nodoc

class _$_LocalDBError implements _LocalDBError {
  const _$_LocalDBError();

  @override
  String toString() {
    return 'MyTeamFailure.localDBError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LocalDBError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() localDBError,
    required TResult Function() authError,
    required TResult Function() networkError,
  }) {
    return localDBError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? localDBError,
    TResult Function()? authError,
    TResult Function()? networkError,
  }) {
    return localDBError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? localDBError,
    TResult Function()? authError,
    TResult Function()? networkError,
    required TResult orElse(),
  }) {
    if (localDBError != null) {
      return localDBError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_LocalDBError value) localDBError,
    required TResult Function(_AuthError value) authError,
    required TResult Function(_NetworkError value) networkError,
  }) {
    return localDBError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_LocalDBError value)? localDBError,
    TResult Function(_AuthError value)? authError,
    TResult Function(_NetworkError value)? networkError,
  }) {
    return localDBError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_LocalDBError value)? localDBError,
    TResult Function(_AuthError value)? authError,
    TResult Function(_NetworkError value)? networkError,
    required TResult orElse(),
  }) {
    if (localDBError != null) {
      return localDBError(this);
    }
    return orElse();
  }
}

abstract class _LocalDBError implements MyTeamFailure {
  const factory _LocalDBError() = _$_LocalDBError;
}

/// @nodoc
abstract class _$AuthErrorCopyWith<$Res> {
  factory _$AuthErrorCopyWith(
          _AuthError value, $Res Function(_AuthError) then) =
      __$AuthErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$AuthErrorCopyWithImpl<$Res> extends _$MyTeamFailureCopyWithImpl<$Res>
    implements _$AuthErrorCopyWith<$Res> {
  __$AuthErrorCopyWithImpl(_AuthError _value, $Res Function(_AuthError) _then)
      : super(_value, (v) => _then(v as _AuthError));

  @override
  _AuthError get _value => super._value as _AuthError;
}

/// @nodoc

class _$_AuthError implements _AuthError {
  const _$_AuthError();

  @override
  String toString() {
    return 'MyTeamFailure.authError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AuthError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() localDBError,
    required TResult Function() authError,
    required TResult Function() networkError,
  }) {
    return authError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? localDBError,
    TResult Function()? authError,
    TResult Function()? networkError,
  }) {
    return authError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? localDBError,
    TResult Function()? authError,
    TResult Function()? networkError,
    required TResult orElse(),
  }) {
    if (authError != null) {
      return authError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_LocalDBError value) localDBError,
    required TResult Function(_AuthError value) authError,
    required TResult Function(_NetworkError value) networkError,
  }) {
    return authError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_LocalDBError value)? localDBError,
    TResult Function(_AuthError value)? authError,
    TResult Function(_NetworkError value)? networkError,
  }) {
    return authError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_LocalDBError value)? localDBError,
    TResult Function(_AuthError value)? authError,
    TResult Function(_NetworkError value)? networkError,
    required TResult orElse(),
  }) {
    if (authError != null) {
      return authError(this);
    }
    return orElse();
  }
}

abstract class _AuthError implements MyTeamFailure {
  const factory _AuthError() = _$_AuthError;
}

/// @nodoc
abstract class _$NetworkErrorCopyWith<$Res> {
  factory _$NetworkErrorCopyWith(
          _NetworkError value, $Res Function(_NetworkError) then) =
      __$NetworkErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$NetworkErrorCopyWithImpl<$Res>
    extends _$MyTeamFailureCopyWithImpl<$Res>
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
    return 'MyTeamFailure.networkError()';
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
    required TResult Function() serverError,
    required TResult Function() localDBError,
    required TResult Function() authError,
    required TResult Function() networkError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? localDBError,
    TResult Function()? authError,
    TResult Function()? networkError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? localDBError,
    TResult Function()? authError,
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
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_LocalDBError value) localDBError,
    required TResult Function(_AuthError value) authError,
    required TResult Function(_NetworkError value) networkError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_LocalDBError value)? localDBError,
    TResult Function(_AuthError value)? authError,
    TResult Function(_NetworkError value)? networkError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_LocalDBError value)? localDBError,
    TResult Function(_AuthError value)? authError,
    TResult Function(_NetworkError value)? networkError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class _NetworkError implements MyTeamFailure {
  const factory _NetworkError() = _$_NetworkError;
}
