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

  _GetUserCustomLeagues getUserCustomLeagues({required String userId}) {
    return _GetUserCustomLeagues(
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
    required TResult Function(_GetUserCustomLeagues value) getUserCustomLeagues,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUserCustomLeagues value)? getUserCustomLeagues,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserCustomLeagues value)? getUserCustomLeagues,
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
abstract class _$GetUserCustomLeaguesCopyWith<$Res>
    implements $CustomLeaguesEventCopyWith<$Res> {
  factory _$GetUserCustomLeaguesCopyWith(_GetUserCustomLeagues value,
          $Res Function(_GetUserCustomLeagues) then) =
      __$GetUserCustomLeaguesCopyWithImpl<$Res>;
  @override
  $Res call({String userId});
}

/// @nodoc
class __$GetUserCustomLeaguesCopyWithImpl<$Res>
    extends _$CustomLeaguesEventCopyWithImpl<$Res>
    implements _$GetUserCustomLeaguesCopyWith<$Res> {
  __$GetUserCustomLeaguesCopyWithImpl(
      _GetUserCustomLeagues _value, $Res Function(_GetUserCustomLeagues) _then)
      : super(_value, (v) => _then(v as _GetUserCustomLeagues));

  @override
  _GetUserCustomLeagues get _value => super._value as _GetUserCustomLeagues;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_GetUserCustomLeagues(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetUserCustomLeagues implements _GetUserCustomLeagues {
  const _$_GetUserCustomLeagues({required this.userId});

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
            other is _GetUserCustomLeagues &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$GetUserCustomLeaguesCopyWith<_GetUserCustomLeagues> get copyWith =>
      __$GetUserCustomLeaguesCopyWithImpl<_GetUserCustomLeagues>(
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
    required TResult Function(_GetUserCustomLeagues value) getUserCustomLeagues,
  }) {
    return getUserCustomLeagues(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUserCustomLeagues value)? getUserCustomLeagues,
  }) {
    return getUserCustomLeagues?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserCustomLeagues value)? getUserCustomLeagues,
    required TResult orElse(),
  }) {
    if (getUserCustomLeagues != null) {
      return getUserCustomLeagues(this);
    }
    return orElse();
  }
}

