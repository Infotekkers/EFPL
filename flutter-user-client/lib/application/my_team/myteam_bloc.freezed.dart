// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'myteam_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MyTeamEventTearOff {
  const _$MyTeamEventTearOff();

  _LoadMyTeam loadMyTeam(String userId) {
    return _LoadMyTeam(
      userId,
    );
  }

  _TransferOptionsRequested transferOptionsRequested(PlayerId playerId) {
    return _TransferOptionsRequested(
      playerId,
    );
  }

  _TransferConfirmed transferConfirmed(
      PlayerId playerOne, PlayerId playerTwo, MyTeam myTeam) {
    return _TransferConfirmed(
      playerOne,
      playerTwo,
      myTeam,
    );
  }

  _SaveMyTeam saveMyTeam(MyTeam myTeam) {
    return _SaveMyTeam(
      myTeam,
    );
  }
}

/// @nodoc
const $MyTeamEvent = _$MyTeamEventTearOff();

/// @nodoc
mixin _$MyTeamEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadMyTeam,
    required TResult Function(PlayerId playerId) transferOptionsRequested,
    required TResult Function(
            PlayerId playerOne, PlayerId playerTwo, MyTeam myTeam)
        transferConfirmed,
    required TResult Function(MyTeam myTeam) saveMyTeam,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? loadMyTeam,
    TResult Function(PlayerId playerId)? transferOptionsRequested,
    TResult Function(PlayerId playerOne, PlayerId playerTwo, MyTeam myTeam)?
        transferConfirmed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadMyTeam,
    TResult Function(PlayerId playerId)? transferOptionsRequested,
    TResult Function(PlayerId playerOne, PlayerId playerTwo, MyTeam myTeam)?
        transferConfirmed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMyTeam value) loadMyTeam,
    required TResult Function(_TransferOptionsRequested value)
        transferOptionsRequested,
    required TResult Function(_TransferConfirmed value) transferConfirmed,
    required TResult Function(_SaveMyTeam value) saveMyTeam,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadMyTeam value)? loadMyTeam,
    TResult Function(_TransferOptionsRequested value)? transferOptionsRequested,
    TResult Function(_TransferConfirmed value)? transferConfirmed,
    TResult Function(_SaveMyTeam value)? saveMyTeam,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMyTeam value)? loadMyTeam,
    TResult Function(_TransferOptionsRequested value)? transferOptionsRequested,
    TResult Function(_TransferConfirmed value)? transferConfirmed,
    TResult Function(_SaveMyTeam value)? saveMyTeam,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyTeamEventCopyWith<$Res> {
  factory $MyTeamEventCopyWith(
          MyTeamEvent value, $Res Function(MyTeamEvent) then) =
      _$MyTeamEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$MyTeamEventCopyWithImpl<$Res> implements $MyTeamEventCopyWith<$Res> {
  _$MyTeamEventCopyWithImpl(this._value, this._then);

  final MyTeamEvent _value;
  // ignore: unused_field
  final $Res Function(MyTeamEvent) _then;
}

/// @nodoc
abstract class _$LoadMyTeamCopyWith<$Res> {
  factory _$LoadMyTeamCopyWith(
          _LoadMyTeam value, $Res Function(_LoadMyTeam) then) =
      __$LoadMyTeamCopyWithImpl<$Res>;
  $Res call({String userId});
}

/// @nodoc
class __$LoadMyTeamCopyWithImpl<$Res> extends _$MyTeamEventCopyWithImpl<$Res>
    implements _$LoadMyTeamCopyWith<$Res> {
  __$LoadMyTeamCopyWithImpl(
      _LoadMyTeam _value, $Res Function(_LoadMyTeam) _then)
      : super(_value, (v) => _then(v as _LoadMyTeam));

  @override
  _LoadMyTeam get _value => super._value as _LoadMyTeam;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_LoadMyTeam(
      userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoadMyTeam implements _LoadMyTeam {
  const _$_LoadMyTeam(this.userId);

  @override
  final String userId;

  @override
  String toString() {
    return 'MyTeamEvent.loadMyTeam(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadMyTeam &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$LoadMyTeamCopyWith<_LoadMyTeam> get copyWith =>
      __$LoadMyTeamCopyWithImpl<_LoadMyTeam>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadMyTeam,
    required TResult Function(PlayerId playerId) transferOptionsRequested,
    required TResult Function(
            PlayerId playerOne, PlayerId playerTwo, MyTeam myTeam)
        transferConfirmed,
    required TResult Function(MyTeam myTeam) saveMyTeam,
  }) {
    return loadMyTeam(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? loadMyTeam,
    TResult Function(PlayerId playerId)? transferOptionsRequested,
    TResult Function(PlayerId playerOne, PlayerId playerTwo, MyTeam myTeam)?
        transferConfirmed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
  }) {
    return loadMyTeam?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadMyTeam,
    TResult Function(PlayerId playerId)? transferOptionsRequested,
    TResult Function(PlayerId playerOne, PlayerId playerTwo, MyTeam myTeam)?
        transferConfirmed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
    required TResult orElse(),
  }) {
    if (loadMyTeam != null) {
      return loadMyTeam(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMyTeam value) loadMyTeam,
    required TResult Function(_TransferOptionsRequested value)
        transferOptionsRequested,
    required TResult Function(_TransferConfirmed value) transferConfirmed,
    required TResult Function(_SaveMyTeam value) saveMyTeam,
  }) {
    return loadMyTeam(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadMyTeam value)? loadMyTeam,
    TResult Function(_TransferOptionsRequested value)? transferOptionsRequested,
    TResult Function(_TransferConfirmed value)? transferConfirmed,
    TResult Function(_SaveMyTeam value)? saveMyTeam,
  }) {
    return loadMyTeam?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMyTeam value)? loadMyTeam,
    TResult Function(_TransferOptionsRequested value)? transferOptionsRequested,
    TResult Function(_TransferConfirmed value)? transferConfirmed,
    TResult Function(_SaveMyTeam value)? saveMyTeam,
    required TResult orElse(),
  }) {
    if (loadMyTeam != null) {
      return loadMyTeam(this);
    }
    return orElse();
  }
}

