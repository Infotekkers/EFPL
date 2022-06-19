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

  _LoadMyTeam loadMyTeam(String gameweekId) {
    return _LoadMyTeam(
      gameweekId,
    );
  }

  _TransferOptionsRequested transferOptionsRequested(
      int playerId, String position, bool isSub) {
    return _TransferOptionsRequested(
      playerId,
      position,
      isSub,
    );
  }

  _TransferConfirmed transferConfirmed(
      int toBeTransferredIn, String position, bool isSub) {
    return _TransferConfirmed(
      toBeTransferredIn,
      position,
      isSub,
    );
  }

  _CaptainChanged captainChanged(int playerId) {
    return _CaptainChanged(
      playerId,
    );
  }

  _ViceCaptainChanged viceCaptainChanged(int playerId) {
    return _ViceCaptainChanged(
      playerId,
    );
  }

  _ChipPlayed chipPlayed(Chip chip) {
    return _ChipPlayed(
      chip,
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
    required TResult Function(String gameweekId) loadMyTeam,
    required TResult Function(int playerId, String position, bool isSub)
        transferOptionsRequested,
    required TResult Function(
            int toBeTransferredIn, String position, bool isSub)
        transferConfirmed,
    required TResult Function(int playerId) captainChanged,
    required TResult Function(int playerId) viceCaptainChanged,
    required TResult Function(Chip chip) chipPlayed,
    required TResult Function(MyTeam myTeam) saveMyTeam,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String gameweekId)? loadMyTeam,
    TResult Function(int playerId, String position, bool isSub)?
        transferOptionsRequested,
    TResult Function(int toBeTransferredIn, String position, bool isSub)?
        transferConfirmed,
    TResult Function(int playerId)? captainChanged,
    TResult Function(int playerId)? viceCaptainChanged,
    TResult Function(Chip chip)? chipPlayed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String gameweekId)? loadMyTeam,
    TResult Function(int playerId, String position, bool isSub)?
        transferOptionsRequested,
    TResult Function(int toBeTransferredIn, String position, bool isSub)?
        transferConfirmed,
    TResult Function(int playerId)? captainChanged,
    TResult Function(int playerId)? viceCaptainChanged,
    TResult Function(Chip chip)? chipPlayed,
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
    required TResult Function(_CaptainChanged value) captainChanged,
    required TResult Function(_ViceCaptainChanged value) viceCaptainChanged,
    required TResult Function(_ChipPlayed value) chipPlayed,
    required TResult Function(_SaveMyTeam value) saveMyTeam,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadMyTeam value)? loadMyTeam,
    TResult Function(_TransferOptionsRequested value)? transferOptionsRequested,
    TResult Function(_TransferConfirmed value)? transferConfirmed,
    TResult Function(_CaptainChanged value)? captainChanged,
    TResult Function(_ViceCaptainChanged value)? viceCaptainChanged,
    TResult Function(_ChipPlayed value)? chipPlayed,
    TResult Function(_SaveMyTeam value)? saveMyTeam,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMyTeam value)? loadMyTeam,
    TResult Function(_TransferOptionsRequested value)? transferOptionsRequested,
    TResult Function(_TransferConfirmed value)? transferConfirmed,
    TResult Function(_CaptainChanged value)? captainChanged,
    TResult Function(_ViceCaptainChanged value)? viceCaptainChanged,
    TResult Function(_ChipPlayed value)? chipPlayed,
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
  $Res call({String gameweekId});
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
    Object? gameweekId = freezed,
  }) {
    return _then(_LoadMyTeam(
      gameweekId == freezed
          ? _value.gameweekId
          : gameweekId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoadMyTeam implements _LoadMyTeam {
  const _$_LoadMyTeam(this.gameweekId);

  @override
  final String gameweekId;

  @override
  String toString() {
    return 'MyTeamEvent.loadMyTeam(gameweekId: $gameweekId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadMyTeam &&
            const DeepCollectionEquality()
                .equals(other.gameweekId, gameweekId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(gameweekId));

  @JsonKey(ignore: true)
  @override
  _$LoadMyTeamCopyWith<_LoadMyTeam> get copyWith =>
      __$LoadMyTeamCopyWithImpl<_LoadMyTeam>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String gameweekId) loadMyTeam,
    required TResult Function(int playerId, String position, bool isSub)
        transferOptionsRequested,
    required TResult Function(
            int toBeTransferredIn, String position, bool isSub)
        transferConfirmed,
    required TResult Function(int playerId) captainChanged,
    required TResult Function(int playerId) viceCaptainChanged,
    required TResult Function(Chip chip) chipPlayed,
    required TResult Function(MyTeam myTeam) saveMyTeam,
  }) {
    return loadMyTeam(gameweekId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String gameweekId)? loadMyTeam,
    TResult Function(int playerId, String position, bool isSub)?
        transferOptionsRequested,
    TResult Function(int toBeTransferredIn, String position, bool isSub)?
        transferConfirmed,
    TResult Function(int playerId)? captainChanged,
    TResult Function(int playerId)? viceCaptainChanged,
    TResult Function(Chip chip)? chipPlayed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
  }) {
    return loadMyTeam?.call(gameweekId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String gameweekId)? loadMyTeam,
    TResult Function(int playerId, String position, bool isSub)?
        transferOptionsRequested,
    TResult Function(int toBeTransferredIn, String position, bool isSub)?
        transferConfirmed,
    TResult Function(int playerId)? captainChanged,
    TResult Function(int playerId)? viceCaptainChanged,
    TResult Function(Chip chip)? chipPlayed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
    required TResult orElse(),
  }) {
    if (loadMyTeam != null) {
      return loadMyTeam(gameweekId);
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
    required TResult Function(_CaptainChanged value) captainChanged,
    required TResult Function(_ViceCaptainChanged value) viceCaptainChanged,
    required TResult Function(_ChipPlayed value) chipPlayed,
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
    TResult Function(_CaptainChanged value)? captainChanged,
    TResult Function(_ViceCaptainChanged value)? viceCaptainChanged,
    TResult Function(_ChipPlayed value)? chipPlayed,
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
    TResult Function(_CaptainChanged value)? captainChanged,
    TResult Function(_ViceCaptainChanged value)? viceCaptainChanged,
    TResult Function(_ChipPlayed value)? chipPlayed,
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
  const factory _LoadMyTeam(String gameweekId) = _$_LoadMyTeam;

  String get gameweekId;
  @JsonKey(ignore: true)
  _$LoadMyTeamCopyWith<_LoadMyTeam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TransferOptionsRequestedCopyWith<$Res> {
  factory _$TransferOptionsRequestedCopyWith(_TransferOptionsRequested value,
          $Res Function(_TransferOptionsRequested) then) =
      __$TransferOptionsRequestedCopyWithImpl<$Res>;
  $Res call({int playerId, String position, bool isSub});
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
    Object? position = freezed,
    Object? isSub = freezed,
  }) {
    return _then(_TransferOptionsRequested(
      playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as int,
      position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      isSub == freezed
          ? _value.isSub
          : isSub // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TransferOptionsRequested implements _TransferOptionsRequested {
  const _$_TransferOptionsRequested(this.playerId, this.position, this.isSub);

  @override
  final int playerId;
  @override
  final String position;
  @override
  final bool isSub;

  @override
  String toString() {
    return 'MyTeamEvent.transferOptionsRequested(playerId: $playerId, position: $position, isSub: $isSub)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TransferOptionsRequested &&
            const DeepCollectionEquality().equals(other.playerId, playerId) &&
            const DeepCollectionEquality().equals(other.position, position) &&
            const DeepCollectionEquality().equals(other.isSub, isSub));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerId),
      const DeepCollectionEquality().hash(position),
      const DeepCollectionEquality().hash(isSub));

  @JsonKey(ignore: true)
  @override
  _$TransferOptionsRequestedCopyWith<_TransferOptionsRequested> get copyWith =>
      __$TransferOptionsRequestedCopyWithImpl<_TransferOptionsRequested>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String gameweekId) loadMyTeam,
    required TResult Function(int playerId, String position, bool isSub)
        transferOptionsRequested,
    required TResult Function(
            int toBeTransferredIn, String position, bool isSub)
        transferConfirmed,
    required TResult Function(int playerId) captainChanged,
    required TResult Function(int playerId) viceCaptainChanged,
    required TResult Function(Chip chip) chipPlayed,
    required TResult Function(MyTeam myTeam) saveMyTeam,
  }) {
    return transferOptionsRequested(playerId, position, isSub);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String gameweekId)? loadMyTeam,
    TResult Function(int playerId, String position, bool isSub)?
        transferOptionsRequested,
    TResult Function(int toBeTransferredIn, String position, bool isSub)?
        transferConfirmed,
    TResult Function(int playerId)? captainChanged,
    TResult Function(int playerId)? viceCaptainChanged,
    TResult Function(Chip chip)? chipPlayed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
  }) {
    return transferOptionsRequested?.call(playerId, position, isSub);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String gameweekId)? loadMyTeam,
    TResult Function(int playerId, String position, bool isSub)?
        transferOptionsRequested,
    TResult Function(int toBeTransferredIn, String position, bool isSub)?
        transferConfirmed,
    TResult Function(int playerId)? captainChanged,
    TResult Function(int playerId)? viceCaptainChanged,
    TResult Function(Chip chip)? chipPlayed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
    required TResult orElse(),
  }) {
    if (transferOptionsRequested != null) {
      return transferOptionsRequested(playerId, position, isSub);
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
    required TResult Function(_CaptainChanged value) captainChanged,
    required TResult Function(_ViceCaptainChanged value) viceCaptainChanged,
    required TResult Function(_ChipPlayed value) chipPlayed,
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
    TResult Function(_CaptainChanged value)? captainChanged,
    TResult Function(_ViceCaptainChanged value)? viceCaptainChanged,
    TResult Function(_ChipPlayed value)? chipPlayed,
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
    TResult Function(_CaptainChanged value)? captainChanged,
    TResult Function(_ViceCaptainChanged value)? viceCaptainChanged,
    TResult Function(_ChipPlayed value)? chipPlayed,
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
  const factory _TransferOptionsRequested(
      int playerId, String position, bool isSub) = _$_TransferOptionsRequested;

  int get playerId;
  String get position;
  bool get isSub;
  @JsonKey(ignore: true)
  _$TransferOptionsRequestedCopyWith<_TransferOptionsRequested> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TransferConfirmedCopyWith<$Res> {
  factory _$TransferConfirmedCopyWith(
          _TransferConfirmed value, $Res Function(_TransferConfirmed) then) =
      __$TransferConfirmedCopyWithImpl<$Res>;
  $Res call({int toBeTransferredIn, String position, bool isSub});
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
    Object? toBeTransferredIn = freezed,
    Object? position = freezed,
    Object? isSub = freezed,
  }) {
    return _then(_TransferConfirmed(
      toBeTransferredIn == freezed
          ? _value.toBeTransferredIn
          : toBeTransferredIn // ignore: cast_nullable_to_non_nullable
              as int,
      position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      isSub == freezed
          ? _value.isSub
          : isSub // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TransferConfirmed implements _TransferConfirmed {
  const _$_TransferConfirmed(this.toBeTransferredIn, this.position, this.isSub);

  @override
  final int toBeTransferredIn;
  @override
  final String position;
  @override
  final bool isSub;

  @override
  String toString() {
    return 'MyTeamEvent.transferConfirmed(toBeTransferredIn: $toBeTransferredIn, position: $position, isSub: $isSub)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TransferConfirmed &&
            const DeepCollectionEquality()
                .equals(other.toBeTransferredIn, toBeTransferredIn) &&
            const DeepCollectionEquality().equals(other.position, position) &&
            const DeepCollectionEquality().equals(other.isSub, isSub));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(toBeTransferredIn),
      const DeepCollectionEquality().hash(position),
      const DeepCollectionEquality().hash(isSub));

  @JsonKey(ignore: true)
  @override
  _$TransferConfirmedCopyWith<_TransferConfirmed> get copyWith =>
      __$TransferConfirmedCopyWithImpl<_TransferConfirmed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String gameweekId) loadMyTeam,
    required TResult Function(int playerId, String position, bool isSub)
        transferOptionsRequested,
    required TResult Function(
            int toBeTransferredIn, String position, bool isSub)
        transferConfirmed,
    required TResult Function(int playerId) captainChanged,
    required TResult Function(int playerId) viceCaptainChanged,
    required TResult Function(Chip chip) chipPlayed,
    required TResult Function(MyTeam myTeam) saveMyTeam,
  }) {
    return transferConfirmed(toBeTransferredIn, position, isSub);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String gameweekId)? loadMyTeam,
    TResult Function(int playerId, String position, bool isSub)?
        transferOptionsRequested,
    TResult Function(int toBeTransferredIn, String position, bool isSub)?
        transferConfirmed,
    TResult Function(int playerId)? captainChanged,
    TResult Function(int playerId)? viceCaptainChanged,
    TResult Function(Chip chip)? chipPlayed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
  }) {
    return transferConfirmed?.call(toBeTransferredIn, position, isSub);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String gameweekId)? loadMyTeam,
    TResult Function(int playerId, String position, bool isSub)?
        transferOptionsRequested,
    TResult Function(int toBeTransferredIn, String position, bool isSub)?
        transferConfirmed,
    TResult Function(int playerId)? captainChanged,
    TResult Function(int playerId)? viceCaptainChanged,
    TResult Function(Chip chip)? chipPlayed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
    required TResult orElse(),
  }) {
    if (transferConfirmed != null) {
      return transferConfirmed(toBeTransferredIn, position, isSub);
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
    required TResult Function(_CaptainChanged value) captainChanged,
    required TResult Function(_ViceCaptainChanged value) viceCaptainChanged,
    required TResult Function(_ChipPlayed value) chipPlayed,
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
    TResult Function(_CaptainChanged value)? captainChanged,
    TResult Function(_ViceCaptainChanged value)? viceCaptainChanged,
    TResult Function(_ChipPlayed value)? chipPlayed,
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
    TResult Function(_CaptainChanged value)? captainChanged,
    TResult Function(_ViceCaptainChanged value)? viceCaptainChanged,
    TResult Function(_ChipPlayed value)? chipPlayed,
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
          int toBeTransferredIn, String position, bool isSub) =
      _$_TransferConfirmed;

  int get toBeTransferredIn;
  String get position;
  bool get isSub;
  @JsonKey(ignore: true)
  _$TransferConfirmedCopyWith<_TransferConfirmed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CaptainChangedCopyWith<$Res> {
  factory _$CaptainChangedCopyWith(
          _CaptainChanged value, $Res Function(_CaptainChanged) then) =
      __$CaptainChangedCopyWithImpl<$Res>;
  $Res call({int playerId});
}

/// @nodoc
class __$CaptainChangedCopyWithImpl<$Res>
    extends _$MyTeamEventCopyWithImpl<$Res>
    implements _$CaptainChangedCopyWith<$Res> {
  __$CaptainChangedCopyWithImpl(
      _CaptainChanged _value, $Res Function(_CaptainChanged) _then)
      : super(_value, (v) => _then(v as _CaptainChanged));

  @override
  _CaptainChanged get _value => super._value as _CaptainChanged;

  @override
  $Res call({
    Object? playerId = freezed,
  }) {
    return _then(_CaptainChanged(
      playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CaptainChanged implements _CaptainChanged {
  const _$_CaptainChanged(this.playerId);

  @override
  final int playerId;

  @override
  String toString() {
    return 'MyTeamEvent.captainChanged(playerId: $playerId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CaptainChanged &&
            const DeepCollectionEquality().equals(other.playerId, playerId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(playerId));

  @JsonKey(ignore: true)
  @override
  _$CaptainChangedCopyWith<_CaptainChanged> get copyWith =>
      __$CaptainChangedCopyWithImpl<_CaptainChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String gameweekId) loadMyTeam,
    required TResult Function(int playerId, String position, bool isSub)
        transferOptionsRequested,
    required TResult Function(
            int toBeTransferredIn, String position, bool isSub)
        transferConfirmed,
    required TResult Function(int playerId) captainChanged,
    required TResult Function(int playerId) viceCaptainChanged,
    required TResult Function(Chip chip) chipPlayed,
    required TResult Function(MyTeam myTeam) saveMyTeam,
  }) {
    return captainChanged(playerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String gameweekId)? loadMyTeam,
    TResult Function(int playerId, String position, bool isSub)?
        transferOptionsRequested,
    TResult Function(int toBeTransferredIn, String position, bool isSub)?
        transferConfirmed,
    TResult Function(int playerId)? captainChanged,
    TResult Function(int playerId)? viceCaptainChanged,
    TResult Function(Chip chip)? chipPlayed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
  }) {
    return captainChanged?.call(playerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String gameweekId)? loadMyTeam,
    TResult Function(int playerId, String position, bool isSub)?
        transferOptionsRequested,
    TResult Function(int toBeTransferredIn, String position, bool isSub)?
        transferConfirmed,
    TResult Function(int playerId)? captainChanged,
    TResult Function(int playerId)? viceCaptainChanged,
    TResult Function(Chip chip)? chipPlayed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
    required TResult orElse(),
  }) {
    if (captainChanged != null) {
      return captainChanged(playerId);
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
    required TResult Function(_CaptainChanged value) captainChanged,
    required TResult Function(_ViceCaptainChanged value) viceCaptainChanged,
    required TResult Function(_ChipPlayed value) chipPlayed,
    required TResult Function(_SaveMyTeam value) saveMyTeam,
  }) {
    return captainChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadMyTeam value)? loadMyTeam,
    TResult Function(_TransferOptionsRequested value)? transferOptionsRequested,
    TResult Function(_TransferConfirmed value)? transferConfirmed,
    TResult Function(_CaptainChanged value)? captainChanged,
    TResult Function(_ViceCaptainChanged value)? viceCaptainChanged,
    TResult Function(_ChipPlayed value)? chipPlayed,
    TResult Function(_SaveMyTeam value)? saveMyTeam,
  }) {
    return captainChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMyTeam value)? loadMyTeam,
    TResult Function(_TransferOptionsRequested value)? transferOptionsRequested,
    TResult Function(_TransferConfirmed value)? transferConfirmed,
    TResult Function(_CaptainChanged value)? captainChanged,
    TResult Function(_ViceCaptainChanged value)? viceCaptainChanged,
    TResult Function(_ChipPlayed value)? chipPlayed,
    TResult Function(_SaveMyTeam value)? saveMyTeam,
    required TResult orElse(),
  }) {
    if (captainChanged != null) {
      return captainChanged(this);
    }
    return orElse();
  }
}