abstract class _GetUserCustomLeagues implements CustomLeaguesEvent {
  const factory _GetUserCustomLeagues({required String userId}) =
      _$_GetUserCustomLeagues;

  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$GetUserCustomLeaguesCopyWith<_GetUserCustomLeagues> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$CustomLeaguesStateTearOff {
  const _$CustomLeaguesStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _LoadInProgress loadInProgress() {
    return const _LoadInProgress();
  }

  _LoadUserCustomLeaguesSuccess loadUserCustomLeaguesSuccess(
      List<CustomLeagues> userCustomLeagues) {
    return _LoadUserCustomLeaguesSuccess(
      userCustomLeagues,
    );
  }

  _LoadFailure loadFailure(CustomLeaguesFailures<dynamic> failure) {
    return _LoadFailure(
      failure,
    );
  }
}

/// @nodoc
const $CustomLeaguesState = _$CustomLeaguesStateTearOff();

/// @nodoc
mixin _$CustomLeaguesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<CustomLeagues> userCustomLeagues)
        loadUserCustomLeaguesSuccess,
    required TResult Function(CustomLeaguesFailures<dynamic> failure)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<CustomLeagues> userCustomLeagues)?
        loadUserCustomLeaguesSuccess,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<CustomLeagues> userCustomLeagues)?
        loadUserCustomLeaguesSuccess,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadUserCustomLeaguesSuccess value)
        loadUserCustomLeaguesSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadUserCustomLeaguesSuccess value)?
        loadUserCustomLeaguesSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadUserCustomLeaguesSuccess value)?
        loadUserCustomLeaguesSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomLeaguesStateCopyWith<$Res> {
  factory $CustomLeaguesStateCopyWith(
          CustomLeaguesState value, $Res Function(CustomLeaguesState) then) =
      _$CustomLeaguesStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CustomLeaguesStateCopyWithImpl<$Res>
    implements $CustomLeaguesStateCopyWith<$Res> {
  _$CustomLeaguesStateCopyWithImpl(this._value, this._then);

  final CustomLeaguesState _value;
  // ignore: unused_field
  final $Res Function(CustomLeaguesState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$CustomLeaguesStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'CustomLeaguesState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<CustomLeagues> userCustomLeagues)
        loadUserCustomLeaguesSuccess,
    required TResult Function(CustomLeaguesFailures<dynamic> failure)
        loadFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<CustomLeagues> userCustomLeagues)?
        loadUserCustomLeaguesSuccess,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<CustomLeagues> userCustomLeagues)?
        loadUserCustomLeaguesSuccess,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadUserCustomLeaguesSuccess value)
        loadUserCustomLeaguesSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadUserCustomLeaguesSuccess value)?
        loadUserCustomLeaguesSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadUserCustomLeaguesSuccess value)?
        loadUserCustomLeaguesSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CustomLeaguesState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadInProgressCopyWith<$Res> {
  factory _$LoadInProgressCopyWith(
          _LoadInProgress value, $Res Function(_LoadInProgress) then) =
      __$LoadInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadInProgressCopyWithImpl<$Res>
    extends _$CustomLeaguesStateCopyWithImpl<$Res>
    implements _$LoadInProgressCopyWith<$Res> {
  __$LoadInProgressCopyWithImpl(
      _LoadInProgress _value, $Res Function(_LoadInProgress) _then)
      : super(_value, (v) => _then(v as _LoadInProgress));

  @override
  _LoadInProgress get _value => super._value as _LoadInProgress;
}

/// @nodoc

class _$_LoadInProgress implements _LoadInProgress {
  const _$_LoadInProgress();

  @override
  String toString() {
    return 'CustomLeaguesState.loadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<CustomLeagues> userCustomLeagues)
        loadUserCustomLeaguesSuccess,
    required TResult Function(CustomLeaguesFailures<dynamic> failure)
        loadFailure,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<CustomLeagues> userCustomLeagues)?
        loadUserCustomLeaguesSuccess,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<CustomLeagues> userCustomLeagues)?
        loadUserCustomLeaguesSuccess,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadUserCustomLeaguesSuccess value)
        loadUserCustomLeaguesSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadUserCustomLeaguesSuccess value)?
        loadUserCustomLeaguesSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadUserCustomLeaguesSuccess value)?
        loadUserCustomLeaguesSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements CustomLeaguesState {
  const factory _LoadInProgress() = _$_LoadInProgress;
}

/// @nodoc
abstract class _$LoadUserCustomLeaguesSuccessCopyWith<$Res> {
  factory _$LoadUserCustomLeaguesSuccessCopyWith(
          _LoadUserCustomLeaguesSuccess value,
          $Res Function(_LoadUserCustomLeaguesSuccess) then) =
      __$LoadUserCustomLeaguesSuccessCopyWithImpl<$Res>;
  $Res call({List<CustomLeagues> userCustomLeagues});
}

/// @nodoc
class __$LoadUserCustomLeaguesSuccessCopyWithImpl<$Res>
    extends _$CustomLeaguesStateCopyWithImpl<$Res>
    implements _$LoadUserCustomLeaguesSuccessCopyWith<$Res> {
  __$LoadUserCustomLeaguesSuccessCopyWithImpl(
      _LoadUserCustomLeaguesSuccess _value,
      $Res Function(_LoadUserCustomLeaguesSuccess) _then)
      : super(_value, (v) => _then(v as _LoadUserCustomLeaguesSuccess));

  @override
  _LoadUserCustomLeaguesSuccess get _value =>
      super._value as _LoadUserCustomLeaguesSuccess;

  @override
  $Res call({
    Object? userCustomLeagues = freezed,
  }) {
    return _then(_LoadUserCustomLeaguesSuccess(
      userCustomLeagues == freezed
          ? _value.userCustomLeagues
          : userCustomLeagues // ignore: cast_nullable_to_non_nullable
              as List<CustomLeagues>,
    ));
  }
}

/// @nodoc

class _$_LoadUserCustomLeaguesSuccess implements _LoadUserCustomLeaguesSuccess {
  const _$_LoadUserCustomLeaguesSuccess(this.userCustomLeagues);

  @override
  final List<CustomLeagues> userCustomLeagues;

