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

  _GetCustomLeagueInfo getCustomLeagueInfo({required int leagueId}) {
    return _GetCustomLeagueInfo(
      leagueId: leagueId,
    );
  }

  _JoinPublicLeague joinPublicLeague({required int leagueId}) {
    return _JoinPublicLeague(
      leagueId: leagueId,
    );
  }

  _JoinPrivateLeague joinPrivateLeague({required String leagueCode}) {
    return _JoinPrivateLeague(
      leagueCode: leagueCode,
    );
  }
}

/// @nodoc
const $CustomLeaguesEvent = _$CustomLeaguesEventTearOff();

/// @nodoc
mixin _$CustomLeaguesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getUserCustomLeagues,
    required TResult Function(int leagueId) getCustomLeagueInfo,
    required TResult Function(int leagueId) joinPublicLeague,
    required TResult Function(String leagueCode) joinPrivateLeague,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? getUserCustomLeagues,
    TResult Function(int leagueId)? getCustomLeagueInfo,
    TResult Function(int leagueId)? joinPublicLeague,
    TResult Function(String leagueCode)? joinPrivateLeague,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getUserCustomLeagues,
    TResult Function(int leagueId)? getCustomLeagueInfo,
    TResult Function(int leagueId)? joinPublicLeague,
    TResult Function(String leagueCode)? joinPrivateLeague,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserCustomLeagues value) getUserCustomLeagues,
    required TResult Function(_GetCustomLeagueInfo value) getCustomLeagueInfo,
    required TResult Function(_JoinPublicLeague value) joinPublicLeague,
    required TResult Function(_JoinPrivateLeague value) joinPrivateLeague,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUserCustomLeagues value)? getUserCustomLeagues,
    TResult Function(_GetCustomLeagueInfo value)? getCustomLeagueInfo,
    TResult Function(_JoinPublicLeague value)? joinPublicLeague,
    TResult Function(_JoinPrivateLeague value)? joinPrivateLeague,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserCustomLeagues value)? getUserCustomLeagues,
    TResult Function(_GetCustomLeagueInfo value)? getCustomLeagueInfo,
    TResult Function(_JoinPublicLeague value)? joinPublicLeague,
    TResult Function(_JoinPrivateLeague value)? joinPrivateLeague,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomLeaguesEventCopyWith<$Res> {
  factory $CustomLeaguesEventCopyWith(
          CustomLeaguesEvent value, $Res Function(CustomLeaguesEvent) then) =
      _$CustomLeaguesEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CustomLeaguesEventCopyWithImpl<$Res>
    implements $CustomLeaguesEventCopyWith<$Res> {
  _$CustomLeaguesEventCopyWithImpl(this._value, this._then);

  final CustomLeaguesEvent _value;
  // ignore: unused_field
  final $Res Function(CustomLeaguesEvent) _then;
}

/// @nodoc
abstract class _$GetUserCustomLeaguesCopyWith<$Res> {
  factory _$GetUserCustomLeaguesCopyWith(_GetUserCustomLeagues value,
          $Res Function(_GetUserCustomLeagues) then) =
      __$GetUserCustomLeaguesCopyWithImpl<$Res>;
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
    required TResult Function(int leagueId) getCustomLeagueInfo,
    required TResult Function(int leagueId) joinPublicLeague,
    required TResult Function(String leagueCode) joinPrivateLeague,
  }) {
    return getUserCustomLeagues(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? getUserCustomLeagues,
    TResult Function(int leagueId)? getCustomLeagueInfo,
    TResult Function(int leagueId)? joinPublicLeague,
    TResult Function(String leagueCode)? joinPrivateLeague,
  }) {
    return getUserCustomLeagues?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getUserCustomLeagues,
    TResult Function(int leagueId)? getCustomLeagueInfo,
    TResult Function(int leagueId)? joinPublicLeague,
    TResult Function(String leagueCode)? joinPrivateLeague,
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
    required TResult Function(_GetCustomLeagueInfo value) getCustomLeagueInfo,
    required TResult Function(_JoinPublicLeague value) joinPublicLeague,
    required TResult Function(_JoinPrivateLeague value) joinPrivateLeague,
  }) {
    return getUserCustomLeagues(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUserCustomLeagues value)? getUserCustomLeagues,
    TResult Function(_GetCustomLeagueInfo value)? getCustomLeagueInfo,
    TResult Function(_JoinPublicLeague value)? joinPublicLeague,
    TResult Function(_JoinPrivateLeague value)? joinPrivateLeague,
  }) {
    return getUserCustomLeagues?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserCustomLeagues value)? getUserCustomLeagues,
    TResult Function(_GetCustomLeagueInfo value)? getCustomLeagueInfo,
    TResult Function(_JoinPublicLeague value)? joinPublicLeague,
    TResult Function(_JoinPrivateLeague value)? joinPrivateLeague,
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

  String get userId;
  @JsonKey(ignore: true)
  _$GetUserCustomLeaguesCopyWith<_GetUserCustomLeagues> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GetCustomLeagueInfoCopyWith<$Res> {
  factory _$GetCustomLeagueInfoCopyWith(_GetCustomLeagueInfo value,
          $Res Function(_GetCustomLeagueInfo) then) =
      __$GetCustomLeagueInfoCopyWithImpl<$Res>;
  $Res call({int leagueId});
}