abstract class _CaptainChanged implements MyTeamEvent {
  const factory _CaptainChanged(int playerId) = _$_CaptainChanged;

  int get playerId;
  @JsonKey(ignore: true)
  _$CaptainChangedCopyWith<_CaptainChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ViceCaptainChangedCopyWith<$Res> {
  factory _$ViceCaptainChangedCopyWith(
          _ViceCaptainChanged value, $Res Function(_ViceCaptainChanged) then) =
      __$ViceCaptainChangedCopyWithImpl<$Res>;
  $Res call({int playerId});
}

/// @nodoc
class __$ViceCaptainChangedCopyWithImpl<$Res>
    extends _$MyTeamEventCopyWithImpl<$Res>
    implements _$ViceCaptainChangedCopyWith<$Res> {
  __$ViceCaptainChangedCopyWithImpl(
      _ViceCaptainChanged _value, $Res Function(_ViceCaptainChanged) _then)
      : super(_value, (v) => _then(v as _ViceCaptainChanged));

  @override
  _ViceCaptainChanged get _value => super._value as _ViceCaptainChanged;

  @override
  $Res call({
    Object? playerId = freezed,
  }) {
    return _then(_ViceCaptainChanged(
      playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ViceCaptainChanged implements _ViceCaptainChanged {
  const _$_ViceCaptainChanged(this.playerId);

  @override
  final int playerId;

  @override
  String toString() {
    return 'MyTeamEvent.viceCaptainChanged(playerId: $playerId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ViceCaptainChanged &&
            const DeepCollectionEquality().equals(other.playerId, playerId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(playerId));

  @JsonKey(ignore: true)
  @override
  _$ViceCaptainChangedCopyWith<_ViceCaptainChanged> get copyWith =>
      __$ViceCaptainChangedCopyWithImpl<_ViceCaptainChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String gameweekId) loadMyTeam,
    required TResult Function(int playerId, String position, bool isSub)
        transferOptionsRequested,
    required TResult Function(
            int toBeTransferredIn, String position, bool isSub)
        transferConfirmed,
    required TResult Function(int playerId) captainChanged,
    required TResult Function(int playerId) viceCaptainChanged,
    required TResult Function(Chip chip) chipPlayed,
    required TResult Function(MyTeam myTeam) saveMyTeam,
  }) {
    return viceCaptainChanged(playerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String gameweekId)? loadMyTeam,
    TResult Function(int playerId, String position, bool isSub)?
        transferOptionsRequested,
    TResult Function(int toBeTransferredIn, String position, bool isSub)?
        transferConfirmed,
    TResult Function(int playerId)? captainChanged,
    TResult Function(int playerId)? viceCaptainChanged,
    TResult Function(Chip chip)? chipPlayed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
  }) {
    return viceCaptainChanged?.call(playerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String gameweekId)? loadMyTeam,
    TResult Function(int playerId, String position, bool isSub)?
        transferOptionsRequested,
    TResult Function(int toBeTransferredIn, String position, bool isSub)?
        transferConfirmed,
    TResult Function(int playerId)? captainChanged,
    TResult Function(int playerId)? viceCaptainChanged,
    TResult Function(Chip chip)? chipPlayed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
    required TResult orElse(),
  }) {
    if (viceCaptainChanged != null) {
      return viceCaptainChanged(playerId);
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
    required TResult Function(_CaptainChanged value) captainChanged,
    required TResult Function(_ViceCaptainChanged value) viceCaptainChanged,
    required TResult Function(_ChipPlayed value) chipPlayed,
    required TResult Function(_SaveMyTeam value) saveMyTeam,
  }) {
    return viceCaptainChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadMyTeam value)? loadMyTeam,
    TResult Function(_TransferOptionsRequested value)? transferOptionsRequested,
    TResult Function(_TransferConfirmed value)? transferConfirmed,
    TResult Function(_CaptainChanged value)? captainChanged,
    TResult Function(_ViceCaptainChanged value)? viceCaptainChanged,
    TResult Function(_ChipPlayed value)? chipPlayed,
    TResult Function(_SaveMyTeam value)? saveMyTeam,
  }) {
    return viceCaptainChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMyTeam value)? loadMyTeam,
    TResult Function(_TransferOptionsRequested value)? transferOptionsRequested,
    TResult Function(_TransferConfirmed value)? transferConfirmed,
    TResult Function(_CaptainChanged value)? captainChanged,
    TResult Function(_ViceCaptainChanged value)? viceCaptainChanged,
    TResult Function(_ChipPlayed value)? chipPlayed,
    TResult Function(_SaveMyTeam value)? saveMyTeam,
    required TResult orElse(),
  }) {
    if (viceCaptainChanged != null) {
      return viceCaptainChanged(this);
    }
    return orElse();
  }
}