abstract class _LoadMyTeam implements MyTeamEvent {
  const factory _LoadMyTeam(String userId) = _$_LoadMyTeam;

  String get userId;
  @JsonKey(ignore: true)
  _$LoadMyTeamCopyWith<_LoadMyTeam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TransferOptionsRequestedCopyWith<$Res> {
  factory _$TransferOptionsRequestedCopyWith(_TransferOptionsRequested value,
          $Res Function(_TransferOptionsRequested) then) =
      __$TransferOptionsRequestedCopyWithImpl<$Res>;
  $Res call({PlayerId playerId});
}

/// @nodoc
class __$TransferOptionsRequestedCopyWithImpl<$Res>
    extends _$MyTeamEventCopyWithImpl<$Res>
    implements _$TransferOptionsRequestedCopyWith<$Res> {
  __$TransferOptionsRequestedCopyWithImpl(_TransferOptionsRequested _value,
      $Res Function(_TransferOptionsRequested) _then)
      : super(_value, (v) => _then(v as _TransferOptionsRequested));

  @override
  _TransferOptionsRequested get _value =>
      super._value as _TransferOptionsRequested;

  @override
  $Res call({
    Object? playerId = freezed,
  }) {
    return _then(_TransferOptionsRequested(
      playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as PlayerId,
    ));
  }
}

/// @nodoc

class _$_TransferOptionsRequested implements _TransferOptionsRequested {
  const _$_TransferOptionsRequested(this.playerId);

  @override
  final PlayerId playerId;

  @override
  String toString() {
    return 'MyTeamEvent.transferOptionsRequested(playerId: $playerId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TransferOptionsRequested &&
            const DeepCollectionEquality().equals(other.playerId, playerId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(playerId));

  @JsonKey(ignore: true)
  @override
  _$TransferOptionsRequestedCopyWith<_TransferOptionsRequested> get copyWith =>
      __$TransferOptionsRequestedCopyWithImpl<_TransferOptionsRequested>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadMyTeam,
    required TResult Function(PlayerId playerId) transferOptionsRequested,
    required TResult Function(
            PlayerId playerOne, PlayerId playerTwo, MyTeam myTeam)
        transferConfirmed,
    required TResult Function(MyTeam myTeam) saveMyTeam,
  }) {
    return transferOptionsRequested(playerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? loadMyTeam,
    TResult Function(PlayerId playerId)? transferOptionsRequested,
    TResult Function(PlayerId playerOne, PlayerId playerTwo, MyTeam myTeam)?
        transferConfirmed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
  }) {
    return transferOptionsRequested?.call(playerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadMyTeam,
    TResult Function(PlayerId playerId)? transferOptionsRequested,
    TResult Function(PlayerId playerOne, PlayerId playerTwo, MyTeam myTeam)?
        transferConfirmed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
    required TResult orElse(),
  }) {
    if (transferOptionsRequested != null) {
      return transferOptionsRequested(playerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMyTeam value) loadMyTeam,
    required TResult Function(_TransferOptionsRequested value)
        transferOptionsRequested,
    required TResult Function(_TransferConfirmed value) transferConfirmed,
    required TResult Function(_SaveMyTeam value) saveMyTeam,
  }) {
    return transferOptionsRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadMyTeam value)? loadMyTeam,
    TResult Function(_TransferOptionsRequested value)? transferOptionsRequested,
    TResult Function(_TransferConfirmed value)? transferConfirmed,
    TResult Function(_SaveMyTeam value)? saveMyTeam,
  }) {
    return transferOptionsRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMyTeam value)? loadMyTeam,
    TResult Function(_TransferOptionsRequested value)? transferOptionsRequested,
    TResult Function(_TransferConfirmed value)? transferConfirmed,
    TResult Function(_SaveMyTeam value)? saveMyTeam,
    required TResult orElse(),
  }) {
    if (transferOptionsRequested != null) {
      return transferOptionsRequested(this);
    }
    return orElse();
  }
}