/// @nodoc
class __$GetCustomLeagueInfoCopyWithImpl<$Res>
    extends _$CustomLeaguesEventCopyWithImpl<$Res>
    implements _$GetCustomLeagueInfoCopyWith<$Res> {
  __$GetCustomLeagueInfoCopyWithImpl(
      _GetCustomLeagueInfo _value, $Res Function(_GetCustomLeagueInfo) _then)
      : super(_value, (v) => _then(v as _GetCustomLeagueInfo));

  @override
  _GetCustomLeagueInfo get _value => super._value as _GetCustomLeagueInfo;

  @override
  $Res call({
    Object? leagueId = freezed,
  }) {
    return _then(_GetCustomLeagueInfo(
      leagueId: leagueId == freezed
          ? _value.leagueId
          : leagueId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetCustomLeagueInfo implements _GetCustomLeagueInfo {
  const _$_GetCustomLeagueInfo({required this.leagueId});

  @override
  final int leagueId;

  @override
  String toString() {
    return 'CustomLeaguesEvent.getCustomLeagueInfo(leagueId: $leagueId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetCustomLeagueInfo &&
            const DeepCollectionEquality().equals(other.leagueId, leagueId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(leagueId));

  @JsonKey(ignore: true)
  @override
  _$GetCustomLeagueInfoCopyWith<_GetCustomLeagueInfo> get copyWith =>
      __$GetCustomLeagueInfoCopyWithImpl<_GetCustomLeagueInfo>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getUserCustomLeagues,
    required TResult Function(int leagueId) getCustomLeagueInfo,
    required TResult Function(int leagueId) joinPublicLeague,
    required TResult Function(String leagueCode) joinPrivateLeague,
  }) {
    return getCustomLeagueInfo(leagueId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? getUserCustomLeagues,
    TResult Function(int leagueId)? getCustomLeagueInfo,
    TResult Function(int leagueId)? joinPublicLeague,
    TResult Function(String leagueCode)? joinPrivateLeague,
  }) {
    return getCustomLeagueInfo?.call(leagueId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getUserCustomLeagues,
    TResult Function(int leagueId)? getCustomLeagueInfo,
    TResult Function(int leagueId)? joinPublicLeague,
    TResult Function(String leagueCode)? joinPrivateLeague,
    required TResult orElse(),
  }) {
    if (getCustomLeagueInfo != null) {
      return getCustomLeagueInfo(leagueId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserCustomLeagues value) getUserCustomLeagues,
    required TResult Function(_GetCustomLeagueInfo value) getCustomLeagueInfo,
    required TResult Function(_JoinPublicLeague value) joinPublicLeague,
    required TResult Function(_JoinPrivateLeague value) joinPrivateLeague,
  }) {
    return getCustomLeagueInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUserCustomLeagues value)? getUserCustomLeagues,
    TResult Function(_GetCustomLeagueInfo value)? getCustomLeagueInfo,
    TResult Function(_JoinPublicLeague value)? joinPublicLeague,
    TResult Function(_JoinPrivateLeague value)? joinPrivateLeague,
  }) {
    return getCustomLeagueInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserCustomLeagues value)? getUserCustomLeagues,
    TResult Function(_GetCustomLeagueInfo value)? getCustomLeagueInfo,
    TResult Function(_JoinPublicLeague value)? joinPublicLeague,
    TResult Function(_JoinPrivateLeague value)? joinPrivateLeague,
    required TResult orElse(),
  }) {
    if (getCustomLeagueInfo != null) {
      return getCustomLeagueInfo(this);
    }
    return orElse();
  }
}