abstract class _ViceCaptainChanged implements MyTeamEvent {
  const factory _ViceCaptainChanged(int playerId) = _$_ViceCaptainChanged;

  int get playerId;
  @JsonKey(ignore: true)
  _$ViceCaptainChangedCopyWith<_ViceCaptainChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ChipPlayedCopyWith<$Res> {
  factory _$ChipPlayedCopyWith(
          _ChipPlayed value, $Res Function(_ChipPlayed) then) =
      __$ChipPlayedCopyWithImpl<$Res>;
  $Res call({Chip chip});
}

/// @nodoc
class __$ChipPlayedCopyWithImpl<$Res> extends _$MyTeamEventCopyWithImpl<$Res>
    implements _$ChipPlayedCopyWith<$Res> {
  __$ChipPlayedCopyWithImpl(
      _ChipPlayed _value, $Res Function(_ChipPlayed) _then)
      : super(_value, (v) => _then(v as _ChipPlayed));

  @override
  _ChipPlayed get _value => super._value as _ChipPlayed;

  @override
  $Res call({
    Object? chip = freezed,
  }) {
    return _then(_ChipPlayed(
      chip == freezed
          ? _value.chip
          : chip // ignore: cast_nullable_to_non_nullable
              as Chip,
    ));
  }
}

/// @nodoc

class _$_ChipPlayed implements _ChipPlayed {
  const _$_ChipPlayed(this.chip);