abstract class _TransferOptionsRequested implements MyTeamEvent {
  const factory _TransferOptionsRequested(PlayerId playerId) =
      _$_TransferOptionsRequested;

  PlayerId get playerId;
  @JsonKey(ignore: true)
  _$TransferOptionsRequestedCopyWith<_TransferOptionsRequested> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TransferConfirmedCopyWith<$Res> {
  factory _$TransferConfirmedCopyWith(
          _TransferConfirmed value, $Res Function(_TransferConfirmed) then) =
      __$TransferConfirmedCopyWithImpl<$Res>;
  $Res call({PlayerId playerOne, PlayerId playerTwo, MyTeam myTeam});

  $MyTeamCopyWith<$Res> get myTeam;
}

/// @nodoc
class __$TransferConfirmedCopyWithImpl<$Res>
    extends _$MyTeamEventCopyWithImpl<$Res>
    implements _$TransferConfirmedCopyWith<$Res> {
  __$TransferConfirmedCopyWithImpl(
      _TransferConfirmed _value, $Res Function(_TransferConfirmed) _then)
      : super(_value, (v) => _then(v as _TransferConfirmed));

  @override
  _TransferConfirmed get _value => super._value as _TransferConfirmed;

  @override
  $Res call({
    Object? playerOne = freezed,
    Object? playerTwo = freezed,
    Object? myTeam = freezed,
  }) {
    return _then(_TransferConfirmed(
      playerOne == freezed
          ? _value.playerOne
          : playerOne // ignore: cast_nullable_to_non_nullable
              as PlayerId,
      playerTwo == freezed
          ? _value.playerTwo
          : playerTwo // ignore: cast_nullable_to_non_nullable
              as PlayerId,
      myTeam == freezed
          ? _value.myTeam
          : myTeam // ignore: cast_nullable_to_non_nullable
              as MyTeam,
    ));
  }

  @override
  $MyTeamCopyWith<$Res> get myTeam {
    return $MyTeamCopyWith<$Res>(_value.myTeam, (value) {
      return _then(_value.copyWith(myTeam: value));
    });
  }
}

/// @nodoc

class _$_TransferConfirmed implements _TransferConfirmed {
  const _$_TransferConfirmed(this.playerOne, this.playerTwo, this.myTeam);

  @override
  final PlayerId playerOne;
  @override
  final PlayerId playerTwo;
  @override
  final MyTeam myTeam;