abstract class _GetCustomLeagueInfo implements CustomLeaguesEvent {
  const factory _GetCustomLeagueInfo({required int leagueId}) =
      _$_GetCustomLeagueInfo;

  int get leagueId;
  @JsonKey(ignore: true)
  _$GetCustomLeagueInfoCopyWith<_GetCustomLeagueInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$JoinPublicLeagueCopyWith<$Res> {
  factory _$JoinPublicLeagueCopyWith(
          _JoinPublicLeague value, $Res Function(_JoinPublicLeague) then) =
      __$JoinPublicLeagueCopyWithImpl<$Res>;
  $Res call({int leagueId});
}

/// @nodoc
class __$JoinPublicLeagueCopyWithImpl<$Res>
    extends _$CustomLeaguesEventCopyWithImpl<$Res>
    implements _$JoinPublicLeagueCopyWith<$Res> {
  __$JoinPublicLeagueCopyWithImpl(
      _JoinPublicLeague _value, $Res Function(_JoinPublicLeague) _then)
      : super(_value, (v) => _then(v as _JoinPublicLeague));

  @override
  _JoinPublicLeague get _value => super._value as _JoinPublicLeague;

  @override
  $Res call({
    Object? leagueId = freezed,
  }) {
    return _then(_JoinPublicLeague(
      leagueId: leagueId == freezed
          ? _value.leagueId
          : leagueId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_JoinPublicLeague implements _JoinPublicLeague {
  const _$_JoinPublicLeague({required this.leagueId});

  @override
  final int leagueId;

  @override
  String toString() {
    return 'CustomLeaguesEvent.joinPublicLeague(leagueId: $leagueId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _JoinPublicLeague &&
            const DeepCollectionEquality().equals(other.leagueId, leagueId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(leagueId));

  @JsonKey(ignore: true)
  @override
  _$JoinPublicLeagueCopyWith<_JoinPublicLeague> get copyWith =>
      __$JoinPublicLeagueCopyWithImpl<_JoinPublicLeague>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getUserCustomLeagues,
    required TResult Function(int leagueId) getCustomLeagueInfo,
    required TResult Function(int leagueId) joinPublicLeague,
    required TResult Function(String leagueCode) joinPrivateLeague,
  }) {
    return joinPublicLeague(leagueId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? getUserCustomLeagues,
    TResult Function(int leagueId)? getCustomLeagueInfo,
    TResult Function(int leagueId)? joinPublicLeague,
    TResult Function(String leagueCode)? joinPrivateLeague,
  }) {
    return joinPublicLeague?.call(leagueId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getUserCustomLeagues,
    TResult Function(int leagueId)? getCustomLeagueInfo,
    TResult Function(int leagueId)? joinPublicLeague,
    TResult Function(String leagueCode)? joinPrivateLeague,
    required TResult orElse(),
  }) {
    if (joinPublicLeague != null) {
      return joinPublicLeague(leagueId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserCustomLeagues value) getUserCustomLeagues,
    required TResult Function(_GetCustomLeagueInfo value) getCustomLeagueInfo,
    required TResult Function(_JoinPublicLeague value) joinPublicLeague,
    required TResult Function(_JoinPrivateLeague value) joinPrivateLeague,
  }) {
    return joinPublicLeague(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUserCustomLeagues value)? getUserCustomLeagues,
    TResult Function(_GetCustomLeagueInfo value)? getCustomLeagueInfo,
    TResult Function(_JoinPublicLeague value)? joinPublicLeague,
    TResult Function(_JoinPrivateLeague value)? joinPrivateLeague,
  }) {
    return joinPublicLeague?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserCustomLeagues value)? getUserCustomLeagues,
    TResult Function(_GetCustomLeagueInfo value)? getCustomLeagueInfo,
    TResult Function(_JoinPublicLeague value)? joinPublicLeague,
    TResult Function(_JoinPrivateLeague value)? joinPrivateLeague,
    required TResult orElse(),
  }) {
    if (joinPublicLeague != null) {
      return joinPublicLeague(this);
    }
    return orElse();
  }
}

abstract class _JoinPublicLeague implements CustomLeaguesEvent {
  const factory _JoinPublicLeague({required int leagueId}) =
      _$_JoinPublicLeague;