  @override
  final Chip chip;

  @override
  String toString() {
    return 'MyTeamEvent.chipPlayed(chip: $chip)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChipPlayed &&
            const DeepCollectionEquality().equals(other.chip, chip));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(chip));

  @JsonKey(ignore: true)
  @override
  _$ChipPlayedCopyWith<_ChipPlayed> get copyWith =>
      __$ChipPlayedCopyWithImpl<_ChipPlayed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String gameweekId) loadMyTeam,
    required TResult Function(int playerId, String position, bool isSub)
        transferOptionsRequested,
    required TResult Function(
            int toBeTransferredIn, String position, bool isSub)
        transferConfirmed,
    required TResult Function(int playerId) captainChanged,
    required TResult Function(int playerId) viceCaptainChanged,
    required TResult Function(Chip chip) chipPlayed,
    required TResult Function(MyTeam myTeam) saveMyTeam,
  }) {
    return chipPlayed(chip);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String gameweekId)? loadMyTeam,
    TResult Function(int playerId, String position, bool isSub)?
        transferOptionsRequested,
    TResult Function(int toBeTransferredIn, String position, bool isSub)?
        transferConfirmed,
    TResult Function(int playerId)? captainChanged,
    TResult Function(int playerId)? viceCaptainChanged,
    TResult Function(Chip chip)? chipPlayed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
  }) {
    return chipPlayed?.call(chip);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String gameweekId)? loadMyTeam,
    TResult Function(int playerId, String position, bool isSub)?
        transferOptionsRequested,
    TResult Function(int toBeTransferredIn, String position, bool isSub)?
        transferConfirmed,
    TResult Function(int playerId)? captainChanged,
    TResult Function(int playerId)? viceCaptainChanged,
    TResult Function(Chip chip)? chipPlayed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
    required TResult orElse(),
  }) {
    if (chipPlayed != null) {
      return chipPlayed(chip);
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
    required TResult Function(_CaptainChanged value) captainChanged,
    required TResult Function(_ViceCaptainChanged value) viceCaptainChanged,
    required TResult Function(_ChipPlayed value) chipPlayed,
    required TResult Function(_SaveMyTeam value) saveMyTeam,
  }) {
    return chipPlayed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadMyTeam value)? loadMyTeam,
    TResult Function(_TransferOptionsRequested value)? transferOptionsRequested,
    TResult Function(_TransferConfirmed value)? transferConfirmed,
    TResult Function(_CaptainChanged value)? captainChanged,
    TResult Function(_ViceCaptainChanged value)? viceCaptainChanged,
    TResult Function(_ChipPlayed value)? chipPlayed,
    TResult Function(_SaveMyTeam value)? saveMyTeam,
  }) {
    return chipPlayed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMyTeam value)? loadMyTeam,
    TResult Function(_TransferOptionsRequested value)? transferOptionsRequested,
    TResult Function(_TransferConfirmed value)? transferConfirmed,
    TResult Function(_CaptainChanged value)? captainChanged,
    TResult Function(_ViceCaptainChanged value)? viceCaptainChanged,
    TResult Function(_ChipPlayed value)? chipPlayed,
    TResult Function(_SaveMyTeam value)? saveMyTeam,
    required TResult orElse(),
  }) {
    if (chipPlayed != null) {
      return chipPlayed(this);
    }
    return orElse();
  }
}

abstract class _ChipPlayed implements MyTeamEvent {
  const factory _ChipPlayed(Chip chip) = _$_ChipPlayed;