  @override
  String toString() {
    return 'MyTeamEvent.transferConfirmed(playerOne: $playerOne, playerTwo: $playerTwo, myTeam: $myTeam)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TransferConfirmed &&
            const DeepCollectionEquality().equals(other.playerOne, playerOne) &&
            const DeepCollectionEquality().equals(other.playerTwo, playerTwo) &&
            const DeepCollectionEquality().equals(other.myTeam, myTeam));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerOne),
      const DeepCollectionEquality().hash(playerTwo),
      const DeepCollectionEquality().hash(myTeam));

  @JsonKey(ignore: true)
  @override
  _$TransferConfirmedCopyWith<_TransferConfirmed> get copyWith =>
      __$TransferConfirmedCopyWithImpl<_TransferConfirmed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadMyTeam,
    required TResult Function(PlayerId playerId) transferOptionsRequested,
    required TResult Function(
            PlayerId playerOne, PlayerId playerTwo, MyTeam myTeam)
        transferConfirmed,
    required TResult Function(MyTeam myTeam) saveMyTeam,
  }) {
    return transferConfirmed(playerOne, playerTwo, myTeam);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? loadMyTeam,
    TResult Function(PlayerId playerId)? transferOptionsRequested,
    TResult Function(PlayerId playerOne, PlayerId playerTwo, MyTeam myTeam)?
        transferConfirmed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
  }) {
    return transferConfirmed?.call(playerOne, playerTwo, myTeam);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadMyTeam,
    TResult Function(PlayerId playerId)? transferOptionsRequested,
    TResult Function(PlayerId playerOne, PlayerId playerTwo, MyTeam myTeam)?
        transferConfirmed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
    required TResult orElse(),
  }) {
    if (transferConfirmed != null) {
      return transferConfirmed(playerOne, playerTwo, myTeam);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMyTeam value) loadMyTeam,
    required TResult Function(_TransferOptionsRequested value)
        transferOptionsRequested,
    required TResult Function(_TransferConfirmed value) transferConfirmed,
    required TResult Function(_SaveMyTeam value) saveMyTeam,
  }) {
    return transferConfirmed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadMyTeam value)? loadMyTeam,
    TResult Function(_TransferOptionsRequested value)? transferOptionsRequested,
    TResult Function(_TransferConfirmed value)? transferConfirmed,
    TResult Function(_SaveMyTeam value)? saveMyTeam,
  }) {
    return transferConfirmed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMyTeam value)? loadMyTeam,
    TResult Function(_TransferOptionsRequested value)? transferOptionsRequested,
    TResult Function(_TransferConfirmed value)? transferConfirmed,
    TResult Function(_SaveMyTeam value)? saveMyTeam,
    required TResult orElse(),
  }) {
    if (transferConfirmed != null) {
      return transferConfirmed(this);
    }
    return orElse();
  }
}

abstract class _TransferConfirmed implements MyTeamEvent {
  const factory _TransferConfirmed(
          PlayerId playerOne, PlayerId playerTwo, MyTeam myTeam) =
      _$_TransferConfirmed;

  PlayerId get playerOne;
  PlayerId get playerTwo;
  MyTeam get myTeam;
  @JsonKey(ignore: true)
  _$TransferConfirmedCopyWith<_TransferConfirmed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SaveMyTeamCopyWith<$Res> {
  factory _$SaveMyTeamCopyWith(
          _SaveMyTeam value, $Res Function(_SaveMyTeam) then) =
      __$SaveMyTeamCopyWithImpl<$Res>;
  $Res call({MyTeam myTeam});

  $MyTeamCopyWith<$Res> get myTeam;
}

/// @nodoc
class __$SaveMyTeamCopyWithImpl<$Res> extends _$MyTeamEventCopyWithImpl<$Res>
    implements _$SaveMyTeamCopyWith<$Res> {
  __$SaveMyTeamCopyWithImpl(
      _SaveMyTeam _value, $Res Function(_SaveMyTeam) _then)
      : super(_value, (v) => _then(v as _SaveMyTeam));

  @override
  _SaveMyTeam get _value => super._value as _SaveMyTeam;

  @override
  $Res call({
    Object? myTeam = freezed,
  }) {
    return _then(_SaveMyTeam(
      myTeam == freezed
          ? _value.myTeam
          : myTeam // ignore: cast_nullable_to_non_nullable
              as MyTeam,
    ));
  }

  @override
  $MyTeamCopyWith<$Res> get myTeam {
    return $MyTeamCopyWith<$Res>(_value.myTeam, (value) {
      return _then(_value.copyWith(myTeam: value));
    });
  }
}

/// @nodoc

class _$_SaveMyTeam implements _SaveMyTeam {
  const _$_SaveMyTeam(this.myTeam);

  @override
  final MyTeam myTeam;

  @override
  String toString() {
    return 'MyTeamEvent.saveMyTeam(myTeam: $myTeam)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaveMyTeam &&
            const DeepCollectionEquality().equals(other.myTeam, myTeam));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(myTeam));

