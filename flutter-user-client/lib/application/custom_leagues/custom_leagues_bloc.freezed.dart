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

  _getCustomLeagueInfo getCustomLeagueInfo({required int leagueId}) {
    return _getCustomLeagueInfo(
      leagueId: leagueId,
    );
  }

  _joinPublicLeague joinPublicLeague({required int leagueId}) {
    return _joinPublicLeague(
      leagueId: leagueId,
    );
  }

  _joinPrivateLeague joinPrivateLeague({required String leagueCode}) {
    return _joinPrivateLeague(
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
    required TResult Function(_getUserCustomLeagues value) getUserCustomLeagues,
    required TResult Function(_getCustomLeagueInfo value) getCustomLeagueInfo,
    required TResult Function(_joinPublicLeague value) joinPublicLeague,
    required TResult Function(_joinPrivateLeague value) joinPrivateLeague,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_getUserCustomLeagues value)? getUserCustomLeagues,
    TResult Function(_getCustomLeagueInfo value)? getCustomLeagueInfo,
    TResult Function(_joinPublicLeague value)? joinPublicLeague,
    TResult Function(_joinPrivateLeague value)? joinPrivateLeague,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getUserCustomLeagues value)? getUserCustomLeagues,
    TResult Function(_getCustomLeagueInfo value)? getCustomLeagueInfo,
    TResult Function(_joinPublicLeague value)? joinPublicLeague,
    TResult Function(_joinPrivateLeague value)? joinPrivateLeague,
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
abstract class _$getUserCustomLeaguesCopyWith<$Res> {
  factory _$getUserCustomLeaguesCopyWith(_getUserCustomLeagues value,
          $Res Function(_getUserCustomLeagues) then) =
      __$getUserCustomLeaguesCopyWithImpl<$Res>;
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
    required TResult Function(_getUserCustomLeagues value) getUserCustomLeagues,
    required TResult Function(_getCustomLeagueInfo value) getCustomLeagueInfo,
    required TResult Function(_joinPublicLeague value) joinPublicLeague,
    required TResult Function(_joinPrivateLeague value) joinPrivateLeague,
  }) {
    return getUserCustomLeagues(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_getUserCustomLeagues value)? getUserCustomLeagues,
    TResult Function(_getCustomLeagueInfo value)? getCustomLeagueInfo,
    TResult Function(_joinPublicLeague value)? joinPublicLeague,
    TResult Function(_joinPrivateLeague value)? joinPrivateLeague,
  }) {
    return getUserCustomLeagues?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getUserCustomLeagues value)? getUserCustomLeagues,
    TResult Function(_getCustomLeagueInfo value)? getCustomLeagueInfo,
    TResult Function(_joinPublicLeague value)? joinPublicLeague,
    TResult Function(_joinPrivateLeague value)? joinPrivateLeague,
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

  String get userId;
  @JsonKey(ignore: true)
  _$getUserCustomLeaguesCopyWith<_getUserCustomLeagues> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$getCustomLeagueInfoCopyWith<$Res> {
  factory _$getCustomLeagueInfoCopyWith(_getCustomLeagueInfo value,
          $Res Function(_getCustomLeagueInfo) then) =
      __$getCustomLeagueInfoCopyWithImpl<$Res>;
  $Res call({int leagueId});
}