  @override
  String toString() {
    return 'CustomLeaguesState.loadUserCustomLeaguesSuccess(userCustomLeagues: $userCustomLeagues)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadUserCustomLeaguesSuccess &&
            const DeepCollectionEquality()
                .equals(other.userCustomLeagues, userCustomLeagues));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(userCustomLeagues));

  @JsonKey(ignore: true)
  @override
  _$LoadUserCustomLeaguesSuccessCopyWith<_LoadUserCustomLeaguesSuccess>
      get copyWith => __$LoadUserCustomLeaguesSuccessCopyWithImpl<
          _LoadUserCustomLeaguesSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<CustomLeagues> userCustomLeagues)
        loadUserCustomLeaguesSuccess,
    required TResult Function(CustomLeaguesFailures<dynamic> failure)
        loadFailure,
  }) {
    return loadUserCustomLeaguesSuccess(userCustomLeagues);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<CustomLeagues> userCustomLeagues)?
        loadUserCustomLeaguesSuccess,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
  }) {
    return loadUserCustomLeaguesSuccess?.call(userCustomLeagues);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<CustomLeagues> userCustomLeagues)?
        loadUserCustomLeaguesSuccess,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadUserCustomLeaguesSuccess != null) {
      return loadUserCustomLeaguesSuccess(userCustomLeagues);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadUserCustomLeaguesSuccess value)
        loadUserCustomLeaguesSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadUserCustomLeaguesSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadUserCustomLeaguesSuccess value)?
        loadUserCustomLeaguesSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loadUserCustomLeaguesSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadUserCustomLeaguesSuccess value)?
        loadUserCustomLeaguesSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadUserCustomLeaguesSuccess != null) {
      return loadUserCustomLeaguesSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadUserCustomLeaguesSuccess implements CustomLeaguesState {
  const factory _LoadUserCustomLeaguesSuccess(
      List<CustomLeagues> userCustomLeagues) = _$_LoadUserCustomLeaguesSuccess;

  List<CustomLeagues> get userCustomLeagues;
  @JsonKey(ignore: true)
  _$LoadUserCustomLeaguesSuccessCopyWith<_LoadUserCustomLeaguesSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadFailureCopyWith<$Res> {
  factory _$LoadFailureCopyWith(
          _LoadFailure value, $Res Function(_LoadFailure) then) =
      __$LoadFailureCopyWithImpl<$Res>;
  $Res call({CustomLeaguesFailures<dynamic> failure});

  $CustomLeaguesFailuresCopyWith<dynamic, $Res> get failure;
}

/// @nodoc
class __$LoadFailureCopyWithImpl<$Res>
    extends _$CustomLeaguesStateCopyWithImpl<$Res>
    implements _$LoadFailureCopyWith<$Res> {
  __$LoadFailureCopyWithImpl(
      _LoadFailure _value, $Res Function(_LoadFailure) _then)
      : super(_value, (v) => _then(v as _LoadFailure));

  @override
  _LoadFailure get _value => super._value as _LoadFailure;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_LoadFailure(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as CustomLeaguesFailures<dynamic>,
    ));
  }

  @override
  $CustomLeaguesFailuresCopyWith<dynamic, $Res> get failure {
    return $CustomLeaguesFailuresCopyWith<dynamic, $Res>(_value.failure,
        (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_LoadFailure implements _LoadFailure {
  const _$_LoadFailure(this.failure);

  @override
  final CustomLeaguesFailures<dynamic> failure;

  @override
  String toString() {
    return 'CustomLeaguesState.loadFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadFailure &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$LoadFailureCopyWith<_LoadFailure> get copyWith =>
      __$LoadFailureCopyWithImpl<_LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<CustomLeagues> userCustomLeagues)
        loadUserCustomLeaguesSuccess,
    required TResult Function(CustomLeaguesFailures<dynamic> failure)
        loadFailure,
  }) {
    return loadFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<CustomLeagues> userCustomLeagues)?
        loadUserCustomLeaguesSuccess,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
  }) {
    return loadFailure?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<CustomLeagues> userCustomLeagues)?
        loadUserCustomLeaguesSuccess,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadUserCustomLeaguesSuccess value)
        loadUserCustomLeaguesSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadUserCustomLeaguesSuccess value)?
        loadUserCustomLeaguesSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadUserCustomLeaguesSuccess value)?
        loadUserCustomLeaguesSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure implements CustomLeaguesState {
  const factory _LoadFailure(CustomLeaguesFailures<dynamic> failure) =
      _$_LoadFailure;

  CustomLeaguesFailures<dynamic> get failure;
  @JsonKey(ignore: true)
  _$LoadFailureCopyWith<_LoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