  @JsonKey(ignore: true)
  @override
  _$SaveMyTeamCopyWith<_SaveMyTeam> get copyWith =>
      __$SaveMyTeamCopyWithImpl<_SaveMyTeam>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadMyTeam,
    required TResult Function(PlayerId playerId) transferOptionsRequested,
    required TResult Function(
            PlayerId playerOne, PlayerId playerTwo, MyTeam myTeam)
        transferConfirmed,
    required TResult Function(MyTeam myTeam) saveMyTeam,
  }) {
    return saveMyTeam(myTeam);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? loadMyTeam,
    TResult Function(PlayerId playerId)? transferOptionsRequested,
    TResult Function(PlayerId playerOne, PlayerId playerTwo, MyTeam myTeam)?
        transferConfirmed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
  }) {
    return saveMyTeam?.call(myTeam);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadMyTeam,
    TResult Function(PlayerId playerId)? transferOptionsRequested,
    TResult Function(PlayerId playerOne, PlayerId playerTwo, MyTeam myTeam)?
        transferConfirmed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
    required TResult orElse(),
  }) {
    if (saveMyTeam != null) {
      return saveMyTeam(myTeam);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMyTeam value) loadMyTeam,
    required TResult Function(_TransferOptionsRequested value)
        transferOptionsRequested,
    required TResult Function(_TransferConfirmed value) transferConfirmed,
    required TResult Function(_SaveMyTeam value) saveMyTeam,
  }) {
    return saveMyTeam(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadMyTeam value)? loadMyTeam,
    TResult Function(_TransferOptionsRequested value)? transferOptionsRequested,
    TResult Function(_TransferConfirmed value)? transferConfirmed,
    TResult Function(_SaveMyTeam value)? saveMyTeam,
  }) {
    return saveMyTeam?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMyTeam value)? loadMyTeam,
    TResult Function(_TransferOptionsRequested value)? transferOptionsRequested,
    TResult Function(_TransferConfirmed value)? transferConfirmed,
    TResult Function(_SaveMyTeam value)? saveMyTeam,
    required TResult orElse(),
  }) {
    if (saveMyTeam != null) {
      return saveMyTeam(this);
    }
    return orElse();
  }
}

abstract class _SaveMyTeam implements MyTeamEvent {
  const factory _SaveMyTeam(MyTeam myTeam) = _$_SaveMyTeam;

  MyTeam get myTeam;
  @JsonKey(ignore: true)
  _$SaveMyTeamCopyWith<_SaveMyTeam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$MyTeamStateTearOff {
  const _$MyTeamStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loading loadInProgress() {
    return const _Loading();
  }

  _LoadSuccess loadSuccess(MyTeam myTeam) {
    return _LoadSuccess(
      myTeam,
    );
  }

  _LoadFailure loadFailure(MyTeamFailure myTeamFailure) {
    return _LoadFailure(
      myTeamFailure,
    );
  }

  _TransferOptionsLoaded transferOptionsLoaded(List<PlayerId> validTransfers) {
    return _TransferOptionsLoaded(
      validTransfers,
    );
  }

  _TransferApproved transferApproved(MyTeam myTeam) {
    return _TransferApproved(
      myTeam,
    );
  }
}

/// @nodoc
const $MyTeamState = _$MyTeamStateTearOff();

/// @nodoc
mixin _$MyTeamState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(MyTeam myTeam) loadSuccess,
    required TResult Function(MyTeamFailure myTeamFailure) loadFailure,
    required TResult Function(List<PlayerId> validTransfers)
        transferOptionsLoaded,
    required TResult Function(MyTeam myTeam) transferApproved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<PlayerId> validTransfers)? transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<PlayerId> validTransfers)? transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_TransferOptionsLoaded value)
        transferOptionsLoaded,
    required TResult Function(_TransferApproved value) transferApproved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_TransferOptionsLoaded value)? transferOptionsLoaded,
    TResult Function(_TransferApproved value)? transferApproved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_TransferOptionsLoaded value)? transferOptionsLoaded,
    TResult Function(_TransferApproved value)? transferApproved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyTeamStateCopyWith<$Res> {
  factory $MyTeamStateCopyWith(
          MyTeamState value, $Res Function(MyTeamState) then) =
      _$MyTeamStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MyTeamStateCopyWithImpl<$Res> implements $MyTeamStateCopyWith<$Res> {
  _$MyTeamStateCopyWithImpl(this._value, this._then);

  final MyTeamState _value;
  // ignore: unused_field
  final $Res Function(MyTeamState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$MyTeamStateCopyWithImpl<$Res>
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
    return 'MyTeamState.initial()';
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
    required TResult Function(MyTeam myTeam) loadSuccess,
    required TResult Function(MyTeamFailure myTeamFailure) loadFailure,
    required TResult Function(List<PlayerId> validTransfers)
        transferOptionsLoaded,
    required TResult Function(MyTeam myTeam) transferApproved,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<PlayerId> validTransfers)? transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<PlayerId> validTransfers)? transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
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
    required TResult Function(_Loading value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_TransferOptionsLoaded value)
        transferOptionsLoaded,
    required TResult Function(_TransferApproved value) transferApproved,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_TransferOptionsLoaded value)? transferOptionsLoaded,
    TResult Function(_TransferApproved value)? transferApproved,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_TransferOptionsLoaded value)? transferOptionsLoaded,
    TResult Function(_TransferApproved value)? transferApproved,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MyTeamState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$MyTeamStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'MyTeamState.loadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(MyTeam myTeam) loadSuccess,
    required TResult Function(MyTeamFailure myTeamFailure) loadFailure,
    required TResult Function(List<PlayerId> validTransfers)
        transferOptionsLoaded,
    required TResult Function(MyTeam myTeam) transferApproved,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<PlayerId> validTransfers)? transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<PlayerId> validTransfers)? transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
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
    required TResult Function(_Loading value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_TransferOptionsLoaded value)
        transferOptionsLoaded,
    required TResult Function(_TransferApproved value) transferApproved,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_TransferOptionsLoaded value)? transferOptionsLoaded,
    TResult Function(_TransferApproved value)? transferApproved,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_TransferOptionsLoaded value)? transferOptionsLoaded,
    TResult Function(_TransferApproved value)? transferApproved,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _Loading implements MyTeamState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$LoadSuccessCopyWith<$Res> {
  factory _$LoadSuccessCopyWith(
          _LoadSuccess value, $Res Function(_LoadSuccess) then) =
      __$LoadSuccessCopyWithImpl<$Res>;
  $Res call({MyTeam myTeam});

  $MyTeamCopyWith<$Res> get myTeam;
}