/// @nodoc
class __$getCustomLeagueInfoCopyWithImpl<$Res>
    extends _$CustomLeaguesEventCopyWithImpl<$Res>
    implements _$getCustomLeagueInfoCopyWith<$Res> {
  __$getCustomLeagueInfoCopyWithImpl(
      _getCustomLeagueInfo _value, $Res Function(_getCustomLeagueInfo) _then)
      : super(_value, (v) => _then(v as _getCustomLeagueInfo));

  @override
  _getCustomLeagueInfo get _value => super._value as _getCustomLeagueInfo;

  @override
  $Res call({
    Object? leagueId = freezed,
  }) {
    return _then(_getCustomLeagueInfo(
      leagueId: leagueId == freezed
          ? _value.leagueId
          : leagueId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_getCustomLeagueInfo implements _getCustomLeagueInfo {
  const _$_getCustomLeagueInfo({required this.leagueId});

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
            other is _getCustomLeagueInfo &&
            const DeepCollectionEquality().equals(other.leagueId, leagueId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(leagueId));

  @JsonKey(ignore: true)
  @override
  _$getCustomLeagueInfoCopyWith<_getCustomLeagueInfo> get copyWith =>
      __$getCustomLeagueInfoCopyWithImpl<_getCustomLeagueInfo>(
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
    required TResult Function(_getUserCustomLeagues value) getUserCustomLeagues,
    required TResult Function(_getCustomLeagueInfo value) getCustomLeagueInfo,
    required TResult Function(_joinPublicLeague value) joinPublicLeague,
    required TResult Function(_joinPrivateLeague value) joinPrivateLeague,
  }) {
    return getCustomLeagueInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_getUserCustomLeagues value)? getUserCustomLeagues,
    TResult Function(_getCustomLeagueInfo value)? getCustomLeagueInfo,
    TResult Function(_joinPublicLeague value)? joinPublicLeague,
    TResult Function(_joinPrivateLeague value)? joinPrivateLeague,
  }) {
    return getCustomLeagueInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getUserCustomLeagues value)? getUserCustomLeagues,
    TResult Function(_getCustomLeagueInfo value)? getCustomLeagueInfo,
    TResult Function(_joinPublicLeague value)? joinPublicLeague,
    TResult Function(_joinPrivateLeague value)? joinPrivateLeague,
    required TResult orElse(),
  }) {
    if (getCustomLeagueInfo != null) {
      return getCustomLeagueInfo(this);
    }
    return orElse();
  }
}

abstract class _getCustomLeagueInfo implements CustomLeaguesEvent {
  const factory _getCustomLeagueInfo({required int leagueId}) =
      _$_getCustomLeagueInfo;

  int get leagueId;
  @JsonKey(ignore: true)
  _$getCustomLeagueInfoCopyWith<_getCustomLeagueInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$joinPublicLeagueCopyWith<$Res> {
  factory _$joinPublicLeagueCopyWith(
          _joinPublicLeague value, $Res Function(_joinPublicLeague) then) =
      __$joinPublicLeagueCopyWithImpl<$Res>;
  $Res call({int leagueId});
}

/// @nodoc
class __$joinPublicLeagueCopyWithImpl<$Res>
    extends _$CustomLeaguesEventCopyWithImpl<$Res>
    implements _$joinPublicLeagueCopyWith<$Res> {
  __$joinPublicLeagueCopyWithImpl(
      _joinPublicLeague _value, $Res Function(_joinPublicLeague) _then)
      : super(_value, (v) => _then(v as _joinPublicLeague));

  @override
  _joinPublicLeague get _value => super._value as _joinPublicLeague;

  @override
  $Res call({
    Object? leagueId = freezed,
  }) {
    return _then(_joinPublicLeague(
      leagueId: leagueId == freezed
          ? _value.leagueId
          : leagueId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_joinPublicLeague implements _joinPublicLeague {
  const _$_joinPublicLeague({required this.leagueId});

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
            other is _joinPublicLeague &&
            const DeepCollectionEquality().equals(other.leagueId, leagueId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(leagueId));

  @JsonKey(ignore: true)
  @override
  _$joinPublicLeagueCopyWith<_joinPublicLeague> get copyWith =>
      __$joinPublicLeagueCopyWithImpl<_joinPublicLeague>(this, _$identity);

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
    required TResult Function(_getUserCustomLeagues value) getUserCustomLeagues,
    required TResult Function(_getCustomLeagueInfo value) getCustomLeagueInfo,
    required TResult Function(_joinPublicLeague value) joinPublicLeague,
    required TResult Function(_joinPrivateLeague value) joinPrivateLeague,
  }) {
    return joinPublicLeague(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_getUserCustomLeagues value)? getUserCustomLeagues,
    TResult Function(_getCustomLeagueInfo value)? getCustomLeagueInfo,
    TResult Function(_joinPublicLeague value)? joinPublicLeague,
    TResult Function(_joinPrivateLeague value)? joinPrivateLeague,
  }) {
    return joinPublicLeague?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getUserCustomLeagues value)? getUserCustomLeagues,
    TResult Function(_getCustomLeagueInfo value)? getCustomLeagueInfo,
    TResult Function(_joinPublicLeague value)? joinPublicLeague,
    TResult Function(_joinPrivateLeague value)? joinPrivateLeague,
    required TResult orElse(),
  }) {
    if (joinPublicLeague != null) {
      return joinPublicLeague(this);
    }
    return orElse();
  }
}

abstract class _joinPublicLeague implements CustomLeaguesEvent {
  const factory _joinPublicLeague({required int leagueId}) =
      _$_joinPublicLeague;