  Chip get chip;
  @JsonKey(ignore: true)
  _$ChipPlayedCopyWith<_ChipPlayed> get copyWith =>
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
    required TResult Function(String gameweekId) loadMyTeam,
    required TResult Function(int playerId, String position, bool isSub)
        transferOptionsRequested,
    required TResult Function(
            int toBeTransferredIn, String position, bool isSub)
        transferConfirmed,
    required TResult Function(int playerId) captainChanged,
    required TResult Function(int playerId) viceCaptainChanged,
    required TResult Function(Chip chip) chipPlayed,
    required TResult Function(MyTeam myTeam) saveMyTeam,
  }) {
    return saveMyTeam(myTeam);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String gameweekId)? loadMyTeam,
    TResult Function(int playerId, String position, bool isSub)?
        transferOptionsRequested,
    TResult Function(int toBeTransferredIn, String position, bool isSub)?
        transferConfirmed,
    TResult Function(int playerId)? captainChanged,
    TResult Function(int playerId)? viceCaptainChanged,
    TResult Function(Chip chip)? chipPlayed,
    TResult Function(MyTeam myTeam)? saveMyTeam,
  }) {
    return saveMyTeam?.call(myTeam);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String gameweekId)? loadMyTeam,
    TResult Function(int playerId, String position, bool isSub)?
        transferOptionsRequested,
    TResult Function(int toBeTransferredIn, String position, bool isSub)?
        transferConfirmed,
    TResult Function(int playerId)? captainChanged,
    TResult Function(int playerId)? viceCaptainChanged,
    TResult Function(Chip chip)? chipPlayed,
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
    required TResult Function(_CaptainChanged value) captainChanged,
    required TResult Function(_ViceCaptainChanged value) viceCaptainChanged,
    required TResult Function(_ChipPlayed value) chipPlayed,
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
    TResult Function(_CaptainChanged value)? captainChanged,
    TResult Function(_ViceCaptainChanged value)? viceCaptainChanged,
    TResult Function(_ChipPlayed value)? chipPlayed,
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
    TResult Function(_CaptainChanged value)? captainChanged,
    TResult Function(_ViceCaptainChanged value)? viceCaptainChanged,
    TResult Function(_ChipPlayed value)? chipPlayed,
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

  _TransferOptionsLoaded transferOptionsLoaded(List<int> validOptions,
      MyTeam myTeam, int playerId, String position, bool isSub) {
    return _TransferOptionsLoaded(
      validOptions,
      myTeam,
      playerId,
      position,
      isSub,
    );
  }

  _TransferApproved transferApproved(MyTeam myTeam) {
    return _TransferApproved(
      myTeam,
    );
  }

  _CaptainChangeSuccess captainChangeSuccess(MyTeam myTeam) {
    return _CaptainChangeSuccess(
      myTeam,
    );
  }

  _ViceCaptainSuccess viceCaptainChangeSuccess(MyTeam myTeam) {
    return _ViceCaptainSuccess(
      myTeam,
    );
  }

  _ChipPlayedSuccess chipPlayedSuccess(MyTeam myTeam) {
    return _ChipPlayedSuccess(
      myTeam,
    );
  }

  _ChipPlayedFailure chipPlayedFailure(MyTeam myTeam) {
    return _ChipPlayedFailure(
      myTeam,
    );
  }

  _Saved saved(MyTeam myTeam) {
    return _Saved(
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
    required TResult Function(List<int> validOptions, MyTeam myTeam,
            int playerId, String position, bool isSub)
        transferOptionsLoaded,
    required TResult Function(MyTeam myTeam) transferApproved,
    required TResult Function(MyTeam myTeam) captainChangeSuccess,
    required TResult Function(MyTeam myTeam) viceCaptainChangeSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedFailure,
    required TResult Function(MyTeam myTeam) saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
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
    required TResult Function(_CaptainChangeSuccess value) captainChangeSuccess,
    required TResult Function(_ViceCaptainSuccess value)
        viceCaptainChangeSuccess,
    required TResult Function(_ChipPlayedSuccess value) chipPlayedSuccess,
    required TResult Function(_ChipPlayedFailure value) chipPlayedFailure,
    required TResult Function(_Saved value) saved,
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
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
    required TResult Function(List<int> validOptions, MyTeam myTeam,
            int playerId, String position, bool isSub)
        transferOptionsLoaded,
    required TResult Function(MyTeam myTeam) transferApproved,
    required TResult Function(MyTeam myTeam) captainChangeSuccess,
    required TResult Function(MyTeam myTeam) viceCaptainChangeSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedFailure,
    required TResult Function(MyTeam myTeam) saved,
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
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
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
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
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
    required TResult Function(_CaptainChangeSuccess value) captainChangeSuccess,
    required TResult Function(_ViceCaptainSuccess value)
        viceCaptainChangeSuccess,
    required TResult Function(_ChipPlayedSuccess value) chipPlayedSuccess,
    required TResult Function(_ChipPlayedFailure value) chipPlayedFailure,
    required TResult Function(_Saved value) saved,
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
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
    required TResult Function(List<int> validOptions, MyTeam myTeam,
            int playerId, String position, bool isSub)
        transferOptionsLoaded,
    required TResult Function(MyTeam myTeam) transferApproved,
    required TResult Function(MyTeam myTeam) captainChangeSuccess,
    required TResult Function(MyTeam myTeam) viceCaptainChangeSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedFailure,
    required TResult Function(MyTeam myTeam) saved,
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
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
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
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
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
    required TResult Function(_CaptainChangeSuccess value) captainChangeSuccess,
    required TResult Function(_ViceCaptainSuccess value)
        viceCaptainChangeSuccess,
    required TResult Function(_ChipPlayedSuccess value) chipPlayedSuccess,
    required TResult Function(_ChipPlayedFailure value) chipPlayedFailure,
    required TResult Function(_Saved value) saved,
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
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
    required TResult Function(List<int> validOptions, MyTeam myTeam,
            int playerId, String position, bool isSub)
        transferOptionsLoaded,
    required TResult Function(MyTeam myTeam) transferApproved,
    required TResult Function(MyTeam myTeam) captainChangeSuccess,
    required TResult Function(MyTeam myTeam) viceCaptainChangeSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedFailure,
    required TResult Function(MyTeam myTeam) saved,
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
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
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
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
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
    required TResult Function(_CaptainChangeSuccess value) captainChangeSuccess,
    required TResult Function(_ViceCaptainSuccess value)
        viceCaptainChangeSuccess,
    required TResult Function(_ChipPlayedSuccess value) chipPlayedSuccess,
    required TResult Function(_ChipPlayedFailure value) chipPlayedFailure,
    required TResult Function(_Saved value) saved,
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
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
    required TResult Function(List<int> validOptions, MyTeam myTeam,
            int playerId, String position, bool isSub)
        transferOptionsLoaded,
    required TResult Function(MyTeam myTeam) transferApproved,
    required TResult Function(MyTeam myTeam) captainChangeSuccess,
    required TResult Function(MyTeam myTeam) viceCaptainChangeSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedFailure,
    required TResult Function(MyTeam myTeam) saved,
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
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
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
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
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
    required TResult Function(_CaptainChangeSuccess value) captainChangeSuccess,
    required TResult Function(_ViceCaptainSuccess value)
        viceCaptainChangeSuccess,
    required TResult Function(_ChipPlayedSuccess value) chipPlayedSuccess,
    required TResult Function(_ChipPlayedFailure value) chipPlayedFailure,
    required TResult Function(_Saved value) saved,
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
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
  $Res call(
      {List<int> validOptions,
      MyTeam myTeam,
      int playerId,
      String position,
      bool isSub});

  $MyTeamCopyWith<$Res> get myTeam;
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
    Object? validOptions = freezed,
    Object? myTeam = freezed,
    Object? playerId = freezed,
    Object? position = freezed,
    Object? isSub = freezed,
  }) {
    return _then(_TransferOptionsLoaded(
      validOptions == freezed
          ? _value.validOptions
          : validOptions // ignore: cast_nullable_to_non_nullable
              as List<int>,
      myTeam == freezed
          ? _value.myTeam
          : myTeam // ignore: cast_nullable_to_non_nullable
              as MyTeam,
      playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as int,
      position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      isSub == freezed
          ? _value.isSub
          : isSub // ignore: cast_nullable_to_non_nullable
              as bool,
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

class _$_TransferOptionsLoaded implements _TransferOptionsLoaded {
  const _$_TransferOptionsLoaded(
      this.validOptions, this.myTeam, this.playerId, this.position, this.isSub);

  @override
  final List<int> validOptions;
  @override
  final MyTeam myTeam;
  @override
  final int playerId;
  @override
  final String position;
  @override
  final bool isSub;

  @override
  String toString() {
    return 'MyTeamState.transferOptionsLoaded(validOptions: $validOptions, myTeam: $myTeam, playerId: $playerId, position: $position, isSub: $isSub)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TransferOptionsLoaded &&
            const DeepCollectionEquality()
                .equals(other.validOptions, validOptions) &&
            const DeepCollectionEquality().equals(other.myTeam, myTeam) &&
            const DeepCollectionEquality().equals(other.playerId, playerId) &&
            const DeepCollectionEquality().equals(other.position, position) &&
            const DeepCollectionEquality().equals(other.isSub, isSub));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(validOptions),
      const DeepCollectionEquality().hash(myTeam),
      const DeepCollectionEquality().hash(playerId),
      const DeepCollectionEquality().hash(position),
      const DeepCollectionEquality().hash(isSub));

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
    required TResult Function(List<int> validOptions, MyTeam myTeam,
            int playerId, String position, bool isSub)
        transferOptionsLoaded,
    required TResult Function(MyTeam myTeam) transferApproved,
    required TResult Function(MyTeam myTeam) captainChangeSuccess,
    required TResult Function(MyTeam myTeam) viceCaptainChangeSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedFailure,
    required TResult Function(MyTeam myTeam) saved,
  }) {
    return transferOptionsLoaded(
        validOptions, myTeam, playerId, position, isSub);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
  }) {
    return transferOptionsLoaded?.call(
        validOptions, myTeam, playerId, position, isSub);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
    required TResult orElse(),
  }) {
    if (transferOptionsLoaded != null) {
      return transferOptionsLoaded(
          validOptions, myTeam, playerId, position, isSub);
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
    required TResult Function(_CaptainChangeSuccess value) captainChangeSuccess,
    required TResult Function(_ViceCaptainSuccess value)
        viceCaptainChangeSuccess,
    required TResult Function(_ChipPlayedSuccess value) chipPlayedSuccess,
    required TResult Function(_ChipPlayedFailure value) chipPlayedFailure,
    required TResult Function(_Saved value) saved,
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (transferOptionsLoaded != null) {
      return transferOptionsLoaded(this);
    }
    return orElse();
  }
}

