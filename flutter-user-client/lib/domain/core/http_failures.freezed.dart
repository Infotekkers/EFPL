// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'http_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HTTPFailuresTearOff {
  const _$HTTPFailuresTearOff();

  Unauthenticated<T> unauthenticated<T>({required String failedValue}) {
    return Unauthenticated<T>(
      failedValue: failedValue,
    );
  }

  Unauthorized<T> unauthorized<T>({required String failedValue}) {
    return Unauthorized<T>(
      failedValue: failedValue,
    );
  }

  NoConnection<T> noConnection<T>({required String failedValue}) {
    return NoConnection<T>(
      failedValue: failedValue,
    );
  }

  SocketError<T> socketError<T>({required String failedValue}) {
    return SocketError<T>(
      failedValue: failedValue,
    );
  }

  HandShakeError<T> handShakeError<T>({required String failedValue}) {
    return HandShakeError<T>(
      failedValue: failedValue,
    );
  }

  UnexpectedError<T> unexpectedError<T>({required String failedValue}) {
    return UnexpectedError<T>(
      failedValue: failedValue,
    );
  }
}

/// @nodoc
const $HTTPFailures = _$HTTPFailuresTearOff();

/// @nodoc
mixin _$HTTPFailures<T> {
  String get failedValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) unauthenticated,
    required TResult Function(String failedValue) unauthorized,
    required TResult Function(String failedValue) noConnection,
    required TResult Function(String failedValue) socketError,
    required TResult Function(String failedValue) handShakeError,
    required TResult Function(String failedValue) unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? unauthenticated,
    TResult Function(String failedValue)? unauthorized,
    TResult Function(String failedValue)? noConnection,
    TResult Function(String failedValue)? socketError,
    TResult Function(String failedValue)? handShakeError,
    TResult Function(String failedValue)? unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? unauthenticated,
    TResult Function(String failedValue)? unauthorized,
    TResult Function(String failedValue)? noConnection,
    TResult Function(String failedValue)? socketError,
    TResult Function(String failedValue)? handShakeError,
    TResult Function(String failedValue)? unexpectedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unauthenticated<T> value) unauthenticated,
    required TResult Function(Unauthorized<T> value) unauthorized,
    required TResult Function(NoConnection<T> value) noConnection,
    required TResult Function(SocketError<T> value) socketError,
    required TResult Function(HandShakeError<T> value) handShakeError,
    required TResult Function(UnexpectedError<T> value) unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Unauthenticated<T> value)? unauthenticated,
    TResult Function(Unauthorized<T> value)? unauthorized,
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(SocketError<T> value)? socketError,
    TResult Function(HandShakeError<T> value)? handShakeError,
    TResult Function(UnexpectedError<T> value)? unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unauthenticated<T> value)? unauthenticated,
    TResult Function(Unauthorized<T> value)? unauthorized,
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(SocketError<T> value)? socketError,
    TResult Function(HandShakeError<T> value)? handShakeError,
    TResult Function(UnexpectedError<T> value)? unexpectedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HTTPFailuresCopyWith<T, HTTPFailures<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HTTPFailuresCopyWith<T, $Res> {
  factory $HTTPFailuresCopyWith(
          HTTPFailures<T> value, $Res Function(HTTPFailures<T>) then) =
      _$HTTPFailuresCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class _$HTTPFailuresCopyWithImpl<T, $Res>
    implements $HTTPFailuresCopyWith<T, $Res> {
  _$HTTPFailuresCopyWithImpl(this._value, this._then);

  final HTTPFailures<T> _value;
  // ignore: unused_field
  final $Res Function(HTTPFailures<T>) _then;

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
abstract class $UnauthenticatedCopyWith<T, $Res>
    implements $HTTPFailuresCopyWith<T, $Res> {
  factory $UnauthenticatedCopyWith(
          Unauthenticated<T> value, $Res Function(Unauthenticated<T>) then) =
      _$UnauthenticatedCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class _$UnauthenticatedCopyWithImpl<T, $Res>
    extends _$HTTPFailuresCopyWithImpl<T, $Res>
    implements $UnauthenticatedCopyWith<T, $Res> {
  _$UnauthenticatedCopyWithImpl(
      Unauthenticated<T> _value, $Res Function(Unauthenticated<T>) _then)
      : super(_value, (v) => _then(v as Unauthenticated<T>));

  @override
  Unauthenticated<T> get _value => super._value as Unauthenticated<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(Unauthenticated<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Unauthenticated<T> implements Unauthenticated<T> {
  const _$Unauthenticated({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'HTTPFailures<$T>.unauthenticated(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Unauthenticated<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $UnauthenticatedCopyWith<T, Unauthenticated<T>> get copyWith =>
      _$UnauthenticatedCopyWithImpl<T, Unauthenticated<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) unauthenticated,
    required TResult Function(String failedValue) unauthorized,
    required TResult Function(String failedValue) noConnection,
    required TResult Function(String failedValue) socketError,
    required TResult Function(String failedValue) handShakeError,
    required TResult Function(String failedValue) unexpectedError,
  }) {
    return unauthenticated(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? unauthenticated,
    TResult Function(String failedValue)? unauthorized,
    TResult Function(String failedValue)? noConnection,
    TResult Function(String failedValue)? socketError,
    TResult Function(String failedValue)? handShakeError,
    TResult Function(String failedValue)? unexpectedError,
  }) {
    return unauthenticated?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? unauthenticated,
    TResult Function(String failedValue)? unauthorized,
    TResult Function(String failedValue)? noConnection,
    TResult Function(String failedValue)? socketError,
    TResult Function(String failedValue)? handShakeError,
    TResult Function(String failedValue)? unexpectedError,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unauthenticated<T> value) unauthenticated,
    required TResult Function(Unauthorized<T> value) unauthorized,
    required TResult Function(NoConnection<T> value) noConnection,
    required TResult Function(SocketError<T> value) socketError,
    required TResult Function(HandShakeError<T> value) handShakeError,
    required TResult Function(UnexpectedError<T> value) unexpectedError,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Unauthenticated<T> value)? unauthenticated,
    TResult Function(Unauthorized<T> value)? unauthorized,
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(SocketError<T> value)? socketError,
    TResult Function(HandShakeError<T> value)? handShakeError,
    TResult Function(UnexpectedError<T> value)? unexpectedError,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unauthenticated<T> value)? unauthenticated,
    TResult Function(Unauthorized<T> value)? unauthorized,
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(SocketError<T> value)? socketError,
    TResult Function(HandShakeError<T> value)? handShakeError,
    TResult Function(UnexpectedError<T> value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class Unauthenticated<T> implements HTTPFailures<T> {
  const factory Unauthenticated({required String failedValue}) =
      _$Unauthenticated<T>;

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  $UnauthenticatedCopyWith<T, Unauthenticated<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnauthorizedCopyWith<T, $Res>
    implements $HTTPFailuresCopyWith<T, $Res> {
  factory $UnauthorizedCopyWith(
          Unauthorized<T> value, $Res Function(Unauthorized<T>) then) =
      _$UnauthorizedCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class _$UnauthorizedCopyWithImpl<T, $Res>
    extends _$HTTPFailuresCopyWithImpl<T, $Res>
    implements $UnauthorizedCopyWith<T, $Res> {
  _$UnauthorizedCopyWithImpl(
      Unauthorized<T> _value, $Res Function(Unauthorized<T>) _then)
      : super(_value, (v) => _then(v as Unauthorized<T>));

  @override
  Unauthorized<T> get _value => super._value as Unauthorized<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(Unauthorized<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Unauthorized<T> implements Unauthorized<T> {
  const _$Unauthorized({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'HTTPFailures<$T>.unauthorized(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Unauthorized<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $UnauthorizedCopyWith<T, Unauthorized<T>> get copyWith =>
      _$UnauthorizedCopyWithImpl<T, Unauthorized<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) unauthenticated,
    required TResult Function(String failedValue) unauthorized,
    required TResult Function(String failedValue) noConnection,
    required TResult Function(String failedValue) socketError,
    required TResult Function(String failedValue) handShakeError,
    required TResult Function(String failedValue) unexpectedError,
  }) {
    return unauthorized(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? unauthenticated,
    TResult Function(String failedValue)? unauthorized,
    TResult Function(String failedValue)? noConnection,
    TResult Function(String failedValue)? socketError,
    TResult Function(String failedValue)? handShakeError,
    TResult Function(String failedValue)? unexpectedError,
  }) {
    return unauthorized?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? unauthenticated,
    TResult Function(String failedValue)? unauthorized,
    TResult Function(String failedValue)? noConnection,
    TResult Function(String failedValue)? socketError,
    TResult Function(String failedValue)? handShakeError,
    TResult Function(String failedValue)? unexpectedError,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unauthenticated<T> value) unauthenticated,
    required TResult Function(Unauthorized<T> value) unauthorized,
    required TResult Function(NoConnection<T> value) noConnection,
    required TResult Function(SocketError<T> value) socketError,
    required TResult Function(HandShakeError<T> value) handShakeError,
    required TResult Function(UnexpectedError<T> value) unexpectedError,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Unauthenticated<T> value)? unauthenticated,
    TResult Function(Unauthorized<T> value)? unauthorized,
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(SocketError<T> value)? socketError,
    TResult Function(HandShakeError<T> value)? handShakeError,
    TResult Function(UnexpectedError<T> value)? unexpectedError,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unauthenticated<T> value)? unauthenticated,
    TResult Function(Unauthorized<T> value)? unauthorized,
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(SocketError<T> value)? socketError,
    TResult Function(HandShakeError<T> value)? handShakeError,
    TResult Function(UnexpectedError<T> value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class Unauthorized<T> implements HTTPFailures<T> {
  const factory Unauthorized({required String failedValue}) = _$Unauthorized<T>;

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  $UnauthorizedCopyWith<T, Unauthorized<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoConnectionCopyWith<T, $Res>
    implements $HTTPFailuresCopyWith<T, $Res> {
  factory $NoConnectionCopyWith(
          NoConnection<T> value, $Res Function(NoConnection<T>) then) =
      _$NoConnectionCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class _$NoConnectionCopyWithImpl<T, $Res>
    extends _$HTTPFailuresCopyWithImpl<T, $Res>
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
    return 'HTTPFailures<$T>.noConnection(failedValue: $failedValue)';
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
    required TResult Function(String failedValue) unauthenticated,
    required TResult Function(String failedValue) unauthorized,
    required TResult Function(String failedValue) noConnection,
    required TResult Function(String failedValue) socketError,
    required TResult Function(String failedValue) handShakeError,
    required TResult Function(String failedValue) unexpectedError,
  }) {
    return noConnection(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? unauthenticated,
    TResult Function(String failedValue)? unauthorized,
    TResult Function(String failedValue)? noConnection,
    TResult Function(String failedValue)? socketError,
    TResult Function(String failedValue)? handShakeError,
    TResult Function(String failedValue)? unexpectedError,
  }) {
    return noConnection?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? unauthenticated,
    TResult Function(String failedValue)? unauthorized,
    TResult Function(String failedValue)? noConnection,
    TResult Function(String failedValue)? socketError,
    TResult Function(String failedValue)? handShakeError,
    TResult Function(String failedValue)? unexpectedError,
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
    required TResult Function(Unauthenticated<T> value) unauthenticated,
    required TResult Function(Unauthorized<T> value) unauthorized,
    required TResult Function(NoConnection<T> value) noConnection,
    required TResult Function(SocketError<T> value) socketError,
    required TResult Function(HandShakeError<T> value) handShakeError,
    required TResult Function(UnexpectedError<T> value) unexpectedError,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Unauthenticated<T> value)? unauthenticated,
    TResult Function(Unauthorized<T> value)? unauthorized,
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(SocketError<T> value)? socketError,
    TResult Function(HandShakeError<T> value)? handShakeError,
    TResult Function(UnexpectedError<T> value)? unexpectedError,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unauthenticated<T> value)? unauthenticated,
    TResult Function(Unauthorized<T> value)? unauthorized,
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(SocketError<T> value)? socketError,
    TResult Function(HandShakeError<T> value)? handShakeError,
    TResult Function(UnexpectedError<T> value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class NoConnection<T> implements HTTPFailures<T> {
  const factory NoConnection({required String failedValue}) = _$NoConnection<T>;

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  $NoConnectionCopyWith<T, NoConnection<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocketErrorCopyWith<T, $Res>
    implements $HTTPFailuresCopyWith<T, $Res> {
  factory $SocketErrorCopyWith(
          SocketError<T> value, $Res Function(SocketError<T>) then) =
      _$SocketErrorCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class _$SocketErrorCopyWithImpl<T, $Res>
    extends _$HTTPFailuresCopyWithImpl<T, $Res>
    implements $SocketErrorCopyWith<T, $Res> {
  _$SocketErrorCopyWithImpl(
      SocketError<T> _value, $Res Function(SocketError<T>) _then)
      : super(_value, (v) => _then(v as SocketError<T>));

  @override
  SocketError<T> get _value => super._value as SocketError<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(SocketError<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SocketError<T> implements SocketError<T> {
  const _$SocketError({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'HTTPFailures<$T>.socketError(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SocketError<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $SocketErrorCopyWith<T, SocketError<T>> get copyWith =>
      _$SocketErrorCopyWithImpl<T, SocketError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) unauthenticated,
    required TResult Function(String failedValue) unauthorized,
    required TResult Function(String failedValue) noConnection,
    required TResult Function(String failedValue) socketError,
    required TResult Function(String failedValue) handShakeError,
    required TResult Function(String failedValue) unexpectedError,
  }) {
    return socketError(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? unauthenticated,
    TResult Function(String failedValue)? unauthorized,
    TResult Function(String failedValue)? noConnection,
    TResult Function(String failedValue)? socketError,
    TResult Function(String failedValue)? handShakeError,
    TResult Function(String failedValue)? unexpectedError,
  }) {
    return socketError?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? unauthenticated,
    TResult Function(String failedValue)? unauthorized,
    TResult Function(String failedValue)? noConnection,
    TResult Function(String failedValue)? socketError,
    TResult Function(String failedValue)? handShakeError,
    TResult Function(String failedValue)? unexpectedError,
    required TResult orElse(),
  }) {
    if (socketError != null) {
      return socketError(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unauthenticated<T> value) unauthenticated,
    required TResult Function(Unauthorized<T> value) unauthorized,
    required TResult Function(NoConnection<T> value) noConnection,
    required TResult Function(SocketError<T> value) socketError,
    required TResult Function(HandShakeError<T> value) handShakeError,
    required TResult Function(UnexpectedError<T> value) unexpectedError,
  }) {
    return socketError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Unauthenticated<T> value)? unauthenticated,
    TResult Function(Unauthorized<T> value)? unauthorized,
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(SocketError<T> value)? socketError,
    TResult Function(HandShakeError<T> value)? handShakeError,
    TResult Function(UnexpectedError<T> value)? unexpectedError,
  }) {
    return socketError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unauthenticated<T> value)? unauthenticated,
    TResult Function(Unauthorized<T> value)? unauthorized,
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(SocketError<T> value)? socketError,
    TResult Function(HandShakeError<T> value)? handShakeError,
    TResult Function(UnexpectedError<T> value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (socketError != null) {
      return socketError(this);
    }
    return orElse();
  }
}

abstract class SocketError<T> implements HTTPFailures<T> {
  const factory SocketError({required String failedValue}) = _$SocketError<T>;

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  $SocketErrorCopyWith<T, SocketError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HandShakeErrorCopyWith<T, $Res>
    implements $HTTPFailuresCopyWith<T, $Res> {
  factory $HandShakeErrorCopyWith(
          HandShakeError<T> value, $Res Function(HandShakeError<T>) then) =
      _$HandShakeErrorCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class _$HandShakeErrorCopyWithImpl<T, $Res>
    extends _$HTTPFailuresCopyWithImpl<T, $Res>
    implements $HandShakeErrorCopyWith<T, $Res> {
  _$HandShakeErrorCopyWithImpl(
      HandShakeError<T> _value, $Res Function(HandShakeError<T>) _then)
      : super(_value, (v) => _then(v as HandShakeError<T>));

  @override
  HandShakeError<T> get _value => super._value as HandShakeError<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(HandShakeError<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HandShakeError<T> implements HandShakeError<T> {
  const _$HandShakeError({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'HTTPFailures<$T>.handShakeError(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HandShakeError<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $HandShakeErrorCopyWith<T, HandShakeError<T>> get copyWith =>
      _$HandShakeErrorCopyWithImpl<T, HandShakeError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) unauthenticated,
    required TResult Function(String failedValue) unauthorized,
    required TResult Function(String failedValue) noConnection,
    required TResult Function(String failedValue) socketError,
    required TResult Function(String failedValue) handShakeError,
    required TResult Function(String failedValue) unexpectedError,
  }) {
    return handShakeError(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? unauthenticated,
    TResult Function(String failedValue)? unauthorized,
    TResult Function(String failedValue)? noConnection,
    TResult Function(String failedValue)? socketError,
    TResult Function(String failedValue)? handShakeError,
    TResult Function(String failedValue)? unexpectedError,
  }) {
    return handShakeError?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? unauthenticated,
    TResult Function(String failedValue)? unauthorized,
    TResult Function(String failedValue)? noConnection,
    TResult Function(String failedValue)? socketError,
    TResult Function(String failedValue)? handShakeError,
    TResult Function(String failedValue)? unexpectedError,
    required TResult orElse(),
  }) {
    if (handShakeError != null) {
      return handShakeError(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unauthenticated<T> value) unauthenticated,
    required TResult Function(Unauthorized<T> value) unauthorized,
    required TResult Function(NoConnection<T> value) noConnection,
    required TResult Function(SocketError<T> value) socketError,
    required TResult Function(HandShakeError<T> value) handShakeError,
    required TResult Function(UnexpectedError<T> value) unexpectedError,
  }) {
    return handShakeError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Unauthenticated<T> value)? unauthenticated,
    TResult Function(Unauthorized<T> value)? unauthorized,
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(SocketError<T> value)? socketError,
    TResult Function(HandShakeError<T> value)? handShakeError,
    TResult Function(UnexpectedError<T> value)? unexpectedError,
  }) {
    return handShakeError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unauthenticated<T> value)? unauthenticated,
    TResult Function(Unauthorized<T> value)? unauthorized,
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(SocketError<T> value)? socketError,
    TResult Function(HandShakeError<T> value)? handShakeError,
    TResult Function(UnexpectedError<T> value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (handShakeError != null) {
      return handShakeError(this);
    }
    return orElse();
  }
}

abstract class HandShakeError<T> implements HTTPFailures<T> {
  const factory HandShakeError({required String failedValue}) =
      _$HandShakeError<T>;

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  $HandShakeErrorCopyWith<T, HandShakeError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnexpectedErrorCopyWith<T, $Res>
    implements $HTTPFailuresCopyWith<T, $Res> {
  factory $UnexpectedErrorCopyWith(
          UnexpectedError<T> value, $Res Function(UnexpectedError<T>) then) =
      _$UnexpectedErrorCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class _$UnexpectedErrorCopyWithImpl<T, $Res>
    extends _$HTTPFailuresCopyWithImpl<T, $Res>
    implements $UnexpectedErrorCopyWith<T, $Res> {
  _$UnexpectedErrorCopyWithImpl(
      UnexpectedError<T> _value, $Res Function(UnexpectedError<T>) _then)
      : super(_value, (v) => _then(v as UnexpectedError<T>));

  @override
  UnexpectedError<T> get _value => super._value as UnexpectedError<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(UnexpectedError<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnexpectedError<T> implements UnexpectedError<T> {
  const _$UnexpectedError({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'HTTPFailures<$T>.unexpectedError(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnexpectedError<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $UnexpectedErrorCopyWith<T, UnexpectedError<T>> get copyWith =>
      _$UnexpectedErrorCopyWithImpl<T, UnexpectedError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) unauthenticated,
    required TResult Function(String failedValue) unauthorized,
    required TResult Function(String failedValue) noConnection,
    required TResult Function(String failedValue) socketError,
    required TResult Function(String failedValue) handShakeError,
    required TResult Function(String failedValue) unexpectedError,
  }) {
    return unexpectedError(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? unauthenticated,
    TResult Function(String failedValue)? unauthorized,
    TResult Function(String failedValue)? noConnection,
    TResult Function(String failedValue)? socketError,
    TResult Function(String failedValue)? handShakeError,
    TResult Function(String failedValue)? unexpectedError,
  }) {
    return unexpectedError?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? unauthenticated,
    TResult Function(String failedValue)? unauthorized,
    TResult Function(String failedValue)? noConnection,
    TResult Function(String failedValue)? socketError,
    TResult Function(String failedValue)? handShakeError,
    TResult Function(String failedValue)? unexpectedError,
    required TResult orElse(),
  }) {
    if (unexpectedError != null) {
      return unexpectedError(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unauthenticated<T> value) unauthenticated,
    required TResult Function(Unauthorized<T> value) unauthorized,
    required TResult Function(NoConnection<T> value) noConnection,
    required TResult Function(SocketError<T> value) socketError,
    required TResult Function(HandShakeError<T> value) handShakeError,
    required TResult Function(UnexpectedError<T> value) unexpectedError,
  }) {
    return unexpectedError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Unauthenticated<T> value)? unauthenticated,
    TResult Function(Unauthorized<T> value)? unauthorized,
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(SocketError<T> value)? socketError,
    TResult Function(HandShakeError<T> value)? handShakeError,
    TResult Function(UnexpectedError<T> value)? unexpectedError,
  }) {
    return unexpectedError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unauthenticated<T> value)? unauthenticated,
    TResult Function(Unauthorized<T> value)? unauthorized,
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(SocketError<T> value)? socketError,
    TResult Function(HandShakeError<T> value)? handShakeError,
    TResult Function(UnexpectedError<T> value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (unexpectedError != null) {
      return unexpectedError(this);
    }
    return orElse();
  }
}

abstract class UnexpectedError<T> implements HTTPFailures<T> {
  const factory UnexpectedError({required String failedValue}) =
      _$UnexpectedError<T>;

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  $UnexpectedErrorCopyWith<T, UnexpectedError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