  int get leagueId;
  @JsonKey(ignore: true)
  _$joinPublicLeagueCopyWith<_joinPublicLeague> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$joinPrivateLeagueCopyWith<$Res> {
  factory _$joinPrivateLeagueCopyWith(
          _joinPrivateLeague value, $Res Function(_joinPrivateLeague) then) =
      __$joinPrivateLeagueCopyWithImpl<$Res>;
  $Res call({String leagueCode});
}

/// @nodoc
class __$joinPrivateLeagueCopyWithImpl<$Res>
    extends _$CustomLeaguesEventCopyWithImpl<$Res>
    implements _$joinPrivateLeagueCopyWith<$Res> {
  __$joinPrivateLeagueCopyWithImpl(
      _joinPrivateLeague _value, $Res Function(_joinPrivateLeague) _then)
      : super(_value, (v) => _then(v as _joinPrivateLeague));

  @override
  _joinPrivateLeague get _value => super._value as _joinPrivateLeague;

  @override
  $Res call({
    Object? leagueCode = freezed,
  }) {
    return _then(_joinPrivateLeague(
      leagueCode: leagueCode == freezed
          ? _value.leagueCode
          : leagueCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_joinPrivateLeague implements _joinPrivateLeague {
  const _$_joinPrivateLeague({required this.leagueCode});

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
            other is _joinPrivateLeague &&
            const DeepCollectionEquality()
                .equals(other.leagueCode, leagueCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(leagueCode));

  @JsonKey(ignore: true)
  @override
  _$joinPrivateLeagueCopyWith<_joinPrivateLeague> get copyWith =>
      __$joinPrivateLeagueCopyWithImpl<_joinPrivateLeague>(this, _$identity);

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
    required TResult Function(_getUserCustomLeagues value) getUserCustomLeagues,
    required TResult Function(_getCustomLeagueInfo value) getCustomLeagueInfo,
    required TResult Function(_joinPublicLeague value) joinPublicLeague,
    required TResult Function(_joinPrivateLeague value) joinPrivateLeague,
  }) {
    return joinPrivateLeague(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_getUserCustomLeagues value)? getUserCustomLeagues,
    TResult Function(_getCustomLeagueInfo value)? getCustomLeagueInfo,
    TResult Function(_joinPublicLeague value)? joinPublicLeague,
    TResult Function(_joinPrivateLeague value)? joinPrivateLeague,
  }) {
    return joinPrivateLeague?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getUserCustomLeagues value)? getUserCustomLeagues,
    TResult Function(_getCustomLeagueInfo value)? getCustomLeagueInfo,
    TResult Function(_joinPublicLeague value)? joinPublicLeague,
    TResult Function(_joinPrivateLeague value)? joinPrivateLeague,
    required TResult orElse(),
  }) {
    if (joinPrivateLeague != null) {
      return joinPrivateLeague(this);
    }
    return orElse();
  }
}

abstract class _joinPrivateLeague implements CustomLeaguesEvent {
  const factory _joinPrivateLeague({required String leagueCode}) =
      _$_joinPrivateLeague;

