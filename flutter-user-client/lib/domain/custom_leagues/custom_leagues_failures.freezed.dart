// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'custom_leagues_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ClassicLeagueFailuresTearOff {
  const _$ClassicLeagueFailuresTearOff();

  InvalidLeagueCode<T> invalidLeagueId<T>({required String leagueCode}) {
    return InvalidLeagueCode<T>(
      leagueCode: leagueCode,
    );
  }

  NetworkError<T> networkError<T>() {
    return NetworkError<T>();
  }

  ServerError<T> serverError<T>() {
    return ServerError<T>();
  }
}

/// @nodoc
const $ClassicLeagueFailures = _$ClassicLeagueFailuresTearOff();

/// @nodoc
mixin _$ClassicLeagueFailures<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String leagueCode) invalidLeagueId,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String leagueCode)? invalidLeagueId,
    TResult Function()? networkError,
    TResult Function()? serverError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String leagueCode)? invalidLeagueId,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidLeagueCode<T> value) invalidLeagueId,
    required TResult Function(NetworkError<T> value) networkError,
    required TResult Function(ServerError<T> value) serverError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidLeagueCode<T> value)? invalidLeagueId,
    TResult Function(NetworkError<T> value)? networkError,
    TResult Function(ServerError<T> value)? serverError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidLeagueCode<T> value)? invalidLeagueId,
    TResult Function(NetworkError<T> value)? networkError,
    TResult Function(ServerError<T> value)? serverError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassicLeagueFailuresCopyWith<T, $Res> {
  factory $ClassicLeagueFailuresCopyWith(ClassicLeagueFailures<T> value,
          $Res Function(ClassicLeagueFailures<T>) then) =
      _$ClassicLeagueFailuresCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$ClassicLeagueFailuresCopyWithImpl<T, $Res>
    implements $ClassicLeagueFailuresCopyWith<T, $Res> {
  _$ClassicLeagueFailuresCopyWithImpl(this._value, this._then);

  final ClassicLeagueFailures<T> _value;
  // ignore: unused_field
  final $Res Function(ClassicLeagueFailures<T>) _then;
}

/// @nodoc
abstract class $InvalidLeagueCodeCopyWith<T, $Res> {
  factory $InvalidLeagueCodeCopyWith(InvalidLeagueCode<T> value,
          $Res Function(InvalidLeagueCode<T>) then) =
      _$InvalidLeagueCodeCopyWithImpl<T, $Res>;
  $Res call({String leagueCode});
}

/// @nodoc
class _$InvalidLeagueCodeCopyWithImpl<T, $Res>
    extends _$ClassicLeagueFailuresCopyWithImpl<T, $Res>
    implements $InvalidLeagueCodeCopyWith<T, $Res> {
  _$InvalidLeagueCodeCopyWithImpl(
      InvalidLeagueCode<T> _value, $Res Function(InvalidLeagueCode<T>) _then)
      : super(_value, (v) => _then(v as InvalidLeagueCode<T>));

  @override
  InvalidLeagueCode<T> get _value => super._value as InvalidLeagueCode<T>;

  @override
  $Res call({
    Object? leagueCode = freezed,
  }) {
    return _then(InvalidLeagueCode<T>(
      leagueCode: leagueCode == freezed
          ? _value.leagueCode
          : leagueCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidLeagueCode<T> implements InvalidLeagueCode<T> {
  const _$InvalidLeagueCode({required this.leagueCode});

  @override
  final String leagueCode;

  @override
  String toString() {
    return 'ClassicLeagueFailures<$T>.invalidLeagueId(leagueCode: $leagueCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvalidLeagueCode<T> &&
            const DeepCollectionEquality()
                .equals(other.leagueCode, leagueCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(leagueCode));

  @JsonKey(ignore: true)
  @override
  $InvalidLeagueCodeCopyWith<T, InvalidLeagueCode<T>> get copyWith =>
      _$InvalidLeagueCodeCopyWithImpl<T, InvalidLeagueCode<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String leagueCode) invalidLeagueId,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return invalidLeagueId(leagueCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String leagueCode)? invalidLeagueId,
    TResult Function()? networkError,
    TResult Function()? serverError,
  }) {
    return invalidLeagueId?.call(leagueCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String leagueCode)? invalidLeagueId,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) {
    if (invalidLeagueId != null) {
      return invalidLeagueId(leagueCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidLeagueCode<T> value) invalidLeagueId,
    required TResult Function(NetworkError<T> value) networkError,
    required TResult Function(ServerError<T> value) serverError,
  }) {
    return invalidLeagueId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidLeagueCode<T> value)? invalidLeagueId,
    TResult Function(NetworkError<T> value)? networkError,
    TResult Function(ServerError<T> value)? serverError,
  }) {
    return invalidLeagueId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidLeagueCode<T> value)? invalidLeagueId,
    TResult Function(NetworkError<T> value)? networkError,
    TResult Function(ServerError<T> value)? serverError,
    required TResult orElse(),
  }) {
    if (invalidLeagueId != null) {
      return invalidLeagueId(this);
    }
    return orElse();
  }
}