abstract class _TransferOptionsLoaded implements MyTeamState {
  const factory _TransferOptionsLoaded(List<int> validOptions, MyTeam myTeam,
      int playerId, String position, bool isSub) = _$_TransferOptionsLoaded;

  List<int> get validOptions;
  MyTeam get myTeam;
  int get playerId;
  String get position;
  bool get isSub;
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
    required TResult Function(List<int> validOptions, MyTeam myTeam,
            int playerId, String position, bool isSub)
        transferOptionsLoaded,
    required TResult Function(MyTeam myTeam) transferApproved,
    required TResult Function(MyTeam myTeam) captainChangeSuccess,
    required TResult Function(MyTeam myTeam) viceCaptainChangeSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedFailure,
    required TResult Function(MyTeam myTeam) saved,
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
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
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
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
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
    required TResult Function(_CaptainChangeSuccess value) captainChangeSuccess,
    required TResult Function(_ViceCaptainSuccess value)
        viceCaptainChangeSuccess,
    required TResult Function(_ChipPlayedSuccess value) chipPlayedSuccess,
    required TResult Function(_ChipPlayedFailure value) chipPlayedFailure,
    required TResult Function(_Saved value) saved,
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
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

/// @nodoc
abstract class _$CaptainChangeSuccessCopyWith<$Res> {
  factory _$CaptainChangeSuccessCopyWith(_CaptainChangeSuccess value,
          $Res Function(_CaptainChangeSuccess) then) =
      __$CaptainChangeSuccessCopyWithImpl<$Res>;
  $Res call({MyTeam myTeam});

  $MyTeamCopyWith<$Res> get myTeam;
}

/// @nodoc
class __$CaptainChangeSuccessCopyWithImpl<$Res>
    extends _$MyTeamStateCopyWithImpl<$Res>
    implements _$CaptainChangeSuccessCopyWith<$Res> {
  __$CaptainChangeSuccessCopyWithImpl(
      _CaptainChangeSuccess _value, $Res Function(_CaptainChangeSuccess) _then)
      : super(_value, (v) => _then(v as _CaptainChangeSuccess));

  @override
  _CaptainChangeSuccess get _value => super._value as _CaptainChangeSuccess;

  @override
  $Res call({
    Object? myTeam = freezed,
  }) {
    return _then(_CaptainChangeSuccess(
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

class _$_CaptainChangeSuccess implements _CaptainChangeSuccess {
  const _$_CaptainChangeSuccess(this.myTeam);

  @override
  final MyTeam myTeam;

  @override
  String toString() {
    return 'MyTeamState.captainChangeSuccess(myTeam: $myTeam)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CaptainChangeSuccess &&
            const DeepCollectionEquality().equals(other.myTeam, myTeam));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(myTeam));

  @JsonKey(ignore: true)
  @override
  _$CaptainChangeSuccessCopyWith<_CaptainChangeSuccess> get copyWith =>
      __$CaptainChangeSuccessCopyWithImpl<_CaptainChangeSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(MyTeam myTeam) loadSuccess,
    required TResult Function(MyTeamFailure myTeamFailure) loadFailure,
    required TResult Function(List<int> validOptions, MyTeam myTeam,
            int playerId, String position, bool isSub)
        transferOptionsLoaded,
    required TResult Function(MyTeam myTeam) transferApproved,
    required TResult Function(MyTeam myTeam) captainChangeSuccess,
    required TResult Function(MyTeam myTeam) viceCaptainChangeSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedFailure,
    required TResult Function(MyTeam myTeam) saved,
  }) {
    return captainChangeSuccess(myTeam);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
  }) {
    return captainChangeSuccess?.call(myTeam);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
    required TResult orElse(),
  }) {
    if (captainChangeSuccess != null) {
      return captainChangeSuccess(myTeam);
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
    required TResult Function(_CaptainChangeSuccess value) captainChangeSuccess,
    required TResult Function(_ViceCaptainSuccess value)
        viceCaptainChangeSuccess,
    required TResult Function(_ChipPlayedSuccess value) chipPlayedSuccess,
    required TResult Function(_ChipPlayedFailure value) chipPlayedFailure,
    required TResult Function(_Saved value) saved,
  }) {
    return captainChangeSuccess(this);
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
  }) {
    return captainChangeSuccess?.call(this);
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (captainChangeSuccess != null) {
      return captainChangeSuccess(this);
    }
    return orElse();
  }
}