  String get leagueCode;
  @JsonKey(ignore: true)
  _$joinPrivateLeagueCopyWith<_joinPrivateLeague> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$CustomLeaguesStateTearOff {
  const _$CustomLeaguesStateTearOff();

  _CustomLeaguesState call(
      {required List<CustomLeagues> userCustomLeagues,
      required CustomLeaguesInfo customLeaguesInfo,
      required bool isLoading,
      required Option<Either<dynamic, dynamic>> valueFailureOrSuccess}) {
    return _CustomLeaguesState(
      userCustomLeagues: userCustomLeagues,
      customLeaguesInfo: customLeaguesInfo,
      isLoading: isLoading,
      valueFailureOrSuccess: valueFailureOrSuccess,
    );
  }
}

/// @nodoc
const $CustomLeaguesState = _$CustomLeaguesStateTearOff();

/// @nodoc
mixin _$CustomLeaguesState {
  List<CustomLeagues> get userCustomLeagues =>
      throw _privateConstructorUsedError;
  CustomLeaguesInfo get customLeaguesInfo => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<dynamic, dynamic>> get valueFailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomLeaguesStateCopyWith<CustomLeaguesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomLeaguesStateCopyWith<$Res> {
  factory $CustomLeaguesStateCopyWith(
          CustomLeaguesState value, $Res Function(CustomLeaguesState) then) =
      _$CustomLeaguesStateCopyWithImpl<$Res>;
  $Res call(
      {List<CustomLeagues> userCustomLeagues,
      CustomLeaguesInfo customLeaguesInfo,
      bool isLoading,
      Option<Either<dynamic, dynamic>> valueFailureOrSuccess});

  $CustomLeaguesInfoCopyWith<$Res> get customLeaguesInfo;
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
    Object? customLeaguesInfo = freezed,
    Object? isLoading = freezed,
    Object? valueFailureOrSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      userCustomLeagues: userCustomLeagues == freezed
          ? _value.userCustomLeagues
          : userCustomLeagues // ignore: cast_nullable_to_non_nullable
              as List<CustomLeagues>,
      customLeaguesInfo: customLeaguesInfo == freezed
          ? _value.customLeaguesInfo
          : customLeaguesInfo // ignore: cast_nullable_to_non_nullable
              as CustomLeaguesInfo,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      valueFailureOrSuccess: valueFailureOrSuccess == freezed
          ? _value.valueFailureOrSuccess
          : valueFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<dynamic, dynamic>>,
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
abstract class _$CustomLeaguesStateCopyWith<$Res>
    implements $CustomLeaguesStateCopyWith<$Res> {
  factory _$CustomLeaguesStateCopyWith(
          _CustomLeaguesState value, $Res Function(_CustomLeaguesState) then) =
      __$CustomLeaguesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<CustomLeagues> userCustomLeagues,
      CustomLeaguesInfo customLeaguesInfo,
      bool isLoading,
      Option<Either<dynamic, dynamic>> valueFailureOrSuccess});

  @override
  $CustomLeaguesInfoCopyWith<$Res> get customLeaguesInfo;
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
    Object? customLeaguesInfo = freezed,
    Object? isLoading = freezed,
    Object? valueFailureOrSuccess = freezed,
  }) {
    return _then(_CustomLeaguesState(
      userCustomLeagues: userCustomLeagues == freezed
          ? _value.userCustomLeagues
          : userCustomLeagues // ignore: cast_nullable_to_non_nullable
              as List<CustomLeagues>,
      customLeaguesInfo: customLeaguesInfo == freezed
          ? _value.customLeaguesInfo
          : customLeaguesInfo // ignore: cast_nullable_to_non_nullable
              as CustomLeaguesInfo,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      valueFailureOrSuccess: valueFailureOrSuccess == freezed
          ? _value.valueFailureOrSuccess
          : valueFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<dynamic, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_CustomLeaguesState implements _CustomLeaguesState {
  const _$_CustomLeaguesState(
      {required this.userCustomLeagues,
      required this.customLeaguesInfo,
      required this.isLoading,
      required this.valueFailureOrSuccess});

  @override
  final List<CustomLeagues> userCustomLeagues;
  @override
  final CustomLeaguesInfo customLeaguesInfo;
  @override
  final bool isLoading;
  @override
  final Option<Either<dynamic, dynamic>> valueFailureOrSuccess;

  @override
  String toString() {
    return 'CustomLeaguesState(userCustomLeagues: $userCustomLeagues, customLeaguesInfo: $customLeaguesInfo, isLoading: $isLoading, valueFailureOrSuccess: $valueFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomLeaguesState &&
            const DeepCollectionEquality()
                .equals(other.userCustomLeagues, userCustomLeagues) &&
            const DeepCollectionEquality()
                .equals(other.customLeaguesInfo, customLeaguesInfo) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.valueFailureOrSuccess, valueFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userCustomLeagues),
      const DeepCollectionEquality().hash(customLeaguesInfo),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(valueFailureOrSuccess));

  @JsonKey(ignore: true)
  @override
  _$CustomLeaguesStateCopyWith<_CustomLeaguesState> get copyWith =>
      __$CustomLeaguesStateCopyWithImpl<_CustomLeaguesState>(this, _$identity);
}

abstract class _CustomLeaguesState implements CustomLeaguesState {
  const factory _CustomLeaguesState(
          {required List<CustomLeagues> userCustomLeagues,
          required CustomLeaguesInfo customLeaguesInfo,
          required bool isLoading,
          required Option<Either<dynamic, dynamic>> valueFailureOrSuccess}) =
      _$_CustomLeaguesState;

  @override
  List<CustomLeagues> get userCustomLeagues;
  @override
  CustomLeaguesInfo get customLeaguesInfo;
  @override
  bool get isLoading;
  @override
  Option<Either<dynamic, dynamic>> get valueFailureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$CustomLeaguesStateCopyWith<_CustomLeaguesState> get copyWith =>
      throw _privateConstructorUsedError;
}
