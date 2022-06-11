// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_custom_league_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CreateCustomLeagueFormEventTearOff {
  const _$CreateCustomLeagueFormEventTearOff();

  _createLeaguePressed createLeaguePressed(String userId, String leagueName) {
    return _createLeaguePressed(
      userId,
      leagueName,
    );
  }

  _leagueNameChanged leagueNameChanged(String leagueNameStr) {
    return _leagueNameChanged(
      leagueNameStr,
    );
  }
}

/// @nodoc
const $CreateCustomLeagueFormEvent = _$CreateCustomLeagueFormEventTearOff();

/// @nodoc
mixin _$CreateCustomLeagueFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId, String leagueName)
        createLeaguePressed,
    required TResult Function(String leagueNameStr) leagueNameChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId, String leagueName)? createLeaguePressed,
    TResult Function(String leagueNameStr)? leagueNameChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String leagueName)? createLeaguePressed,
    TResult Function(String leagueNameStr)? leagueNameChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_createLeaguePressed value) createLeaguePressed,
    required TResult Function(_leagueNameChanged value) leagueNameChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_createLeaguePressed value)? createLeaguePressed,
    TResult Function(_leagueNameChanged value)? leagueNameChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_createLeaguePressed value)? createLeaguePressed,
    TResult Function(_leagueNameChanged value)? leagueNameChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCustomLeagueFormEventCopyWith<$Res> {
  factory $CreateCustomLeagueFormEventCopyWith(
          CreateCustomLeagueFormEvent value,
          $Res Function(CreateCustomLeagueFormEvent) then) =
      _$CreateCustomLeagueFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CreateCustomLeagueFormEventCopyWithImpl<$Res>
    implements $CreateCustomLeagueFormEventCopyWith<$Res> {
  _$CreateCustomLeagueFormEventCopyWithImpl(this._value, this._then);

  final CreateCustomLeagueFormEvent _value;
  // ignore: unused_field
  final $Res Function(CreateCustomLeagueFormEvent) _then;
}

/// @nodoc
abstract class _$createLeaguePressedCopyWith<$Res> {
  factory _$createLeaguePressedCopyWith(_createLeaguePressed value,
          $Res Function(_createLeaguePressed) then) =
      __$createLeaguePressedCopyWithImpl<$Res>;
  $Res call({String userId, String leagueName});
}

/// @nodoc
class __$createLeaguePressedCopyWithImpl<$Res>
    extends _$CreateCustomLeagueFormEventCopyWithImpl<$Res>
    implements _$createLeaguePressedCopyWith<$Res> {
  __$createLeaguePressedCopyWithImpl(
      _createLeaguePressed _value, $Res Function(_createLeaguePressed) _then)
      : super(_value, (v) => _then(v as _createLeaguePressed));

  @override
  _createLeaguePressed get _value => super._value as _createLeaguePressed;

  @override
  $Res call({
    Object? userId = freezed,
    Object? leagueName = freezed,
  }) {
    return _then(_createLeaguePressed(
      userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      leagueName == freezed
          ? _value.leagueName
          : leagueName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_createLeaguePressed implements _createLeaguePressed {
  const _$_createLeaguePressed(this.userId, this.leagueName);

  @override
  final String userId;
  @override
  final String leagueName;

  @override
  String toString() {
    return 'CreateCustomLeagueFormEvent.createLeaguePressed(userId: $userId, leagueName: $leagueName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _createLeaguePressed &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.leagueName, leagueName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(leagueName));

  @JsonKey(ignore: true)
  @override
  _$createLeaguePressedCopyWith<_createLeaguePressed> get copyWith =>
      __$createLeaguePressedCopyWithImpl<_createLeaguePressed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId, String leagueName)
        createLeaguePressed,
    required TResult Function(String leagueNameStr) leagueNameChanged,
  }) {
    return createLeaguePressed(userId, leagueName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId, String leagueName)? createLeaguePressed,
    TResult Function(String leagueNameStr)? leagueNameChanged,
  }) {
    return createLeaguePressed?.call(userId, leagueName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String leagueName)? createLeaguePressed,
    TResult Function(String leagueNameStr)? leagueNameChanged,
    required TResult orElse(),
  }) {
    if (createLeaguePressed != null) {
      return createLeaguePressed(userId, leagueName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_createLeaguePressed value) createLeaguePressed,
    required TResult Function(_leagueNameChanged value) leagueNameChanged,
  }) {
    return createLeaguePressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_createLeaguePressed value)? createLeaguePressed,
    TResult Function(_leagueNameChanged value)? leagueNameChanged,
  }) {
    return createLeaguePressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_createLeaguePressed value)? createLeaguePressed,
    TResult Function(_leagueNameChanged value)? leagueNameChanged,
    required TResult orElse(),
  }) {
    if (createLeaguePressed != null) {
      return createLeaguePressed(this);
    }
    return orElse();
  }
}