abstract class _CaptainChangeSuccess implements MyTeamState {
  const factory _CaptainChangeSuccess(MyTeam myTeam) = _$_CaptainChangeSuccess;

  MyTeam get myTeam;
  @JsonKey(ignore: true)
  _$CaptainChangeSuccessCopyWith<_CaptainChangeSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ViceCaptainSuccessCopyWith<$Res> {
  factory _$ViceCaptainSuccessCopyWith(
          _ViceCaptainSuccess value, $Res Function(_ViceCaptainSuccess) then) =
      __$ViceCaptainSuccessCopyWithImpl<$Res>;
  $Res call({MyTeam myTeam});

  $MyTeamCopyWith<$Res> get myTeam;
}

/// @nodoc
class __$ViceCaptainSuccessCopyWithImpl<$Res>
    extends _$MyTeamStateCopyWithImpl<$Res>
    implements _$ViceCaptainSuccessCopyWith<$Res> {
  __$ViceCaptainSuccessCopyWithImpl(
      _ViceCaptainSuccess _value, $Res Function(_ViceCaptainSuccess) _then)
      : super(_value, (v) => _then(v as _ViceCaptainSuccess));

  @override
  _ViceCaptainSuccess get _value => super._value as _ViceCaptainSuccess;

  @override
  $Res call({
    Object? myTeam = freezed,
  }) {
    return _then(_ViceCaptainSuccess(
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

class _$_ViceCaptainSuccess implements _ViceCaptainSuccess {
  const _$_ViceCaptainSuccess(this.myTeam);

  @override
  final MyTeam myTeam;

  @override
  String toString() {
    return 'MyTeamState.viceCaptainChangeSuccess(myTeam: $myTeam)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ViceCaptainSuccess &&
            const DeepCollectionEquality().equals(other.myTeam, myTeam));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(myTeam));

  @JsonKey(ignore: true)
  @override
  _$ViceCaptainSuccessCopyWith<_ViceCaptainSuccess> get copyWith =>
      __$ViceCaptainSuccessCopyWithImpl<_ViceCaptainSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(MyTeam myTeam) loadSuccess,
    required TResult Function(MyTeamFailure myTeamFailure) loadFailure,
    required TResult Function(List<int> validOptions, MyTeam myTeam,
            int playerId, String position, bool isSub)
        transferOptionsLoaded,
    required TResult Function(MyTeam myTeam) transferApproved,
    required TResult Function(MyTeam myTeam) captainChangeSuccess,
    required TResult Function(MyTeam myTeam) viceCaptainChangeSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedFailure,
    required TResult Function(MyTeam myTeam) saved,
  }) {
    return viceCaptainChangeSuccess(myTeam);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
  }) {
    return viceCaptainChangeSuccess?.call(myTeam);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
    required TResult orElse(),
  }) {
    if (viceCaptainChangeSuccess != null) {
      return viceCaptainChangeSuccess(myTeam);
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
    required TResult Function(_CaptainChangeSuccess value) captainChangeSuccess,
    required TResult Function(_ViceCaptainSuccess value)
        viceCaptainChangeSuccess,
    required TResult Function(_ChipPlayedSuccess value) chipPlayedSuccess,
    required TResult Function(_ChipPlayedFailure value) chipPlayedFailure,
    required TResult Function(_Saved value) saved,
  }) {
    return viceCaptainChangeSuccess(this);
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
  }) {
    return viceCaptainChangeSuccess?.call(this);
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (viceCaptainChangeSuccess != null) {
      return viceCaptainChangeSuccess(this);
    }
    return orElse();
  }
}

abstract class _ViceCaptainSuccess implements MyTeamState {
  const factory _ViceCaptainSuccess(MyTeam myTeam) = _$_ViceCaptainSuccess;

  MyTeam get myTeam;
  @JsonKey(ignore: true)
  _$ViceCaptainSuccessCopyWith<_ViceCaptainSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ChipPlayedSuccessCopyWith<$Res> {
  factory _$ChipPlayedSuccessCopyWith(
          _ChipPlayedSuccess value, $Res Function(_ChipPlayedSuccess) then) =
      __$ChipPlayedSuccessCopyWithImpl<$Res>;
  $Res call({MyTeam myTeam});

  $MyTeamCopyWith<$Res> get myTeam;
}

/// @nodoc
class __$ChipPlayedSuccessCopyWithImpl<$Res>
    extends _$MyTeamStateCopyWithImpl<$Res>
    implements _$ChipPlayedSuccessCopyWith<$Res> {
  __$ChipPlayedSuccessCopyWithImpl(
      _ChipPlayedSuccess _value, $Res Function(_ChipPlayedSuccess) _then)
      : super(_value, (v) => _then(v as _ChipPlayedSuccess));

  @override
  _ChipPlayedSuccess get _value => super._value as _ChipPlayedSuccess;

  @override
  $Res call({
    Object? myTeam = freezed,
  }) {
    return _then(_ChipPlayedSuccess(
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

class _$_ChipPlayedSuccess implements _ChipPlayedSuccess {
  const _$_ChipPlayedSuccess(this.myTeam);

  @override
  final MyTeam myTeam;

  @override
  String toString() {
    return 'MyTeamState.chipPlayedSuccess(myTeam: $myTeam)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChipPlayedSuccess &&
            const DeepCollectionEquality().equals(other.myTeam, myTeam));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(myTeam));

  @JsonKey(ignore: true)
  @override
  _$ChipPlayedSuccessCopyWith<_ChipPlayedSuccess> get copyWith =>
      __$ChipPlayedSuccessCopyWithImpl<_ChipPlayedSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(MyTeam myTeam) loadSuccess,
    required TResult Function(MyTeamFailure myTeamFailure) loadFailure,
    required TResult Function(List<int> validOptions, MyTeam myTeam,
            int playerId, String position, bool isSub)
        transferOptionsLoaded,
    required TResult Function(MyTeam myTeam) transferApproved,
    required TResult Function(MyTeam myTeam) captainChangeSuccess,
    required TResult Function(MyTeam myTeam) viceCaptainChangeSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedFailure,
    required TResult Function(MyTeam myTeam) saved,
  }) {
    return chipPlayedSuccess(myTeam);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
  }) {
    return chipPlayedSuccess?.call(myTeam);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
    required TResult orElse(),
  }) {
    if (chipPlayedSuccess != null) {
      return chipPlayedSuccess(myTeam);
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
    required TResult Function(_CaptainChangeSuccess value) captainChangeSuccess,
    required TResult Function(_ViceCaptainSuccess value)
        viceCaptainChangeSuccess,
    required TResult Function(_ChipPlayedSuccess value) chipPlayedSuccess,
    required TResult Function(_ChipPlayedFailure value) chipPlayedFailure,
    required TResult Function(_Saved value) saved,
  }) {
    return chipPlayedSuccess(this);
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
  }) {
    return chipPlayedSuccess?.call(this);
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (chipPlayedSuccess != null) {
      return chipPlayedSuccess(this);
    }
    return orElse();
  }
}

abstract class _ChipPlayedSuccess implements MyTeamState {
  const factory _ChipPlayedSuccess(MyTeam myTeam) = _$_ChipPlayedSuccess;