/// @nodoc
class __$LoadSuccessCopyWithImpl<$Res> extends _$MyTeamStateCopyWithImpl<$Res>
    implements _$LoadSuccessCopyWith<$Res> {
  __$LoadSuccessCopyWithImpl(
      _LoadSuccess _value, $Res Function(_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _LoadSuccess));

  @override
  _LoadSuccess get _value => super._value as _LoadSuccess;

  @override
  $Res call({
    Object? myTeam = freezed,
  }) {
    return _then(_LoadSuccess(
      myTeam == freezed
          ? _value.myTeam
          : myTeam // ignore: cast_nullable_to_non_nullable
              as MyTeam,
    ));
  }

  @override
  $MyTeamCopyWith<$Res> get myTeam {
    return $MyTeamCopyWith<$Res>(_value.myTeam, (value) {
      return _then(_value.copyWith(myTeam: value));
    });
  }
}

/// @nodoc

class _$_LoadSuccess implements _LoadSuccess {
  const _$_LoadSuccess(this.myTeam);

  @override
  final MyTeam myTeam;

  @override
  String toString() {
    return 'MyTeamState.loadSuccess(myTeam: $myTeam)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadSuccess &&
            const DeepCollectionEquality().equals(other.myTeam, myTeam));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(myTeam));

  @JsonKey(ignore: true)
  @override
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      __$LoadSuccessCopyWithImpl<_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(MyTeam myTeam) loadSuccess,
    required TResult Function(MyTeamFailure myTeamFailure) loadFailure,
    required TResult Function(List<PlayerId> validTransfers)
        transferOptionsLoaded,
    required TResult Function(MyTeam myTeam) transferApproved,
  }) {
    return loadSuccess(myTeam);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<PlayerId> validTransfers)? transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
  }) {
    return loadSuccess?.call(myTeam);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<PlayerId> validTransfers)? transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(myTeam);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_TransferOptionsLoaded value)
        transferOptionsLoaded,
    required TResult Function(_TransferApproved value) transferApproved,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_TransferOptionsLoaded value)? transferOptionsLoaded,
    TResult Function(_TransferApproved value)? transferApproved,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_TransferOptionsLoaded value)? transferOptionsLoaded,
    TResult Function(_TransferApproved value)? transferApproved,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess implements MyTeamState {
  const factory _LoadSuccess(MyTeam myTeam) = _$_LoadSuccess;

  MyTeam get myTeam;
  @JsonKey(ignore: true)
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadFailureCopyWith<$Res> {
  factory _$LoadFailureCopyWith(
          _LoadFailure value, $Res Function(_LoadFailure) then) =
      __$LoadFailureCopyWithImpl<$Res>;
  $Res call({MyTeamFailure myTeamFailure});

  $MyTeamFailureCopyWith<$Res> get myTeamFailure;
}

/// @nodoc
class __$LoadFailureCopyWithImpl<$Res> extends _$MyTeamStateCopyWithImpl<$Res>
    implements _$LoadFailureCopyWith<$Res> {
  __$LoadFailureCopyWithImpl(
      _LoadFailure _value, $Res Function(_LoadFailure) _then)
      : super(_value, (v) => _then(v as _LoadFailure));

  @override
  _LoadFailure get _value => super._value as _LoadFailure;

  @override
  $Res call({
    Object? myTeamFailure = freezed,
  }) {
    return _then(_LoadFailure(
      myTeamFailure == freezed
          ? _value.myTeamFailure
          : myTeamFailure // ignore: cast_nullable_to_non_nullable
              as MyTeamFailure,
    ));
  }

  @override
  $MyTeamFailureCopyWith<$Res> get myTeamFailure {
    return $MyTeamFailureCopyWith<$Res>(_value.myTeamFailure, (value) {
      return _then(_value.copyWith(myTeamFailure: value));
    });
  }
}

/// @nodoc

class _$_LoadFailure implements _LoadFailure {
  const _$_LoadFailure(this.myTeamFailure);

  @override
  final MyTeamFailure myTeamFailure;

  @override
  String toString() {
    return 'MyTeamState.loadFailure(myTeamFailure: $myTeamFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadFailure &&
            const DeepCollectionEquality()
                .equals(other.myTeamFailure, myTeamFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(myTeamFailure));

  @JsonKey(ignore: true)
  @override
  _$LoadFailureCopyWith<_LoadFailure> get copyWith =>
      __$LoadFailureCopyWithImpl<_LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(MyTeam myTeam) loadSuccess,
    required TResult Function(MyTeamFailure myTeamFailure) loadFailure,
    required TResult Function(List<PlayerId> validTransfers)
        transferOptionsLoaded,
    required TResult Function(MyTeam myTeam) transferApproved,
  }) {
    return loadFailure(myTeamFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<PlayerId> validTransfers)? transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
  }) {
    return loadFailure?.call(myTeamFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<PlayerId> validTransfers)? transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(myTeamFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_TransferOptionsLoaded value)
        transferOptionsLoaded,
    required TResult Function(_TransferApproved value) transferApproved,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_TransferOptionsLoaded value)? transferOptionsLoaded,
    TResult Function(_TransferApproved value)? transferApproved,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_TransferOptionsLoaded value)? transferOptionsLoaded,
    TResult Function(_TransferApproved value)? transferApproved,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure implements MyTeamState {
  const factory _LoadFailure(MyTeamFailure myTeamFailure) = _$_LoadFailure;

  MyTeamFailure get myTeamFailure;
  @JsonKey(ignore: true)
  _$LoadFailureCopyWith<_LoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TransferOptionsLoadedCopyWith<$Res> {
  factory _$TransferOptionsLoadedCopyWith(_TransferOptionsLoaded value,
          $Res Function(_TransferOptionsLoaded) then) =
      __$TransferOptionsLoadedCopyWithImpl<$Res>;
  $Res call({List<PlayerId> validTransfers});
}

/// @nodoc
class __$TransferOptionsLoadedCopyWithImpl<$Res>
    extends _$MyTeamStateCopyWithImpl<$Res>
    implements _$TransferOptionsLoadedCopyWith<$Res> {
  __$TransferOptionsLoadedCopyWithImpl(_TransferOptionsLoaded _value,
      $Res Function(_TransferOptionsLoaded) _then)
      : super(_value, (v) => _then(v as _TransferOptionsLoaded));

  @override
  _TransferOptionsLoaded get _value => super._value as _TransferOptionsLoaded;

  @override
  $Res call({
    Object? validTransfers = freezed,
  }) {
    return _then(_TransferOptionsLoaded(
      validTransfers == freezed
          ? _value.validTransfers
          : validTransfers // ignore: cast_nullable_to_non_nullable
              as List<PlayerId>,
    ));
  }
}

/// @nodoc

class _$_TransferOptionsLoaded implements _TransferOptionsLoaded {
  const _$_TransferOptionsLoaded(this.validTransfers);

  @override
  final List<PlayerId> validTransfers;

  @override
  String toString() {
    return 'MyTeamState.transferOptionsLoaded(validTransfers: $validTransfers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TransferOptionsLoaded &&
            const DeepCollectionEquality()
                .equals(other.validTransfers, validTransfers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(validTransfers));

  @JsonKey(ignore: true)
  @override
  _$TransferOptionsLoadedCopyWith<_TransferOptionsLoaded> get copyWith =>
      __$TransferOptionsLoadedCopyWithImpl<_TransferOptionsLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(MyTeam myTeam) loadSuccess,
    required TResult Function(MyTeamFailure myTeamFailure) loadFailure,
    required TResult Function(List<PlayerId> validTransfers)
        transferOptionsLoaded,
    required TResult Function(MyTeam myTeam) transferApproved,
  }) {
    return transferOptionsLoaded(validTransfers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<PlayerId> validTransfers)? transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
  }) {
    return transferOptionsLoaded?.call(validTransfers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<PlayerId> validTransfers)? transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    required TResult orElse(),
  }) {
    if (transferOptionsLoaded != null) {
      return transferOptionsLoaded(validTransfers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_TransferOptionsLoaded value)
        transferOptionsLoaded,
    required TResult Function(_TransferApproved value) transferApproved,
  }) {
    return transferOptionsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_TransferOptionsLoaded value)? transferOptionsLoaded,
    TResult Function(_TransferApproved value)? transferApproved,
  }) {
    return transferOptionsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_TransferOptionsLoaded value)? transferOptionsLoaded,
    TResult Function(_TransferApproved value)? transferApproved,
    required TResult orElse(),
  }) {
    if (transferOptionsLoaded != null) {
      return transferOptionsLoaded(this);
    }
    return orElse();
  }
}