abstract class _createLeaguePressed implements CreateCustomLeagueFormEvent {
  const factory _createLeaguePressed(String userId, String leagueName) =
      _$_createLeaguePressed;

  String get userId;
  String get leagueName;
  @JsonKey(ignore: true)
  _$createLeaguePressedCopyWith<_createLeaguePressed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$leagueNameChangedCopyWith<$Res> {
  factory _$leagueNameChangedCopyWith(
          _leagueNameChanged value, $Res Function(_leagueNameChanged) then) =
      __$leagueNameChangedCopyWithImpl<$Res>;
  $Res call({String leagueNameStr});
}

/// @nodoc
class __$leagueNameChangedCopyWithImpl<$Res>
    extends _$CreateCustomLeagueFormEventCopyWithImpl<$Res>
    implements _$leagueNameChangedCopyWith<$Res> {
  __$leagueNameChangedCopyWithImpl(
      _leagueNameChanged _value, $Res Function(_leagueNameChanged) _then)
      : super(_value, (v) => _then(v as _leagueNameChanged));

  @override
  _leagueNameChanged get _value => super._value as _leagueNameChanged;

  @override
  $Res call({
    Object? leagueNameStr = freezed,
  }) {
    return _then(_leagueNameChanged(
      leagueNameStr == freezed
          ? _value.leagueNameStr
          : leagueNameStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_leagueNameChanged implements _leagueNameChanged {
  const _$_leagueNameChanged(this.leagueNameStr);

  @override
  final String leagueNameStr;

  @override
  String toString() {
    return 'CreateCustomLeagueFormEvent.leagueNameChanged(leagueNameStr: $leagueNameStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _leagueNameChanged &&
            const DeepCollectionEquality()
                .equals(other.leagueNameStr, leagueNameStr));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(leagueNameStr));

  @JsonKey(ignore: true)
  @override
  _$leagueNameChangedCopyWith<_leagueNameChanged> get copyWith =>
      __$leagueNameChangedCopyWithImpl<_leagueNameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId, String leagueName)
        createLeaguePressed,
    required TResult Function(String leagueNameStr) leagueNameChanged,
  }) {
    return leagueNameChanged(leagueNameStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId, String leagueName)? createLeaguePressed,
    TResult Function(String leagueNameStr)? leagueNameChanged,
  }) {
    return leagueNameChanged?.call(leagueNameStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String leagueName)? createLeaguePressed,
    TResult Function(String leagueNameStr)? leagueNameChanged,
    required TResult orElse(),
  }) {
    if (leagueNameChanged != null) {
      return leagueNameChanged(leagueNameStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_createLeaguePressed value) createLeaguePressed,
    required TResult Function(_leagueNameChanged value) leagueNameChanged,
  }) {
    return leagueNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_createLeaguePressed value)? createLeaguePressed,
    TResult Function(_leagueNameChanged value)? leagueNameChanged,
  }) {
    return leagueNameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_createLeaguePressed value)? createLeaguePressed,
    TResult Function(_leagueNameChanged value)? leagueNameChanged,
    required TResult orElse(),
  }) {
    if (leagueNameChanged != null) {
      return leagueNameChanged(this);
    }
    return orElse();
  }
}

abstract class _leagueNameChanged implements CreateCustomLeagueFormEvent {
  const factory _leagueNameChanged(String leagueNameStr) = _$_leagueNameChanged;