  int get leagueId;
  @JsonKey(ignore: true)
  _$JoinPublicLeagueCopyWith<_JoinPublicLeague> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$JoinPrivateLeagueCopyWith<$Res> {
  factory _$JoinPrivateLeagueCopyWith(
          _JoinPrivateLeague value, $Res Function(_JoinPrivateLeague) then) =
      __$JoinPrivateLeagueCopyWithImpl<$Res>;
  $Res call({String leagueCode});
}

/// @nodoc
class __$JoinPrivateLeagueCopyWithImpl<$Res>
    extends _$CustomLeaguesEventCopyWithImpl<$Res>
    implements _$JoinPrivateLeagueCopyWith<$Res> {
  __$JoinPrivateLeagueCopyWithImpl(
      _JoinPrivateLeague _value, $Res Function(_JoinPrivateLeague) _then)
      : super(_value, (v) => _then(v as _JoinPrivateLeague));

  @override
  _JoinPrivateLeague get _value => super._value as _JoinPrivateLeague;

  @override
  $Res call({
    Object? leagueCode = freezed,
  }) {
    return _then(_JoinPrivateLeague(
      leagueCode: leagueCode == freezed
          ? _value.leagueCode
          : leagueCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_JoinPrivateLeague implements _JoinPrivateLeague {
  const _$_JoinPrivateLeague({required this.leagueCode});

  @override
  final String leagueCode;

  @override
  String toString() {
    return 'CustomLeaguesEvent.joinPrivateLeague(leagueCode: $leagueCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _JoinPrivateLeague &&
            const DeepCollectionEquality()
                .equals(other.leagueCode, leagueCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(leagueCode));

  @JsonKey(ignore: true)
  @override
  _$JoinPrivateLeagueCopyWith<_JoinPrivateLeague> get copyWith =>
      __$JoinPrivateLeagueCopyWithImpl<_JoinPrivateLeague>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getUserCustomLeagues,
    required TResult Function(int leagueId) getCustomLeagueInfo,
    required TResult Function(int leagueId) joinPublicLeague,
    required TResult Function(String leagueCode) joinPrivateLeague,
  }) {
    return joinPrivateLeague(leagueCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? getUserCustomLeagues,
    TResult Function(int leagueId)? getCustomLeagueInfo,
    TResult Function(int leagueId)? joinPublicLeague,
    TResult Function(String leagueCode)? joinPrivateLeague,
  }) {
    return joinPrivateLeague?.call(leagueCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getUserCustomLeagues,
    TResult Function(int leagueId)? getCustomLeagueInfo,
    TResult Function(int leagueId)? joinPublicLeague,
    TResult Function(String leagueCode)? joinPrivateLeague,
    required TResult orElse(),
  }) {
    if (joinPrivateLeague != null) {
      return joinPrivateLeague(leagueCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserCustomLeagues value) getUserCustomLeagues,
    required TResult Function(_GetCustomLeagueInfo value) getCustomLeagueInfo,
    required TResult Function(_JoinPublicLeague value) joinPublicLeague,
    required TResult Function(_JoinPrivateLeague value) joinPrivateLeague,
  }) {
    return joinPrivateLeague(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUserCustomLeagues value)? getUserCustomLeagues,
    TResult Function(_GetCustomLeagueInfo value)? getCustomLeagueInfo,
    TResult Function(_JoinPublicLeague value)? joinPublicLeague,
    TResult Function(_JoinPrivateLeague value)? joinPrivateLeague,
  }) {
    return joinPrivateLeague?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserCustomLeagues value)? getUserCustomLeagues,
    TResult Function(_GetCustomLeagueInfo value)? getCustomLeagueInfo,
    TResult Function(_JoinPublicLeague value)? joinPublicLeague,
    TResult Function(_JoinPrivateLeague value)? joinPrivateLeague,
    required TResult orElse(),
  }) {
    if (joinPrivateLeague != null) {
      return joinPrivateLeague(this);
    }
    return orElse();
  }
}

abstract class _JoinPrivateLeague implements CustomLeaguesEvent {
  const factory _JoinPrivateLeague({required String leagueCode}) =
      _$_JoinPrivateLeague;