abstract class _TransferOptionsLoaded implements MyTeamState {
  const factory _TransferOptionsLoaded(List<PlayerId> validTransfers) =
      _$_TransferOptionsLoaded;

  List<PlayerId> get validTransfers;
  @JsonKey(ignore: true)
  _$TransferOptionsLoadedCopyWith<_TransferOptionsLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TransferApprovedCopyWith<$Res> {
  factory _$TransferApprovedCopyWith(
          _TransferApproved value, $Res Function(_TransferApproved) then) =
      __$TransferApprovedCopyWithImpl<$Res>;
  $Res call({MyTeam myTeam});

  $MyTeamCopyWith<$Res> get myTeam;
}

/// @nodoc
class __$TransferApprovedCopyWithImpl<$Res>
    extends _$MyTeamStateCopyWithImpl<$Res>
    implements _$TransferApprovedCopyWith<$Res> {
  __$TransferApprovedCopyWithImpl(
      _TransferApproved _value, $Res Function(_TransferApproved) _then)
      : super(_value, (v) => _then(v as _TransferApproved));

  @override
  _TransferApproved get _value => super._value as _TransferApproved;

  @override
  $Res call({
    Object? myTeam = freezed,
  }) {
    return _then(_TransferApproved(
      myTeam == freezed
          ? _value.myTeam
          : myTeam // ignore: cast_nullable_to_non_nullable
              as MyTeam,
    ));
  }

  @override
  $MyTeamCopyWith<$Res> get myTeam {
    return $MyTeamCopyWith<$Res>(_value.myTeam, (value) {
      return _then(_value.copyWith(myTeam: value));
    });
  }
}

/// @nodoc

class _$_TransferApproved implements _TransferApproved {
  const _$_TransferApproved(this.myTeam);

