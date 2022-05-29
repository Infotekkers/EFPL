// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authorisation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthorisationEventTearOff {
  const _$AuthorisationEventTearOff();

  AuthorisationCheckRequested authorisationCheckRequested({String token = ""}) {
    return AuthorisationCheckRequested(
      token: token,
    );
  }
}

/// @nodoc
const $AuthorisationEvent = _$AuthorisationEventTearOff();

/// @nodoc
mixin _$AuthorisationEvent {
  String get token => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String token) authorisationCheckRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String token)? authorisationCheckRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String token)? authorisationCheckRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthorisationCheckRequested value)
        authorisationCheckRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthorisationCheckRequested value)?
        authorisationCheckRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthorisationCheckRequested value)?
        authorisationCheckRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthorisationEventCopyWith<AuthorisationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorisationEventCopyWith<$Res> {
  factory $AuthorisationEventCopyWith(
          AuthorisationEvent value, $Res Function(AuthorisationEvent) then) =
      _$AuthorisationEventCopyWithImpl<$Res>;
  $Res call({String token});
}

/// @nodoc
class _$AuthorisationEventCopyWithImpl<$Res>
    implements $AuthorisationEventCopyWith<$Res> {
  _$AuthorisationEventCopyWithImpl(this._value, this._then);

  final AuthorisationEvent _value;
  // ignore: unused_field
  final $Res Function(AuthorisationEvent) _then;

  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $AuthorisationCheckRequestedCopyWith<$Res>
    implements $AuthorisationEventCopyWith<$Res> {
  factory $AuthorisationCheckRequestedCopyWith(
          AuthorisationCheckRequested value,
          $Res Function(AuthorisationCheckRequested) then) =
      _$AuthorisationCheckRequestedCopyWithImpl<$Res>;
  @override
  $Res call({String token});
}

/// @nodoc
class _$AuthorisationCheckRequestedCopyWithImpl<$Res>
    extends _$AuthorisationEventCopyWithImpl<$Res>
    implements $AuthorisationCheckRequestedCopyWith<$Res> {
  _$AuthorisationCheckRequestedCopyWithImpl(AuthorisationCheckRequested _value,
      $Res Function(AuthorisationCheckRequested) _then)
      : super(_value, (v) => _then(v as AuthorisationCheckRequested));

  @override
  AuthorisationCheckRequested get _value =>
      super._value as AuthorisationCheckRequested;

  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(AuthorisationCheckRequested(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthorisationCheckRequested implements AuthorisationCheckRequested {
  const _$AuthorisationCheckRequested({this.token = ""});

  @JsonKey()
  @override
  final String token;

  @override
  String toString() {
    return 'AuthorisationEvent.authorisationCheckRequested(token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthorisationCheckRequested &&
            const DeepCollectionEquality().equals(other.token, token));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(token));

  @JsonKey(ignore: true)
  @override
  $AuthorisationCheckRequestedCopyWith<AuthorisationCheckRequested>
      get copyWith => _$AuthorisationCheckRequestedCopyWithImpl<
          AuthorisationCheckRequested>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String token) authorisationCheckRequested,
  }) {
    return authorisationCheckRequested(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String token)? authorisationCheckRequested,
  }) {
    return authorisationCheckRequested?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String token)? authorisationCheckRequested,
    required TResult orElse(),
  }) {
    if (authorisationCheckRequested != null) {
      return authorisationCheckRequested(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthorisationCheckRequested value)
        authorisationCheckRequested,
  }) {
    return authorisationCheckRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthorisationCheckRequested value)?
        authorisationCheckRequested,
  }) {
    return authorisationCheckRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthorisationCheckRequested value)?
        authorisationCheckRequested,
    required TResult orElse(),
  }) {
    if (authorisationCheckRequested != null) {
      return authorisationCheckRequested(this);
    }
    return orElse();
  }
}