  String get leagueCode;
  @JsonKey(ignore: true)
  _$JoinPrivateLeagueCopyWith<_JoinPrivateLeague> get copyWith =>
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

  _LoadCustomLeagueInfoSuccess loadCustomLeagueInfo(
      CustomLeaguesInfo customLeaguesInfo) {
    return _LoadCustomLeagueInfoSuccess(
      customLeaguesInfo,
    );
  }

  _LoadFailure loadFailure(CustomLeaguesFailures<dynamic> failure) {
    return _LoadFailure(
      failure,
    );
  }

  _CreateLeagueSuccess createLeagueSuccess(
      CustomLeaguesInfo customLeaguesInfo) {
    return _CreateLeagueSuccess(
      customLeaguesInfo,
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
    required TResult Function(CustomLeaguesInfo customLeaguesInfo)
        loadCustomLeagueInfo,
    required TResult Function(CustomLeaguesFailures<dynamic> failure)
        loadFailure,
    required TResult Function(CustomLeaguesInfo customLeaguesInfo)
        createLeagueSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<CustomLeagues> userCustomLeagues)?
        loadUserCustomLeaguesSuccess,
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? loadCustomLeagueInfo,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? createLeagueSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<CustomLeagues> userCustomLeagues)?
        loadUserCustomLeaguesSuccess,
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? loadCustomLeagueInfo,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? createLeagueSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadUserCustomLeaguesSuccess value)
        loadUserCustomLeaguesSuccess,
    required TResult Function(_LoadCustomLeagueInfoSuccess value)
        loadCustomLeagueInfo,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_CreateLeagueSuccess value) createLeagueSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadUserCustomLeaguesSuccess value)?
        loadUserCustomLeaguesSuccess,
    TResult Function(_LoadCustomLeagueInfoSuccess value)? loadCustomLeagueInfo,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_CreateLeagueSuccess value)? createLeagueSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadUserCustomLeaguesSuccess value)?
        loadUserCustomLeaguesSuccess,
    TResult Function(_LoadCustomLeagueInfoSuccess value)? loadCustomLeagueInfo,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_CreateLeagueSuccess value)? createLeagueSuccess,
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
    required TResult Function(CustomLeaguesInfo customLeaguesInfo)
        loadCustomLeagueInfo,
    required TResult Function(CustomLeaguesFailures<dynamic> failure)
        loadFailure,
    required TResult Function(CustomLeaguesInfo customLeaguesInfo)
        createLeagueSuccess,
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
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? loadCustomLeagueInfo,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? createLeagueSuccess,
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
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? loadCustomLeagueInfo,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? createLeagueSuccess,
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
    required TResult Function(_LoadCustomLeagueInfoSuccess value)
        loadCustomLeagueInfo,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_CreateLeagueSuccess value) createLeagueSuccess,
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
    TResult Function(_LoadCustomLeagueInfoSuccess value)? loadCustomLeagueInfo,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_CreateLeagueSuccess value)? createLeagueSuccess,
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
    TResult Function(_LoadCustomLeagueInfoSuccess value)? loadCustomLeagueInfo,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_CreateLeagueSuccess value)? createLeagueSuccess,
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
    required TResult Function(CustomLeaguesInfo customLeaguesInfo)
        loadCustomLeagueInfo,
    required TResult Function(CustomLeaguesFailures<dynamic> failure)
        loadFailure,
    required TResult Function(CustomLeaguesInfo customLeaguesInfo)
        createLeagueSuccess,
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
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? loadCustomLeagueInfo,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? createLeagueSuccess,
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
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? loadCustomLeagueInfo,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? createLeagueSuccess,
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
    required TResult Function(_LoadCustomLeagueInfoSuccess value)
        loadCustomLeagueInfo,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_CreateLeagueSuccess value) createLeagueSuccess,
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
    TResult Function(_LoadCustomLeagueInfoSuccess value)? loadCustomLeagueInfo,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_CreateLeagueSuccess value)? createLeagueSuccess,
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
    TResult Function(_LoadCustomLeagueInfoSuccess value)? loadCustomLeagueInfo,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_CreateLeagueSuccess value)? createLeagueSuccess,
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
    required TResult Function(CustomLeaguesInfo customLeaguesInfo)
        loadCustomLeagueInfo,
    required TResult Function(CustomLeaguesFailures<dynamic> failure)
        loadFailure,
    required TResult Function(CustomLeaguesInfo customLeaguesInfo)
        createLeagueSuccess,
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
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? loadCustomLeagueInfo,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? createLeagueSuccess,
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
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? loadCustomLeagueInfo,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? createLeagueSuccess,
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
    required TResult Function(_LoadCustomLeagueInfoSuccess value)
        loadCustomLeagueInfo,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_CreateLeagueSuccess value) createLeagueSuccess,
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
    TResult Function(_LoadCustomLeagueInfoSuccess value)? loadCustomLeagueInfo,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_CreateLeagueSuccess value)? createLeagueSuccess,
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
    TResult Function(_LoadCustomLeagueInfoSuccess value)? loadCustomLeagueInfo,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_CreateLeagueSuccess value)? createLeagueSuccess,
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
abstract class _$LoadCustomLeagueInfoSuccessCopyWith<$Res> {
  factory _$LoadCustomLeagueInfoSuccessCopyWith(
          _LoadCustomLeagueInfoSuccess value,
          $Res Function(_LoadCustomLeagueInfoSuccess) then) =
      __$LoadCustomLeagueInfoSuccessCopyWithImpl<$Res>;
  $Res call({CustomLeaguesInfo customLeaguesInfo});

