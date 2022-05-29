// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'custom_leagues_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CustomLeaguesEventTearOff {
  const _$CustomLeaguesEventTearOff();

  _getUserCustomLeagues getUserCustomLeagues({required String userId}) {
    return _getUserCustomLeagues(
      userId: userId,
    );
  }
}

/// @nodoc
const $CustomLeaguesEvent = _$CustomLeaguesEventTearOff();

/// @nodoc
mixin _$CustomLeaguesEvent {
  String get userId => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getUserCustomLeagues,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? getUserCustomLeagues,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getUserCustomLeagues,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getUserCustomLeagues value) getUserCustomLeagues,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_getUserCustomLeagues value)? getUserCustomLeagues,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getUserCustomLeagues value)? getUserCustomLeagues,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomLeaguesEventCopyWith<CustomLeaguesEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomLeaguesEventCopyWith<$Res> {
  factory $CustomLeaguesEventCopyWith(
          CustomLeaguesEvent value, $Res Function(CustomLeaguesEvent) then) =
      _$CustomLeaguesEventCopyWithImpl<$Res>;
  $Res call({String userId});
}

/// @nodoc
class _$CustomLeaguesEventCopyWithImpl<$Res>
    implements $CustomLeaguesEventCopyWith<$Res> {
  _$CustomLeaguesEventCopyWithImpl(this._value, this._then);

  final CustomLeaguesEvent _value;
  // ignore: unused_field
  final $Res Function(CustomLeaguesEvent) _then;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$getUserCustomLeaguesCopyWith<$Res>
    implements $CustomLeaguesEventCopyWith<$Res> {
  factory _$getUserCustomLeaguesCopyWith(_getUserCustomLeagues value,
          $Res Function(_getUserCustomLeagues) then) =
      __$getUserCustomLeaguesCopyWithImpl<$Res>;
  @override
  $Res call({String userId});
}

/// @nodoc
class __$getUserCustomLeaguesCopyWithImpl<$Res>
    extends _$CustomLeaguesEventCopyWithImpl<$Res>
    implements _$getUserCustomLeaguesCopyWith<$Res> {
  __$getUserCustomLeaguesCopyWithImpl(
      _getUserCustomLeagues _value, $Res Function(_getUserCustomLeagues) _then)
      : super(_value, (v) => _then(v as _getUserCustomLeagues));

  @override
  _getUserCustomLeagues get _value => super._value as _getUserCustomLeagues;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_getUserCustomLeagues(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_getUserCustomLeagues implements _getUserCustomLeagues {
  const _$_getUserCustomLeagues({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'CustomLeaguesEvent.getUserCustomLeagues(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _getUserCustomLeagues &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$getUserCustomLeaguesCopyWith<_getUserCustomLeagues> get copyWith =>
      __$getUserCustomLeaguesCopyWithImpl<_getUserCustomLeagues>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getUserCustomLeagues,
  }) {
    return getUserCustomLeagues(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? getUserCustomLeagues,
  }) {
    return getUserCustomLeagues?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getUserCustomLeagues,
    required TResult orElse(),
  }) {
    if (getUserCustomLeagues != null) {
      return getUserCustomLeagues(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getUserCustomLeagues value) getUserCustomLeagues,
  }) {
    return getUserCustomLeagues(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_getUserCustomLeagues value)? getUserCustomLeagues,
  }) {
    return getUserCustomLeagues?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getUserCustomLeagues value)? getUserCustomLeagues,
    required TResult orElse(),
  }) {
    if (getUserCustomLeagues != null) {
      return getUserCustomLeagues(this);
    }
    return orElse();
  }
}