  MyTeam get myTeam;
  @JsonKey(ignore: true)
  _$ChipPlayedSuccessCopyWith<_ChipPlayedSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ChipPlayedFailureCopyWith<$Res> {
  factory _$ChipPlayedFailureCopyWith(
          _ChipPlayedFailure value, $Res Function(_ChipPlayedFailure) then) =
      __$ChipPlayedFailureCopyWithImpl<$Res>;
  $Res call({MyTeam myTeam});

  $MyTeamCopyWith<$Res> get myTeam;
}

/// @nodoc
class __$ChipPlayedFailureCopyWithImpl<$Res>
    extends _$MyTeamStateCopyWithImpl<$Res>
    implements _$ChipPlayedFailureCopyWith<$Res> {
  __$ChipPlayedFailureCopyWithImpl(
      _ChipPlayedFailure _value, $Res Function(_ChipPlayedFailure) _then)
      : super(_value, (v) => _then(v as _ChipPlayedFailure));

  @override
  _ChipPlayedFailure get _value => super._value as _ChipPlayedFailure;

  @override
  $Res call({
    Object? myTeam = freezed,
  }) {
    return _then(_ChipPlayedFailure(
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

class _$_ChipPlayedFailure implements _ChipPlayedFailure {
  const _$_ChipPlayedFailure(this.myTeam);

  @override
  final MyTeam myTeam;

  @override
  String toString() {
    return 'MyTeamState.chipPlayedFailure(myTeam: $myTeam)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChipPlayedFailure &&
            const DeepCollectionEquality().equals(other.myTeam, myTeam));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(myTeam));

  @JsonKey(ignore: true)
  @override
  _$ChipPlayedFailureCopyWith<_ChipPlayedFailure> get copyWith =>
      __$ChipPlayedFailureCopyWithImpl<_ChipPlayedFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(MyTeam myTeam) loadSuccess,
    required TResult Function(MyTeamFailure myTeamFailure) loadFailure,
    required TResult Function(List<int> validOptions, MyTeam myTeam,
            int playerId, String position, bool isSub)
        transferOptionsLoaded,
    required TResult Function(MyTeam myTeam) transferApproved,
    required TResult Function(MyTeam myTeam) captainChangeSuccess,
    required TResult Function(MyTeam myTeam) viceCaptainChangeSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedFailure,
    required TResult Function(MyTeam myTeam) saved,
  }) {
    return chipPlayedFailure(myTeam);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
  }) {
    return chipPlayedFailure?.call(myTeam);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
    required TResult orElse(),
  }) {
    if (chipPlayedFailure != null) {
      return chipPlayedFailure(myTeam);
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
    required TResult Function(_CaptainChangeSuccess value) captainChangeSuccess,
    required TResult Function(_ViceCaptainSuccess value)
        viceCaptainChangeSuccess,
    required TResult Function(_ChipPlayedSuccess value) chipPlayedSuccess,
    required TResult Function(_ChipPlayedFailure value) chipPlayedFailure,
    required TResult Function(_Saved value) saved,
  }) {
    return chipPlayedFailure(this);
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
  }) {
    return chipPlayedFailure?.call(this);
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (chipPlayedFailure != null) {
      return chipPlayedFailure(this);
    }
    return orElse();
  }
}

abstract class _ChipPlayedFailure implements MyTeamState {
  const factory _ChipPlayedFailure(MyTeam myTeam) = _$_ChipPlayedFailure;

  MyTeam get myTeam;
  @JsonKey(ignore: true)
  _$ChipPlayedFailureCopyWith<_ChipPlayedFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SavedCopyWith<$Res> {
  factory _$SavedCopyWith(_Saved value, $Res Function(_Saved) then) =
      __$SavedCopyWithImpl<$Res>;
  $Res call({MyTeam myTeam});

  $MyTeamCopyWith<$Res> get myTeam;
}

/// @nodoc
class __$SavedCopyWithImpl<$Res> extends _$MyTeamStateCopyWithImpl<$Res>
    implements _$SavedCopyWith<$Res> {
  __$SavedCopyWithImpl(_Saved _value, $Res Function(_Saved) _then)
      : super(_value, (v) => _then(v as _Saved));

  @override
  _Saved get _value => super._value as _Saved;

  @override
  $Res call({
    Object? myTeam = freezed,
  }) {
    return _then(_Saved(
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

class _$_Saved implements _Saved {
  const _$_Saved(this.myTeam);

  @override
  final MyTeam myTeam;

  @override
  String toString() {
    return 'MyTeamState.saved(myTeam: $myTeam)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Saved &&
            const DeepCollectionEquality().equals(other.myTeam, myTeam));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(myTeam));

  @JsonKey(ignore: true)
  @override
  _$SavedCopyWith<_Saved> get copyWith =>
      __$SavedCopyWithImpl<_Saved>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(MyTeam myTeam) loadSuccess,
    required TResult Function(MyTeamFailure myTeamFailure) loadFailure,
    required TResult Function(List<int> validOptions, MyTeam myTeam,
            int playerId, String position, bool isSub)
        transferOptionsLoaded,
    required TResult Function(MyTeam myTeam) transferApproved,
    required TResult Function(MyTeam myTeam) captainChangeSuccess,
    required TResult Function(MyTeam myTeam) viceCaptainChangeSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedSuccess,
    required TResult Function(MyTeam myTeam) chipPlayedFailure,
    required TResult Function(MyTeam myTeam) saved,
  }) {
    return saved(myTeam);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
  }) {
    return saved?.call(myTeam);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(MyTeam myTeam)? loadSuccess,
    TResult Function(MyTeamFailure myTeamFailure)? loadFailure,
    TResult Function(List<int> validOptions, MyTeam myTeam, int playerId,
            String position, bool isSub)?
        transferOptionsLoaded,
    TResult Function(MyTeam myTeam)? transferApproved,
    TResult Function(MyTeam myTeam)? captainChangeSuccess,
    TResult Function(MyTeam myTeam)? viceCaptainChangeSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedSuccess,
    TResult Function(MyTeam myTeam)? chipPlayedFailure,
    TResult Function(MyTeam myTeam)? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(myTeam);
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
    required TResult Function(_CaptainChangeSuccess value) captainChangeSuccess,
    required TResult Function(_ViceCaptainSuccess value)
        viceCaptainChangeSuccess,
    required TResult Function(_ChipPlayedSuccess value) chipPlayedSuccess,
    required TResult Function(_ChipPlayedFailure value) chipPlayedFailure,
    required TResult Function(_Saved value) saved,
  }) {
    return saved(this);
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
  }) {
    return saved?.call(this);
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
    TResult Function(_CaptainChangeSuccess value)? captainChangeSuccess,
    TResult Function(_ViceCaptainSuccess value)? viceCaptainChangeSuccess,
    TResult Function(_ChipPlayedSuccess value)? chipPlayedSuccess,
    TResult Function(_ChipPlayedFailure value)? chipPlayedFailure,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class _Saved implements MyTeamState {
  const factory _Saved(MyTeam myTeam) = _$_Saved;

  MyTeam get myTeam;
  @JsonKey(ignore: true)
  _$SavedCopyWith<_Saved> get copyWith => throw _privateConstructorUsedError;
}