abstract class InvalidLeagueCode<T> implements ClassicLeagueFailures<T> {
  const factory InvalidLeagueCode({required String leagueCode}) =
      _$InvalidLeagueCode<T>;

  String get leagueCode;
  @JsonKey(ignore: true)
  $InvalidLeagueCodeCopyWith<T, InvalidLeagueCode<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkErrorCopyWith<T, $Res> {
  factory $NetworkErrorCopyWith(
          NetworkError<T> value, $Res Function(NetworkError<T>) then) =
      _$NetworkErrorCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$NetworkErrorCopyWithImpl<T, $Res>
    extends _$ClassicLeagueFailuresCopyWithImpl<T, $Res>
    implements $NetworkErrorCopyWith<T, $Res> {
  _$NetworkErrorCopyWithImpl(
      NetworkError<T> _value, $Res Function(NetworkError<T>) _then)
      : super(_value, (v) => _then(v as NetworkError<T>));

  @override
  NetworkError<T> get _value => super._value as NetworkError<T>;
}

/// @nodoc

class _$NetworkError<T> implements NetworkError<T> {
  const _$NetworkError();

  @override
  String toString() {
    return 'ClassicLeagueFailures<$T>.networkError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NetworkError<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String leagueCode) invalidLeagueId,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String leagueCode)? invalidLeagueId,
    TResult Function()? networkError,
    TResult Function()? serverError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String leagueCode)? invalidLeagueId,
    TResult Function()? networkError,
    TResult Function()? serverError,
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
    required TResult Function(InvalidLeagueCode<T> value) invalidLeagueId,
    required TResult Function(NetworkError<T> value) networkError,
    required TResult Function(ServerError<T> value) serverError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidLeagueCode<T> value)? invalidLeagueId,
    TResult Function(NetworkError<T> value)? networkError,
    TResult Function(ServerError<T> value)? serverError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidLeagueCode<T> value)? invalidLeagueId,
    TResult Function(NetworkError<T> value)? networkError,
    TResult Function(ServerError<T> value)? serverError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class NetworkError<T> implements ClassicLeagueFailures<T> {
  const factory NetworkError() = _$NetworkError<T>;
}

/// @nodoc
abstract class $ServerErrorCopyWith<T, $Res> {
  factory $ServerErrorCopyWith(
          ServerError<T> value, $Res Function(ServerError<T>) then) =
      _$ServerErrorCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$ServerErrorCopyWithImpl<T, $Res>
    extends _$ClassicLeagueFailuresCopyWithImpl<T, $Res>
    implements $ServerErrorCopyWith<T, $Res> {
  _$ServerErrorCopyWithImpl(
      ServerError<T> _value, $Res Function(ServerError<T>) _then)
      : super(_value, (v) => _then(v as ServerError<T>));

  @override
  ServerError<T> get _value => super._value as ServerError<T>;
}

/// @nodoc

class _$ServerError<T> implements ServerError<T> {
  const _$ServerError();

  @override
  String toString() {
    return 'ClassicLeagueFailures<$T>.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ServerError<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String leagueCode) invalidLeagueId,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String leagueCode)? invalidLeagueId,
    TResult Function()? networkError,
    TResult Function()? serverError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String leagueCode)? invalidLeagueId,
    TResult Function()? networkError,
    TResult Function()? serverError,
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
    required TResult Function(InvalidLeagueCode<T> value) invalidLeagueId,
    required TResult Function(NetworkError<T> value) networkError,
    required TResult Function(ServerError<T> value) serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidLeagueCode<T> value)? invalidLeagueId,
    TResult Function(NetworkError<T> value)? networkError,
    TResult Function(ServerError<T> value)? serverError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidLeagueCode<T> value)? invalidLeagueId,
    TResult Function(NetworkError<T> value)? networkError,
    TResult Function(ServerError<T> value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError<T> implements ClassicLeagueFailures<T> {
  const factory ServerError() = _$ServerError<T>;
}