  $CustomLeaguesInfoCopyWith<$Res> get customLeaguesInfo;
}

/// @nodoc
class __$LoadCustomLeagueInfoSuccessCopyWithImpl<$Res>
    extends _$CustomLeaguesStateCopyWithImpl<$Res>
    implements _$LoadCustomLeagueInfoSuccessCopyWith<$Res> {
  __$LoadCustomLeagueInfoSuccessCopyWithImpl(
      _LoadCustomLeagueInfoSuccess _value,
      $Res Function(_LoadCustomLeagueInfoSuccess) _then)
      : super(_value, (v) => _then(v as _LoadCustomLeagueInfoSuccess));

  @override
  _LoadCustomLeagueInfoSuccess get _value =>
      super._value as _LoadCustomLeagueInfoSuccess;

  @override
  $Res call({
    Object? customLeaguesInfo = freezed,
  }) {
    return _then(_LoadCustomLeagueInfoSuccess(
      customLeaguesInfo == freezed
          ? _value.customLeaguesInfo
          : customLeaguesInfo // ignore: cast_nullable_to_non_nullable
              as CustomLeaguesInfo,
    ));
  }

  @override
  $CustomLeaguesInfoCopyWith<$Res> get customLeaguesInfo {
    return $CustomLeaguesInfoCopyWith<$Res>(_value.customLeaguesInfo, (value) {
      return _then(_value.copyWith(customLeaguesInfo: value));
    });
  }
}

/// @nodoc

class _$_LoadCustomLeagueInfoSuccess implements _LoadCustomLeagueInfoSuccess {
  const _$_LoadCustomLeagueInfoSuccess(this.customLeaguesInfo);

  @override
  final CustomLeaguesInfo customLeaguesInfo;