abstract class AuthorisationCheckRequested implements AuthorisationEvent {
  const factory AuthorisationCheckRequested({String token}) =
      _$AuthorisationCheckRequested;

  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  $AuthorisationCheckRequestedCopyWith<AuthorisationCheckRequested>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$AuthorisationStateTearOff {
  const _$AuthorisationStateTearOff();

  Initial initial() {
    return const Initial();
  }

  Authorised authorised() {
    return const Authorised();
  }

  Unautorised unauthorised() {
    return const Unautorised();
  }
}

/// @nodoc
const $AuthorisationState = _$AuthorisationStateTearOff();

/// @nodoc
mixin _$AuthorisationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authorised,
    required TResult Function() unauthorised,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorised,
    TResult Function()? unauthorised,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorised,
    TResult Function()? unauthorised,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Authorised value) authorised,
    required TResult Function(Unautorised value) unauthorised,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Authorised value)? authorised,
    TResult Function(Unautorised value)? unauthorised,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Authorised value)? authorised,
    TResult Function(Unautorised value)? unauthorised,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorisationStateCopyWith<$Res> {
  factory $AuthorisationStateCopyWith(
          AuthorisationState value, $Res Function(AuthorisationState) then) =
      _$AuthorisationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthorisationStateCopyWithImpl<$Res>
    implements $AuthorisationStateCopyWith<$Res> {
  _$AuthorisationStateCopyWithImpl(this._value, this._then);

  final AuthorisationState _value;
  // ignore: unused_field
  final $Res Function(AuthorisationState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$AuthorisationStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'AuthorisationState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authorised,
    required TResult Function() unauthorised,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorised,
    TResult Function()? unauthorised,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorised,
    TResult Function()? unauthorised,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Authorised value) authorised,
    required TResult Function(Unautorised value) unauthorised,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Authorised value)? authorised,
    TResult Function(Unautorised value)? unauthorised,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Authorised value)? authorised,
    TResult Function(Unautorised value)? unauthorised,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements AuthorisationState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $AuthorisedCopyWith<$Res> {
  factory $AuthorisedCopyWith(
          Authorised value, $Res Function(Authorised) then) =
      _$AuthorisedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthorisedCopyWithImpl<$Res>
    extends _$AuthorisationStateCopyWithImpl<$Res>
    implements $AuthorisedCopyWith<$Res> {
  _$AuthorisedCopyWithImpl(Authorised _value, $Res Function(Authorised) _then)
      : super(_value, (v) => _then(v as Authorised));

  @override
  Authorised get _value => super._value as Authorised;
}

/// @nodoc

class _$Authorised implements Authorised {
  const _$Authorised();

  @override
  String toString() {
    return 'AuthorisationState.authorised()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Authorised);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authorised,
    required TResult Function() unauthorised,
  }) {
    return authorised();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorised,
    TResult Function()? unauthorised,
  }) {
    return authorised?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorised,
    TResult Function()? unauthorised,
    required TResult orElse(),
  }) {
    if (authorised != null) {
      return authorised();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Authorised value) authorised,
    required TResult Function(Unautorised value) unauthorised,
  }) {
    return authorised(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Authorised value)? authorised,
    TResult Function(Unautorised value)? unauthorised,
  }) {
    return authorised?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Authorised value)? authorised,
    TResult Function(Unautorised value)? unauthorised,
    required TResult orElse(),
  }) {
    if (authorised != null) {
      return authorised(this);
    }
    return orElse();
  }
}

abstract class Authorised implements AuthorisationState {
  const factory Authorised() = _$Authorised;
}

/// @nodoc
abstract class $UnautorisedCopyWith<$Res> {
  factory $UnautorisedCopyWith(
          Unautorised value, $Res Function(Unautorised) then) =
      _$UnautorisedCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnautorisedCopyWithImpl<$Res>
    extends _$AuthorisationStateCopyWithImpl<$Res>
    implements $UnautorisedCopyWith<$Res> {
  _$UnautorisedCopyWithImpl(
      Unautorised _value, $Res Function(Unautorised) _then)
      : super(_value, (v) => _then(v as Unautorised));

  @override
  Unautorised get _value => super._value as Unautorised;
}

/// @nodoc

class _$Unautorised implements Unautorised {
  const _$Unautorised();

  @override
  String toString() {
    return 'AuthorisationState.unauthorised()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Unautorised);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authorised,
    required TResult Function() unauthorised,
  }) {
    return unauthorised();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorised,
    TResult Function()? unauthorised,
  }) {
    return unauthorised?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorised,
    TResult Function()? unauthorised,
    required TResult orElse(),
  }) {
    if (unauthorised != null) {
      return unauthorised();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Authorised value) authorised,
    required TResult Function(Unautorised value) unauthorised,
  }) {
    return unauthorised(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Authorised value)? authorised,
    TResult Function(Unautorised value)? unauthorised,
  }) {
    return unauthorised?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Authorised value)? authorised,
    TResult Function(Unautorised value)? unauthorised,
    required TResult orElse(),
  }) {
    if (unauthorised != null) {
      return unauthorised(this);
    }
    return orElse();
  }
}

abstract class Unautorised implements AuthorisationState {
  const factory Unautorised() = _$Unautorised;
}