  String get leagueNameStr;
  @JsonKey(ignore: true)
  _$leagueNameChangedCopyWith<_leagueNameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$CreateCustomLeagueFormStateTearOff {
  const _$CreateCustomLeagueFormStateTearOff();

  _CreateCustomLeagueFormState call(
      {required LeagueName leagueName,
      required AdminId userId,
      required bool isLoading}) {
    return _CreateCustomLeagueFormState(
      leagueName: leagueName,
      userId: userId,
      isLoading: isLoading,
    );
  }
}

/// @nodoc
const $CreateCustomLeagueFormState = _$CreateCustomLeagueFormStateTearOff();

/// @nodoc
mixin _$CreateCustomLeagueFormState {
  LeagueName get leagueName => throw _privateConstructorUsedError;
  AdminId get userId => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateCustomLeagueFormStateCopyWith<CreateCustomLeagueFormState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCustomLeagueFormStateCopyWith<$Res> {
  factory $CreateCustomLeagueFormStateCopyWith(
          CreateCustomLeagueFormState value,
          $Res Function(CreateCustomLeagueFormState) then) =
      _$CreateCustomLeagueFormStateCopyWithImpl<$Res>;
  $Res call({LeagueName leagueName, AdminId userId, bool isLoading});
}

/// @nodoc
class _$CreateCustomLeagueFormStateCopyWithImpl<$Res>
    implements $CreateCustomLeagueFormStateCopyWith<$Res> {
  _$CreateCustomLeagueFormStateCopyWithImpl(this._value, this._then);

  final CreateCustomLeagueFormState _value;
  // ignore: unused_field
  final $Res Function(CreateCustomLeagueFormState) _then;

  @override
  $Res call({
    Object? leagueName = freezed,
    Object? userId = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      leagueName: leagueName == freezed
          ? _value.leagueName
          : leagueName // ignore: cast_nullable_to_non_nullable
              as LeagueName,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as AdminId,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$CreateCustomLeagueFormStateCopyWith<$Res>
    implements $CreateCustomLeagueFormStateCopyWith<$Res> {
  factory _$CreateCustomLeagueFormStateCopyWith(
          _CreateCustomLeagueFormState value,
          $Res Function(_CreateCustomLeagueFormState) then) =
      __$CreateCustomLeagueFormStateCopyWithImpl<$Res>;
  @override
  $Res call({LeagueName leagueName, AdminId userId, bool isLoading});
}

/// @nodoc
class __$CreateCustomLeagueFormStateCopyWithImpl<$Res>
    extends _$CreateCustomLeagueFormStateCopyWithImpl<$Res>
    implements _$CreateCustomLeagueFormStateCopyWith<$Res> {
  __$CreateCustomLeagueFormStateCopyWithImpl(
      _CreateCustomLeagueFormState _value,
      $Res Function(_CreateCustomLeagueFormState) _then)
      : super(_value, (v) => _then(v as _CreateCustomLeagueFormState));

  @override
  _CreateCustomLeagueFormState get _value =>
      super._value as _CreateCustomLeagueFormState;

  @override
  $Res call({
    Object? leagueName = freezed,
    Object? userId = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_CreateCustomLeagueFormState(
      leagueName: leagueName == freezed
          ? _value.leagueName
          : leagueName // ignore: cast_nullable_to_non_nullable
              as LeagueName,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as AdminId,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CreateCustomLeagueFormState implements _CreateCustomLeagueFormState {
  const _$_CreateCustomLeagueFormState(
      {required this.leagueName,
      required this.userId,
      required this.isLoading});

  @override
  final LeagueName leagueName;
  @override
  final AdminId userId;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'CreateCustomLeagueFormState(leagueName: $leagueName, userId: $userId, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateCustomLeagueFormState &&
            const DeepCollectionEquality()
                .equals(other.leagueName, leagueName) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(leagueName),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$CreateCustomLeagueFormStateCopyWith<_CreateCustomLeagueFormState>
      get copyWith => __$CreateCustomLeagueFormStateCopyWithImpl<
          _CreateCustomLeagueFormState>(this, _$identity);
}

abstract class _CreateCustomLeagueFormState
    implements CreateCustomLeagueFormState {
  const factory _CreateCustomLeagueFormState(
      {required LeagueName leagueName,
      required AdminId userId,
      required bool isLoading}) = _$_CreateCustomLeagueFormState;

  @override
  LeagueName get leagueName;
  @override
  AdminId get userId;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$CreateCustomLeagueFormStateCopyWith<_CreateCustomLeagueFormState>
      get copyWith => throw _privateConstructorUsedError;
}