  @override
  String toString() {
    return 'CustomLeaguesState.loadCustomLeagueInfo(customLeaguesInfo: $customLeaguesInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadCustomLeagueInfoSuccess &&
            const DeepCollectionEquality()
                .equals(other.customLeaguesInfo, customLeaguesInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(customLeaguesInfo));

  @JsonKey(ignore: true)
  @override
  _$LoadCustomLeagueInfoSuccessCopyWith<_LoadCustomLeagueInfoSuccess>
      get copyWith => __$LoadCustomLeagueInfoSuccessCopyWithImpl<
          _LoadCustomLeagueInfoSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<CustomLeagues> userCustomLeagues)
        loadUserCustomLeaguesSuccess,
    required TResult Function(CustomLeaguesInfo customLeaguesInfo)
        loadCustomLeagueInfo,
    required TResult Function(CustomLeaguesFailures<dynamic> failure)
        loadFailure,
    required TResult Function(CustomLeaguesInfo customLeaguesInfo)
        createLeagueSuccess,
  }) {
    return loadCustomLeagueInfo(customLeaguesInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<CustomLeagues> userCustomLeagues)?
        loadUserCustomLeaguesSuccess,
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? loadCustomLeagueInfo,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? createLeagueSuccess,
  }) {
    return loadCustomLeagueInfo?.call(customLeaguesInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<CustomLeagues> userCustomLeagues)?
        loadUserCustomLeaguesSuccess,
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? loadCustomLeagueInfo,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? createLeagueSuccess,
    required TResult orElse(),
  }) {
    if (loadCustomLeagueInfo != null) {
      return loadCustomLeagueInfo(customLeaguesInfo);
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
    required TResult Function(_LoadCustomLeagueInfoSuccess value)
        loadCustomLeagueInfo,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_CreateLeagueSuccess value) createLeagueSuccess,
  }) {
    return loadCustomLeagueInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadUserCustomLeaguesSuccess value)?
        loadUserCustomLeaguesSuccess,
    TResult Function(_LoadCustomLeagueInfoSuccess value)? loadCustomLeagueInfo,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_CreateLeagueSuccess value)? createLeagueSuccess,
  }) {
    return loadCustomLeagueInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadUserCustomLeaguesSuccess value)?
        loadUserCustomLeaguesSuccess,
    TResult Function(_LoadCustomLeagueInfoSuccess value)? loadCustomLeagueInfo,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_CreateLeagueSuccess value)? createLeagueSuccess,
    required TResult orElse(),
  }) {
    if (loadCustomLeagueInfo != null) {
      return loadCustomLeagueInfo(this);
    }
    return orElse();
  }
}

abstract class _LoadCustomLeagueInfoSuccess implements CustomLeaguesState {
  const factory _LoadCustomLeagueInfoSuccess(
      CustomLeaguesInfo customLeaguesInfo) = _$_LoadCustomLeagueInfoSuccess;

  CustomLeaguesInfo get customLeaguesInfo;
  @JsonKey(ignore: true)
  _$LoadCustomLeagueInfoSuccessCopyWith<_LoadCustomLeagueInfoSuccess>
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
    required TResult Function(CustomLeaguesInfo customLeaguesInfo)
        loadCustomLeagueInfo,
    required TResult Function(CustomLeaguesFailures<dynamic> failure)
        loadFailure,
    required TResult Function(CustomLeaguesInfo customLeaguesInfo)
        createLeagueSuccess,
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
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? loadCustomLeagueInfo,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? createLeagueSuccess,
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
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? loadCustomLeagueInfo,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? createLeagueSuccess,
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
    required TResult Function(_LoadCustomLeagueInfoSuccess value)
        loadCustomLeagueInfo,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_CreateLeagueSuccess value) createLeagueSuccess,
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
    TResult Function(_LoadCustomLeagueInfoSuccess value)? loadCustomLeagueInfo,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_CreateLeagueSuccess value)? createLeagueSuccess,
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
    TResult Function(_LoadCustomLeagueInfoSuccess value)? loadCustomLeagueInfo,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_CreateLeagueSuccess value)? createLeagueSuccess,
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

/// @nodoc
abstract class _$CreateLeagueSuccessCopyWith<$Res> {
  factory _$CreateLeagueSuccessCopyWith(_CreateLeagueSuccess value,
          $Res Function(_CreateLeagueSuccess) then) =
      __$CreateLeagueSuccessCopyWithImpl<$Res>;
  $Res call({CustomLeaguesInfo customLeaguesInfo});

  $CustomLeaguesInfoCopyWith<$Res> get customLeaguesInfo;
}

