// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
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

  NoConnection<T> noConnection<T>({required T failedValue}) {
    return NoConnection<T>(
      failedValue: failedValue,
    );
  }

  Unauthenticated<T> unauthenticated<T>({required T failedValue}) {
    return Unauthenticated<T>(
      failedValue: failedValue,
    );
  }

  Unauthorized<T> unauthorized<T>({required T failedValue}) {
    return Unauthorized<T>(
      failedValue: failedValue,
    );
  }
}

/// @nodoc
const $HTTPFailures = _$HTTPFailuresTearOff();

/// @nodoc
mixin _$HTTPFailures<T> {
  T get failedValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) noConnection,
    required TResult Function(T failedValue) unauthenticated,
    required TResult Function(T failedValue) unauthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue)? noConnection,
    TResult Function(T failedValue)? unauthenticated,
    TResult Function(T failedValue)? unauthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? noConnection,
    TResult Function(T failedValue)? unauthenticated,
    TResult Function(T failedValue)? unauthorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoConnection<T> value) noConnection,
    required TResult Function(Unauthenticated<T> value) unauthenticated,
    required TResult Function(Unauthorized<T> value) unauthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(Unauthenticated<T> value)? unauthenticated,
    TResult Function(Unauthorized<T> value)? unauthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(Unauthenticated<T> value)? unauthenticated,
    TResult Function(Unauthorized<T> value)? unauthorized,
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
  $Res call({T failedValue});
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
              as T,
    ));
  }
}

/// @nodoc
abstract class $NoConnectionCopyWith<T, $Res>
    implements $HTTPFailuresCopyWith<T, $Res> {
  factory $NoConnectionCopyWith(
          NoConnection<T> value, $Res Function(NoConnection<T>) then) =
      _$NoConnectionCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
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
              as T,
    ));
  }
}

/// @nodoc

class _$NoConnection<T> implements NoConnection<T> {
  const _$NoConnection({required this.failedValue});

  @override
  final T failedValue;

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
    required TResult Function(T failedValue) noConnection,
    required TResult Function(T failedValue) unauthenticated,
    required TResult Function(T failedValue) unauthorized,
  }) {
    return noConnection(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue)? noConnection,
    TResult Function(T failedValue)? unauthenticated,
    TResult Function(T failedValue)? unauthorized,
  }) {
    return noConnection?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? noConnection,
    TResult Function(T failedValue)? unauthenticated,
    TResult Function(T failedValue)? unauthorized,
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
    required TResult Function(Unauthenticated<T> value) unauthenticated,
    required TResult Function(Unauthorized<T> value) unauthorized,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(Unauthenticated<T> value)? unauthenticated,
    TResult Function(Unauthorized<T> value)? unauthorized,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(Unauthenticated<T> value)? unauthenticated,
    TResult Function(Unauthorized<T> value)? unauthorized,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class NoConnection<T> implements HTTPFailures<T> {
  const factory NoConnection({required T failedValue}) = _$NoConnection<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  $NoConnectionCopyWith<T, NoConnection<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnauthenticatedCopyWith<T, $Res>
    implements $HTTPFailuresCopyWith<T, $Res> {
  factory $UnauthenticatedCopyWith(
          Unauthenticated<T> value, $Res Function(Unauthenticated<T>) then) =
      _$UnauthenticatedCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
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
              as T,
    ));
  }
}

/// @nodoc

class _$Unauthenticated<T> implements Unauthenticated<T> {
  const _$Unauthenticated({required this.failedValue});

  @override
  final T failedValue;

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
    required TResult Function(T failedValue) noConnection,
    required TResult Function(T failedValue) unauthenticated,
    required TResult Function(T failedValue) unauthorized,
  }) {
    return unauthenticated(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue)? noConnection,
    TResult Function(T failedValue)? unauthenticated,
    TResult Function(T failedValue)? unauthorized,
  }) {
    return unauthenticated?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? noConnection,
    TResult Function(T failedValue)? unauthenticated,
    TResult Function(T failedValue)? unauthorized,
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
    required TResult Function(NoConnection<T> value) noConnection,
    required TResult Function(Unauthenticated<T> value) unauthenticated,
    required TResult Function(Unauthorized<T> value) unauthorized,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(Unauthenticated<T> value)? unauthenticated,
    TResult Function(Unauthorized<T> value)? unauthorized,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(Unauthenticated<T> value)? unauthenticated,
    TResult Function(Unauthorized<T> value)? unauthorized,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class Unauthenticated<T> implements HTTPFailures<T> {
  const factory Unauthenticated({required T failedValue}) =
      _$Unauthenticated<T>;

  @override
  T get failedValue;
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
  $Res call({T failedValue});
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
              as T,
    ));
  }
}

/// @nodoc

class _$Unauthorized<T> implements Unauthorized<T> {
  const _$Unauthorized({required this.failedValue});

  @override
  final T failedValue;

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
    required TResult Function(T failedValue) noConnection,
    required TResult Function(T failedValue) unauthenticated,
    required TResult Function(T failedValue) unauthorized,
  }) {
    return unauthorized(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue)? noConnection,
    TResult Function(T failedValue)? unauthenticated,
    TResult Function(T failedValue)? unauthorized,
  }) {
    return unauthorized?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? noConnection,
    TResult Function(T failedValue)? unauthenticated,
    TResult Function(T failedValue)? unauthorized,
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
    required TResult Function(NoConnection<T> value) noConnection,
    required TResult Function(Unauthenticated<T> value) unauthenticated,
    required TResult Function(Unauthorized<T> value) unauthorized,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(Unauthenticated<T> value)? unauthenticated,
    TResult Function(Unauthorized<T> value)? unauthorized,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(Unauthenticated<T> value)? unauthenticated,
    TResult Function(Unauthorized<T> value)? unauthorized,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class Unauthorized<T> implements HTTPFailures<T> {
  const factory Unauthorized({required T failedValue}) = _$Unauthorized<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  $UnauthorizedCopyWith<T, Unauthorized<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