abstract class _getUserCustomLeagues implements CustomLeaguesEvent {
  const factory _getUserCustomLeagues({required String userId}) =
      _$_getUserCustomLeagues;

  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$getUserCustomLeaguesCopyWith<_getUserCustomLeagues> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$CustomLeaguesStateTearOff {
  const _$CustomLeaguesStateTearOff();

  _CustomLeaguesState call({required CustomLeagues userCustomLeagues}) {
    return _CustomLeaguesState(
      userCustomLeagues: userCustomLeagues,
    );
  }
}

/// @nodoc
const $CustomLeaguesState = _$CustomLeaguesStateTearOff();

/// @nodoc
mixin _$CustomLeaguesState {
  CustomLeagues get userCustomLeagues => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomLeaguesStateCopyWith<CustomLeaguesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomLeaguesStateCopyWith<$Res> {
  factory $CustomLeaguesStateCopyWith(
          CustomLeaguesState value, $Res Function(CustomLeaguesState) then) =
      _$CustomLeaguesStateCopyWithImpl<$Res>;
  $Res call({CustomLeagues userCustomLeagues});

  $CustomLeaguesCopyWith<$Res> get userCustomLeagues;
}

/// @nodoc
class _$CustomLeaguesStateCopyWithImpl<$Res>
    implements $CustomLeaguesStateCopyWith<$Res> {
  _$CustomLeaguesStateCopyWithImpl(this._value, this._then);

  final CustomLeaguesState _value;
  // ignore: unused_field
  final $Res Function(CustomLeaguesState) _then;

  @override
  $Res call({
    Object? userCustomLeagues = freezed,
  }) {
    return _then(_value.copyWith(
      userCustomLeagues: userCustomLeagues == freezed
          ? _value.userCustomLeagues
          : userCustomLeagues // ignore: cast_nullable_to_non_nullable
              as CustomLeagues,
    ));
  }

  @override
  $CustomLeaguesCopyWith<$Res> get userCustomLeagues {
    return $CustomLeaguesCopyWith<$Res>(_value.userCustomLeagues, (value) {
      return _then(_value.copyWith(userCustomLeagues: value));
    });
  }
}

/// @nodoc
abstract class _$CustomLeaguesStateCopyWith<$Res>
    implements $CustomLeaguesStateCopyWith<$Res> {
  factory _$CustomLeaguesStateCopyWith(
          _CustomLeaguesState value, $Res Function(_CustomLeaguesState) then) =
      __$CustomLeaguesStateCopyWithImpl<$Res>;
  @override
  $Res call({CustomLeagues userCustomLeagues});

  @override
  $CustomLeaguesCopyWith<$Res> get userCustomLeagues;
}

/// @nodoc
class __$CustomLeaguesStateCopyWithImpl<$Res>
    extends _$CustomLeaguesStateCopyWithImpl<$Res>
    implements _$CustomLeaguesStateCopyWith<$Res> {
  __$CustomLeaguesStateCopyWithImpl(
      _CustomLeaguesState _value, $Res Function(_CustomLeaguesState) _then)
      : super(_value, (v) => _then(v as _CustomLeaguesState));

  @override
  _CustomLeaguesState get _value => super._value as _CustomLeaguesState;

  @override
  $Res call({
    Object? userCustomLeagues = freezed,
  }) {
    return _then(_CustomLeaguesState(
      userCustomLeagues: userCustomLeagues == freezed
          ? _value.userCustomLeagues
          : userCustomLeagues // ignore: cast_nullable_to_non_nullable
              as CustomLeagues,
    ));
  }
}

/// @nodoc

class _$_CustomLeaguesState implements _CustomLeaguesState {
  const _$_CustomLeaguesState({required this.userCustomLeagues});

  @override
  final CustomLeagues userCustomLeagues;

  @override
  String toString() {
    return 'CustomLeaguesState(userCustomLeagues: $userCustomLeagues)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomLeaguesState &&
            const DeepCollectionEquality()
                .equals(other.userCustomLeagues, userCustomLeagues));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(userCustomLeagues));

  @JsonKey(ignore: true)
  @override
  _$CustomLeaguesStateCopyWith<_CustomLeaguesState> get copyWith =>
      __$CustomLeaguesStateCopyWithImpl<_CustomLeaguesState>(this, _$identity);
}

abstract class _CustomLeaguesState implements CustomLeaguesState {
  const factory _CustomLeaguesState(
      {required CustomLeagues userCustomLeagues}) = _$_CustomLeaguesState;

  @override
  CustomLeagues get userCustomLeagues;
  @override
  @JsonKey(ignore: true)
  _$CustomLeaguesStateCopyWith<_CustomLeaguesState> get copyWith =>
      throw _privateConstructorUsedError;
}