/// @nodoc
class __$CreateLeagueSuccessCopyWithImpl<$Res>
    extends _$CustomLeaguesStateCopyWithImpl<$Res>
    implements _$CreateLeagueSuccessCopyWith<$Res> {
  __$CreateLeagueSuccessCopyWithImpl(
      _CreateLeagueSuccess _value, $Res Function(_CreateLeagueSuccess) _then)
      : super(_value, (v) => _then(v as _CreateLeagueSuccess));

  @override
  _CreateLeagueSuccess get _value => super._value as _CreateLeagueSuccess;

  @override
  $Res call({
    Object? customLeaguesInfo = freezed,
  }) {
    return _then(_CreateLeagueSuccess(
      customLeaguesInfo == freezed
          ? _value.customLeaguesInfo
          : customLeaguesInfo // ignore: cast_nullable_to_non_nullable
              as CustomLeaguesInfo,
    ));
  }

  @override
  $CustomLeaguesInfoCopyWith<$Res> get customLeaguesInfo {
    return $CustomLeaguesInfoCopyWith<$Res>(_value.customLeaguesInfo, (value) {
      return _then(_value.copyWith(customLeaguesInfo: value));
    });
  }
}

/// @nodoc

class _$_CreateLeagueSuccess implements _CreateLeagueSuccess {
  const _$_CreateLeagueSuccess(this.customLeaguesInfo);

  @override
  final CustomLeaguesInfo customLeaguesInfo;

  @override
  String toString() {
    return 'CustomLeaguesState.createLeagueSuccess(customLeaguesInfo: $customLeaguesInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateLeagueSuccess &&
            const DeepCollectionEquality()
                .equals(other.customLeaguesInfo, customLeaguesInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(customLeaguesInfo));

  @JsonKey(ignore: true)
  @override
  _$CreateLeagueSuccessCopyWith<_CreateLeagueSuccess> get copyWith =>
      __$CreateLeagueSuccessCopyWithImpl<_CreateLeagueSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<CustomLeagues> userCustomLeagues)
        loadUserCustomLeaguesSuccess,
    required TResult Function(CustomLeaguesInfo customLeaguesInfo)
        loadCustomLeagueInfo,
    required TResult Function(CustomLeaguesFailures<dynamic> failure)
        loadFailure,
    required TResult Function(CustomLeaguesInfo customLeaguesInfo)
        createLeagueSuccess,
  }) {
    return createLeagueSuccess(customLeaguesInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<CustomLeagues> userCustomLeagues)?
        loadUserCustomLeaguesSuccess,
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? loadCustomLeagueInfo,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? createLeagueSuccess,
  }) {
    return createLeagueSuccess?.call(customLeaguesInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<CustomLeagues> userCustomLeagues)?
        loadUserCustomLeaguesSuccess,
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? loadCustomLeagueInfo,
    TResult Function(CustomLeaguesFailures<dynamic> failure)? loadFailure,
    TResult Function(CustomLeaguesInfo customLeaguesInfo)? createLeagueSuccess,
    required TResult orElse(),
  }) {
    if (createLeagueSuccess != null) {
      return createLeagueSuccess(customLeaguesInfo);
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
    required TResult Function(_LoadCustomLeagueInfoSuccess value)
        loadCustomLeagueInfo,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_CreateLeagueSuccess value) createLeagueSuccess,
  }) {
    return createLeagueSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadUserCustomLeaguesSuccess value)?
        loadUserCustomLeaguesSuccess,
    TResult Function(_LoadCustomLeagueInfoSuccess value)? loadCustomLeagueInfo,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_CreateLeagueSuccess value)? createLeagueSuccess,
  }) {
    return createLeagueSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadUserCustomLeaguesSuccess value)?
        loadUserCustomLeaguesSuccess,
    TResult Function(_LoadCustomLeagueInfoSuccess value)? loadCustomLeagueInfo,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_CreateLeagueSuccess value)? createLeagueSuccess,
    required TResult orElse(),
  }) {
    if (createLeagueSuccess != null) {
      return createLeagueSuccess(this);
    }
    return orElse();
  }
}

abstract class _CreateLeagueSuccess implements CustomLeaguesState {
  const factory _CreateLeagueSuccess(CustomLeaguesInfo customLeaguesInfo) =
      _$_CreateLeagueSuccess;

  CustomLeaguesInfo get customLeaguesInfo;
  @JsonKey(ignore: true)
  _$CreateLeagueSuccessCopyWith<_CreateLeagueSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