  @override
  final MyTeam myTeam;

  @override
  String toString() {
    return 'MyTeamState.transferApproved(myTeam: $myTeam)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TransferApproved &&
            const DeepCollectionEquality().equals(other.myTeam, myTeam));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(myTeam));

  @JsonKey(ignore: true)
  @override
  _$TransferApprovedCopyWith<_TransferApproved> get copyWith =>
      __$TransferApprovedCopyWithImpl<_TransferApproved>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(MyTeam myTeam) loadSuccess,
    required TResult Function(MyTeamFailure myTeamFailure) loadFailure,
    required TResult Function(List<PlayerId> validTransfers)
        transferOptionsLoaded,
    required TResult Function(MyTeam myTeam) transferApproved,
  }) {
    return transferApproved(myTeam);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<PlayerId> validTransfers)? transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
  }) {
    return transferApproved?.call(myTeam);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<PlayerId> validTransfers)? transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    required TResult orElse(),
  }) {
    if (transferApproved != null) {
      return transferApproved(myTeam);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_TransferOptionsLoaded value)
        transferOptionsLoaded,
    required TResult Function(_TransferApproved value) transferApproved,
  }) {
    return transferApproved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_TransferOptionsLoaded value)? transferOptionsLoaded,
    TResult Function(_TransferApproved value)? transferApproved,
  }) {
    return transferApproved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_TransferOptionsLoaded value)? transferOptionsLoaded,
    TResult Function(_TransferApproved value)? transferApproved,
    required TResult orElse(),
  }) {
    if (transferApproved != null) {
      return transferApproved(this);
    }
    return orElse();
  }
}

abstract class _TransferApproved implements MyTeamState {
  const factory _TransferApproved(MyTeam myTeam) = _$_TransferApproved;

  MyTeam get myTeam;
  @JsonKey(ignore: true)
  _$TransferApprovedCopyWith<_TransferApproved> get copyWith =>
      throw _privateConstructorUsedError;
}
