// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transfer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TransferEventTearOff {
  const _$TransferEventTearOff();

  _getUserPlayers getUserPlayers({required GameWeekId gameWeekId}) {
    return _getUserPlayers(
      gameWeekId: gameWeekId,
    );
  }

  _setTransferOutPlayer setTransferOutPlayer(
      {required String transferOutPlayerId,
      required PlayerPosition playerPosition}) {
    return _setTransferOutPlayer(
      transferOutPlayerId: transferOutPlayerId,
      playerPosition: playerPosition,
    );
  }

  _getPlayersInSelectedPosition getPlayersInSelectedPosition() {
    return const _getPlayersInSelectedPosition();
  }

  _transferUserPlayer transferUserPlayer({required String transferInPlayerId}) {
    return _transferUserPlayer(
      transferInPlayerId: transferInPlayerId,
    );
  }

  _cancelTransfer cancelTransfer() {
    return const _cancelTransfer();
  }

  _saveUserPlayers saveUserPlayers() {
    return const _saveUserPlayers();
  }
}

/// @nodoc
const $TransferEvent = _$TransferEventTearOff();

/// @nodoc
mixin _$TransferEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GameWeekId gameWeekId) getUserPlayers,
    required TResult Function(
            String transferOutPlayerId, PlayerPosition playerPosition)
        setTransferOutPlayer,
    required TResult Function() getPlayersInSelectedPosition,
    required TResult Function(String transferInPlayerId) transferUserPlayer,
    required TResult Function() cancelTransfer,
    required TResult Function() saveUserPlayers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(GameWeekId gameWeekId)? getUserPlayers,
    TResult Function(String transferOutPlayerId, PlayerPosition playerPosition)?
        setTransferOutPlayer,
    TResult Function()? getPlayersInSelectedPosition,
    TResult Function(String transferInPlayerId)? transferUserPlayer,
    TResult Function()? cancelTransfer,
    TResult Function()? saveUserPlayers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GameWeekId gameWeekId)? getUserPlayers,
    TResult Function(String transferOutPlayerId, PlayerPosition playerPosition)?
        setTransferOutPlayer,
    TResult Function()? getPlayersInSelectedPosition,
    TResult Function(String transferInPlayerId)? transferUserPlayer,
    TResult Function()? cancelTransfer,
    TResult Function()? saveUserPlayers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getUserPlayers value) getUserPlayers,
    required TResult Function(_setTransferOutPlayer value) setTransferOutPlayer,
    required TResult Function(_getPlayersInSelectedPosition value)
        getPlayersInSelectedPosition,
    required TResult Function(_transferUserPlayer value) transferUserPlayer,
    required TResult Function(_cancelTransfer value) cancelTransfer,
    required TResult Function(_saveUserPlayers value) saveUserPlayers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_getUserPlayers value)? getUserPlayers,
    TResult Function(_setTransferOutPlayer value)? setTransferOutPlayer,
    TResult Function(_getPlayersInSelectedPosition value)?
        getPlayersInSelectedPosition,
    TResult Function(_transferUserPlayer value)? transferUserPlayer,
    TResult Function(_cancelTransfer value)? cancelTransfer,
    TResult Function(_saveUserPlayers value)? saveUserPlayers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getUserPlayers value)? getUserPlayers,
    TResult Function(_setTransferOutPlayer value)? setTransferOutPlayer,
    TResult Function(_getPlayersInSelectedPosition value)?
        getPlayersInSelectedPosition,
    TResult Function(_transferUserPlayer value)? transferUserPlayer,
    TResult Function(_cancelTransfer value)? cancelTransfer,
    TResult Function(_saveUserPlayers value)? saveUserPlayers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferEventCopyWith<$Res> {
  factory $TransferEventCopyWith(
          TransferEvent value, $Res Function(TransferEvent) then) =
      _$TransferEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$TransferEventCopyWithImpl<$Res>
    implements $TransferEventCopyWith<$Res> {
  _$TransferEventCopyWithImpl(this._value, this._then);

  final TransferEvent _value;
  // ignore: unused_field
  final $Res Function(TransferEvent) _then;
}

/// @nodoc
abstract class _$getUserPlayersCopyWith<$Res> {
  factory _$getUserPlayersCopyWith(
          _getUserPlayers value, $Res Function(_getUserPlayers) then) =
      __$getUserPlayersCopyWithImpl<$Res>;
  $Res call({GameWeekId gameWeekId});
}

/// @nodoc
class __$getUserPlayersCopyWithImpl<$Res>
    extends _$TransferEventCopyWithImpl<$Res>
    implements _$getUserPlayersCopyWith<$Res> {
  __$getUserPlayersCopyWithImpl(
      _getUserPlayers _value, $Res Function(_getUserPlayers) _then)
      : super(_value, (v) => _then(v as _getUserPlayers));

  @override
  _getUserPlayers get _value => super._value as _getUserPlayers;

  @override
  $Res call({
    Object? gameWeekId = freezed,
  }) {
    return _then(_getUserPlayers(
      gameWeekId: gameWeekId == freezed
          ? _value.gameWeekId
          : gameWeekId // ignore: cast_nullable_to_non_nullable
              as GameWeekId,
    ));
  }
}

/// @nodoc

class _$_getUserPlayers implements _getUserPlayers {
  const _$_getUserPlayers({required this.gameWeekId});

  @override
  final GameWeekId gameWeekId;

  @override
  String toString() {
    return 'TransferEvent.getUserPlayers(gameWeekId: $gameWeekId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _getUserPlayers &&
            const DeepCollectionEquality()
                .equals(other.gameWeekId, gameWeekId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(gameWeekId));

  @JsonKey(ignore: true)
  @override
  _$getUserPlayersCopyWith<_getUserPlayers> get copyWith =>
      __$getUserPlayersCopyWithImpl<_getUserPlayers>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GameWeekId gameWeekId) getUserPlayers,
    required TResult Function(
            String transferOutPlayerId, PlayerPosition playerPosition)
        setTransferOutPlayer,
    required TResult Function() getPlayersInSelectedPosition,
    required TResult Function(String transferInPlayerId) transferUserPlayer,
    required TResult Function() cancelTransfer,
    required TResult Function() saveUserPlayers,
  }) {
    return getUserPlayers(gameWeekId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(GameWeekId gameWeekId)? getUserPlayers,
    TResult Function(String transferOutPlayerId, PlayerPosition playerPosition)?
        setTransferOutPlayer,
    TResult Function()? getPlayersInSelectedPosition,
    TResult Function(String transferInPlayerId)? transferUserPlayer,
    TResult Function()? cancelTransfer,
    TResult Function()? saveUserPlayers,
  }) {
    return getUserPlayers?.call(gameWeekId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GameWeekId gameWeekId)? getUserPlayers,
    TResult Function(String transferOutPlayerId, PlayerPosition playerPosition)?
        setTransferOutPlayer,
    TResult Function()? getPlayersInSelectedPosition,
    TResult Function(String transferInPlayerId)? transferUserPlayer,
    TResult Function()? cancelTransfer,
    TResult Function()? saveUserPlayers,
    required TResult orElse(),
  }) {
    if (getUserPlayers != null) {
      return getUserPlayers(gameWeekId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getUserPlayers value) getUserPlayers,
    required TResult Function(_setTransferOutPlayer value) setTransferOutPlayer,
    required TResult Function(_getPlayersInSelectedPosition value)
        getPlayersInSelectedPosition,
    required TResult Function(_transferUserPlayer value) transferUserPlayer,
    required TResult Function(_cancelTransfer value) cancelTransfer,
    required TResult Function(_saveUserPlayers value) saveUserPlayers,
  }) {
    return getUserPlayers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_getUserPlayers value)? getUserPlayers,
    TResult Function(_setTransferOutPlayer value)? setTransferOutPlayer,
    TResult Function(_getPlayersInSelectedPosition value)?
        getPlayersInSelectedPosition,
    TResult Function(_transferUserPlayer value)? transferUserPlayer,
    TResult Function(_cancelTransfer value)? cancelTransfer,
    TResult Function(_saveUserPlayers value)? saveUserPlayers,
  }) {
    return getUserPlayers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getUserPlayers value)? getUserPlayers,
    TResult Function(_setTransferOutPlayer value)? setTransferOutPlayer,
    TResult Function(_getPlayersInSelectedPosition value)?
        getPlayersInSelectedPosition,
    TResult Function(_transferUserPlayer value)? transferUserPlayer,
    TResult Function(_cancelTransfer value)? cancelTransfer,
    TResult Function(_saveUserPlayers value)? saveUserPlayers,
    required TResult orElse(),
  }) {
    if (getUserPlayers != null) {
      return getUserPlayers(this);
    }
    return orElse();
  }
}

abstract class _getUserPlayers implements TransferEvent {
  const factory _getUserPlayers({required GameWeekId gameWeekId}) =
      _$_getUserPlayers;

  GameWeekId get gameWeekId;
  @JsonKey(ignore: true)
  _$getUserPlayersCopyWith<_getUserPlayers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$setTransferOutPlayerCopyWith<$Res> {
  factory _$setTransferOutPlayerCopyWith(_setTransferOutPlayer value,
          $Res Function(_setTransferOutPlayer) then) =
      __$setTransferOutPlayerCopyWithImpl<$Res>;
  $Res call({String transferOutPlayerId, PlayerPosition playerPosition});
}

/// @nodoc
class __$setTransferOutPlayerCopyWithImpl<$Res>
    extends _$TransferEventCopyWithImpl<$Res>
    implements _$setTransferOutPlayerCopyWith<$Res> {
  __$setTransferOutPlayerCopyWithImpl(
      _setTransferOutPlayer _value, $Res Function(_setTransferOutPlayer) _then)
      : super(_value, (v) => _then(v as _setTransferOutPlayer));

  @override
  _setTransferOutPlayer get _value => super._value as _setTransferOutPlayer;

  @override
  $Res call({
    Object? transferOutPlayerId = freezed,
    Object? playerPosition = freezed,
  }) {
    return _then(_setTransferOutPlayer(
      transferOutPlayerId: transferOutPlayerId == freezed
          ? _value.transferOutPlayerId
          : transferOutPlayerId // ignore: cast_nullable_to_non_nullable
              as String,
      playerPosition: playerPosition == freezed
          ? _value.playerPosition
          : playerPosition // ignore: cast_nullable_to_non_nullable
              as PlayerPosition,
    ));
  }
}

/// @nodoc

class _$_setTransferOutPlayer implements _setTransferOutPlayer {
  const _$_setTransferOutPlayer(
      {required this.transferOutPlayerId, required this.playerPosition});

  @override
  final String transferOutPlayerId;
  @override
  final PlayerPosition playerPosition;

  @override
  String toString() {
    return 'TransferEvent.setTransferOutPlayer(transferOutPlayerId: $transferOutPlayerId, playerPosition: $playerPosition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _setTransferOutPlayer &&
            const DeepCollectionEquality()
                .equals(other.transferOutPlayerId, transferOutPlayerId) &&
            const DeepCollectionEquality()
                .equals(other.playerPosition, playerPosition));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(transferOutPlayerId),
      const DeepCollectionEquality().hash(playerPosition));

  @JsonKey(ignore: true)
  @override
  _$setTransferOutPlayerCopyWith<_setTransferOutPlayer> get copyWith =>
      __$setTransferOutPlayerCopyWithImpl<_setTransferOutPlayer>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GameWeekId gameWeekId) getUserPlayers,
    required TResult Function(
            String transferOutPlayerId, PlayerPosition playerPosition)
        setTransferOutPlayer,
    required TResult Function() getPlayersInSelectedPosition,
    required TResult Function(String transferInPlayerId) transferUserPlayer,
    required TResult Function() cancelTransfer,
    required TResult Function() saveUserPlayers,
  }) {
    return setTransferOutPlayer(transferOutPlayerId, playerPosition);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(GameWeekId gameWeekId)? getUserPlayers,
    TResult Function(String transferOutPlayerId, PlayerPosition playerPosition)?
        setTransferOutPlayer,
    TResult Function()? getPlayersInSelectedPosition,
    TResult Function(String transferInPlayerId)? transferUserPlayer,
    TResult Function()? cancelTransfer,
    TResult Function()? saveUserPlayers,
  }) {
    return setTransferOutPlayer?.call(transferOutPlayerId, playerPosition);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GameWeekId gameWeekId)? getUserPlayers,
    TResult Function(String transferOutPlayerId, PlayerPosition playerPosition)?
        setTransferOutPlayer,
    TResult Function()? getPlayersInSelectedPosition,
    TResult Function(String transferInPlayerId)? transferUserPlayer,
    TResult Function()? cancelTransfer,
    TResult Function()? saveUserPlayers,
    required TResult orElse(),
  }) {
    if (setTransferOutPlayer != null) {
      return setTransferOutPlayer(transferOutPlayerId, playerPosition);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getUserPlayers value) getUserPlayers,
    required TResult Function(_setTransferOutPlayer value) setTransferOutPlayer,
    required TResult Function(_getPlayersInSelectedPosition value)
        getPlayersInSelectedPosition,
    required TResult Function(_transferUserPlayer value) transferUserPlayer,
    required TResult Function(_cancelTransfer value) cancelTransfer,
    required TResult Function(_saveUserPlayers value) saveUserPlayers,
  }) {
    return setTransferOutPlayer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_getUserPlayers value)? getUserPlayers,
    TResult Function(_setTransferOutPlayer value)? setTransferOutPlayer,
    TResult Function(_getPlayersInSelectedPosition value)?
        getPlayersInSelectedPosition,
    TResult Function(_transferUserPlayer value)? transferUserPlayer,
    TResult Function(_cancelTransfer value)? cancelTransfer,
    TResult Function(_saveUserPlayers value)? saveUserPlayers,
  }) {
    return setTransferOutPlayer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getUserPlayers value)? getUserPlayers,
    TResult Function(_setTransferOutPlayer value)? setTransferOutPlayer,
    TResult Function(_getPlayersInSelectedPosition value)?
        getPlayersInSelectedPosition,
    TResult Function(_transferUserPlayer value)? transferUserPlayer,
    TResult Function(_cancelTransfer value)? cancelTransfer,
    TResult Function(_saveUserPlayers value)? saveUserPlayers,
    required TResult orElse(),
  }) {
    if (setTransferOutPlayer != null) {
      return setTransferOutPlayer(this);
    }
    return orElse();
  }
}

abstract class _setTransferOutPlayer implements TransferEvent {
  const factory _setTransferOutPlayer(
      {required String transferOutPlayerId,
      required PlayerPosition playerPosition}) = _$_setTransferOutPlayer;

  String get transferOutPlayerId;
  PlayerPosition get playerPosition;
  @JsonKey(ignore: true)
  _$setTransferOutPlayerCopyWith<_setTransferOutPlayer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$getPlayersInSelectedPositionCopyWith<$Res> {
  factory _$getPlayersInSelectedPositionCopyWith(
          _getPlayersInSelectedPosition value,
          $Res Function(_getPlayersInSelectedPosition) then) =
      __$getPlayersInSelectedPositionCopyWithImpl<$Res>;
}

/// @nodoc
class __$getPlayersInSelectedPositionCopyWithImpl<$Res>
    extends _$TransferEventCopyWithImpl<$Res>
    implements _$getPlayersInSelectedPositionCopyWith<$Res> {
  __$getPlayersInSelectedPositionCopyWithImpl(
      _getPlayersInSelectedPosition _value,
      $Res Function(_getPlayersInSelectedPosition) _then)
      : super(_value, (v) => _then(v as _getPlayersInSelectedPosition));

  @override
  _getPlayersInSelectedPosition get _value =>
      super._value as _getPlayersInSelectedPosition;
}

/// @nodoc

class _$_getPlayersInSelectedPosition implements _getPlayersInSelectedPosition {
  const _$_getPlayersInSelectedPosition();

  @override
  String toString() {
    return 'TransferEvent.getPlayersInSelectedPosition()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _getPlayersInSelectedPosition);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GameWeekId gameWeekId) getUserPlayers,
    required TResult Function(
            String transferOutPlayerId, PlayerPosition playerPosition)
        setTransferOutPlayer,
    required TResult Function() getPlayersInSelectedPosition,
    required TResult Function(String transferInPlayerId) transferUserPlayer,
    required TResult Function() cancelTransfer,
    required TResult Function() saveUserPlayers,
  }) {
    return getPlayersInSelectedPosition();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(GameWeekId gameWeekId)? getUserPlayers,
    TResult Function(String transferOutPlayerId, PlayerPosition playerPosition)?
        setTransferOutPlayer,
    TResult Function()? getPlayersInSelectedPosition,
    TResult Function(String transferInPlayerId)? transferUserPlayer,
    TResult Function()? cancelTransfer,
    TResult Function()? saveUserPlayers,
  }) {
    return getPlayersInSelectedPosition?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GameWeekId gameWeekId)? getUserPlayers,
    TResult Function(String transferOutPlayerId, PlayerPosition playerPosition)?
        setTransferOutPlayer,
    TResult Function()? getPlayersInSelectedPosition,
    TResult Function(String transferInPlayerId)? transferUserPlayer,
    TResult Function()? cancelTransfer,
    TResult Function()? saveUserPlayers,
    required TResult orElse(),
  }) {
    if (getPlayersInSelectedPosition != null) {
      return getPlayersInSelectedPosition();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getUserPlayers value) getUserPlayers,
    required TResult Function(_setTransferOutPlayer value) setTransferOutPlayer,
    required TResult Function(_getPlayersInSelectedPosition value)
        getPlayersInSelectedPosition,
    required TResult Function(_transferUserPlayer value) transferUserPlayer,
    required TResult Function(_cancelTransfer value) cancelTransfer,
    required TResult Function(_saveUserPlayers value) saveUserPlayers,
  }) {
    return getPlayersInSelectedPosition(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_getUserPlayers value)? getUserPlayers,
    TResult Function(_setTransferOutPlayer value)? setTransferOutPlayer,
    TResult Function(_getPlayersInSelectedPosition value)?
        getPlayersInSelectedPosition,
    TResult Function(_transferUserPlayer value)? transferUserPlayer,
    TResult Function(_cancelTransfer value)? cancelTransfer,
    TResult Function(_saveUserPlayers value)? saveUserPlayers,
  }) {
    return getPlayersInSelectedPosition?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getUserPlayers value)? getUserPlayers,
    TResult Function(_setTransferOutPlayer value)? setTransferOutPlayer,
    TResult Function(_getPlayersInSelectedPosition value)?
        getPlayersInSelectedPosition,
    TResult Function(_transferUserPlayer value)? transferUserPlayer,
    TResult Function(_cancelTransfer value)? cancelTransfer,
    TResult Function(_saveUserPlayers value)? saveUserPlayers,
    required TResult orElse(),
  }) {
    if (getPlayersInSelectedPosition != null) {
      return getPlayersInSelectedPosition(this);
    }
    return orElse();
  }
}

abstract class _getPlayersInSelectedPosition implements TransferEvent {
  const factory _getPlayersInSelectedPosition() =
      _$_getPlayersInSelectedPosition;
}

/// @nodoc
abstract class _$transferUserPlayerCopyWith<$Res> {
  factory _$transferUserPlayerCopyWith(
          _transferUserPlayer value, $Res Function(_transferUserPlayer) then) =
      __$transferUserPlayerCopyWithImpl<$Res>;
  $Res call({String transferInPlayerId});
}

/// @nodoc
class __$transferUserPlayerCopyWithImpl<$Res>
    extends _$TransferEventCopyWithImpl<$Res>
    implements _$transferUserPlayerCopyWith<$Res> {
  __$transferUserPlayerCopyWithImpl(
      _transferUserPlayer _value, $Res Function(_transferUserPlayer) _then)
      : super(_value, (v) => _then(v as _transferUserPlayer));

  @override
  _transferUserPlayer get _value => super._value as _transferUserPlayer;

  @override
  $Res call({
    Object? transferInPlayerId = freezed,
  }) {
    return _then(_transferUserPlayer(
      transferInPlayerId: transferInPlayerId == freezed
          ? _value.transferInPlayerId
          : transferInPlayerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_transferUserPlayer implements _transferUserPlayer {
  const _$_transferUserPlayer({required this.transferInPlayerId});

  @override
  final String transferInPlayerId;

  @override
  String toString() {
    return 'TransferEvent.transferUserPlayer(transferInPlayerId: $transferInPlayerId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _transferUserPlayer &&
            const DeepCollectionEquality()
                .equals(other.transferInPlayerId, transferInPlayerId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(transferInPlayerId));

  @JsonKey(ignore: true)
  @override
  _$transferUserPlayerCopyWith<_transferUserPlayer> get copyWith =>
      __$transferUserPlayerCopyWithImpl<_transferUserPlayer>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GameWeekId gameWeekId) getUserPlayers,
    required TResult Function(
            String transferOutPlayerId, PlayerPosition playerPosition)
        setTransferOutPlayer,
    required TResult Function() getPlayersInSelectedPosition,
    required TResult Function(String transferInPlayerId) transferUserPlayer,
    required TResult Function() cancelTransfer,
    required TResult Function() saveUserPlayers,
  }) {
    return transferUserPlayer(transferInPlayerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(GameWeekId gameWeekId)? getUserPlayers,
    TResult Function(String transferOutPlayerId, PlayerPosition playerPosition)?
        setTransferOutPlayer,
    TResult Function()? getPlayersInSelectedPosition,
    TResult Function(String transferInPlayerId)? transferUserPlayer,
    TResult Function()? cancelTransfer,
    TResult Function()? saveUserPlayers,
  }) {
    return transferUserPlayer?.call(transferInPlayerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GameWeekId gameWeekId)? getUserPlayers,
    TResult Function(String transferOutPlayerId, PlayerPosition playerPosition)?
        setTransferOutPlayer,
    TResult Function()? getPlayersInSelectedPosition,
    TResult Function(String transferInPlayerId)? transferUserPlayer,
    TResult Function()? cancelTransfer,
    TResult Function()? saveUserPlayers,
    required TResult orElse(),
  }) {
    if (transferUserPlayer != null) {
      return transferUserPlayer(transferInPlayerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getUserPlayers value) getUserPlayers,
    required TResult Function(_setTransferOutPlayer value) setTransferOutPlayer,
    required TResult Function(_getPlayersInSelectedPosition value)
        getPlayersInSelectedPosition,
    required TResult Function(_transferUserPlayer value) transferUserPlayer,
    required TResult Function(_cancelTransfer value) cancelTransfer,
    required TResult Function(_saveUserPlayers value) saveUserPlayers,
  }) {
    return transferUserPlayer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_getUserPlayers value)? getUserPlayers,
    TResult Function(_setTransferOutPlayer value)? setTransferOutPlayer,
    TResult Function(_getPlayersInSelectedPosition value)?
        getPlayersInSelectedPosition,
    TResult Function(_transferUserPlayer value)? transferUserPlayer,
    TResult Function(_cancelTransfer value)? cancelTransfer,
    TResult Function(_saveUserPlayers value)? saveUserPlayers,
  }) {
    return transferUserPlayer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getUserPlayers value)? getUserPlayers,
    TResult Function(_setTransferOutPlayer value)? setTransferOutPlayer,
    TResult Function(_getPlayersInSelectedPosition value)?
        getPlayersInSelectedPosition,
    TResult Function(_transferUserPlayer value)? transferUserPlayer,
    TResult Function(_cancelTransfer value)? cancelTransfer,
    TResult Function(_saveUserPlayers value)? saveUserPlayers,
    required TResult orElse(),
  }) {
    if (transferUserPlayer != null) {
      return transferUserPlayer(this);
    }
    return orElse();
  }
}

abstract class _transferUserPlayer implements TransferEvent {
  const factory _transferUserPlayer({required String transferInPlayerId}) =
      _$_transferUserPlayer;

  String get transferInPlayerId;
  @JsonKey(ignore: true)
  _$transferUserPlayerCopyWith<_transferUserPlayer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$cancelTransferCopyWith<$Res> {
  factory _$cancelTransferCopyWith(
          _cancelTransfer value, $Res Function(_cancelTransfer) then) =
      __$cancelTransferCopyWithImpl<$Res>;
}

/// @nodoc
class __$cancelTransferCopyWithImpl<$Res>
    extends _$TransferEventCopyWithImpl<$Res>
    implements _$cancelTransferCopyWith<$Res> {
  __$cancelTransferCopyWithImpl(
      _cancelTransfer _value, $Res Function(_cancelTransfer) _then)
      : super(_value, (v) => _then(v as _cancelTransfer));

  @override
  _cancelTransfer get _value => super._value as _cancelTransfer;
}

/// @nodoc

class _$_cancelTransfer implements _cancelTransfer {
  const _$_cancelTransfer();

  @override
  String toString() {
    return 'TransferEvent.cancelTransfer()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _cancelTransfer);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GameWeekId gameWeekId) getUserPlayers,
    required TResult Function(
            String transferOutPlayerId, PlayerPosition playerPosition)
        setTransferOutPlayer,
    required TResult Function() getPlayersInSelectedPosition,
    required TResult Function(String transferInPlayerId) transferUserPlayer,
    required TResult Function() cancelTransfer,
    required TResult Function() saveUserPlayers,
  }) {
    return cancelTransfer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(GameWeekId gameWeekId)? getUserPlayers,
    TResult Function(String transferOutPlayerId, PlayerPosition playerPosition)?
        setTransferOutPlayer,
    TResult Function()? getPlayersInSelectedPosition,
    TResult Function(String transferInPlayerId)? transferUserPlayer,
    TResult Function()? cancelTransfer,
    TResult Function()? saveUserPlayers,
  }) {
    return cancelTransfer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GameWeekId gameWeekId)? getUserPlayers,
    TResult Function(String transferOutPlayerId, PlayerPosition playerPosition)?
        setTransferOutPlayer,
    TResult Function()? getPlayersInSelectedPosition,
    TResult Function(String transferInPlayerId)? transferUserPlayer,
    TResult Function()? cancelTransfer,
    TResult Function()? saveUserPlayers,
    required TResult orElse(),
  }) {
    if (cancelTransfer != null) {
      return cancelTransfer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getUserPlayers value) getUserPlayers,
    required TResult Function(_setTransferOutPlayer value) setTransferOutPlayer,
    required TResult Function(_getPlayersInSelectedPosition value)
        getPlayersInSelectedPosition,
    required TResult Function(_transferUserPlayer value) transferUserPlayer,
    required TResult Function(_cancelTransfer value) cancelTransfer,
    required TResult Function(_saveUserPlayers value) saveUserPlayers,
  }) {
    return cancelTransfer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_getUserPlayers value)? getUserPlayers,
    TResult Function(_setTransferOutPlayer value)? setTransferOutPlayer,
    TResult Function(_getPlayersInSelectedPosition value)?
        getPlayersInSelectedPosition,
    TResult Function(_transferUserPlayer value)? transferUserPlayer,
    TResult Function(_cancelTransfer value)? cancelTransfer,
    TResult Function(_saveUserPlayers value)? saveUserPlayers,
  }) {
    return cancelTransfer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getUserPlayers value)? getUserPlayers,
    TResult Function(_setTransferOutPlayer value)? setTransferOutPlayer,
    TResult Function(_getPlayersInSelectedPosition value)?
        getPlayersInSelectedPosition,
    TResult Function(_transferUserPlayer value)? transferUserPlayer,
    TResult Function(_cancelTransfer value)? cancelTransfer,
    TResult Function(_saveUserPlayers value)? saveUserPlayers,
    required TResult orElse(),
  }) {
    if (cancelTransfer != null) {
      return cancelTransfer(this);
    }
    return orElse();
  }
}

abstract class _cancelTransfer implements TransferEvent {
  const factory _cancelTransfer() = _$_cancelTransfer;
}

/// @nodoc
abstract class _$saveUserPlayersCopyWith<$Res> {
  factory _$saveUserPlayersCopyWith(
          _saveUserPlayers value, $Res Function(_saveUserPlayers) then) =
      __$saveUserPlayersCopyWithImpl<$Res>;
}

/// @nodoc
class __$saveUserPlayersCopyWithImpl<$Res>
    extends _$TransferEventCopyWithImpl<$Res>
    implements _$saveUserPlayersCopyWith<$Res> {
  __$saveUserPlayersCopyWithImpl(
      _saveUserPlayers _value, $Res Function(_saveUserPlayers) _then)
      : super(_value, (v) => _then(v as _saveUserPlayers));

  @override
  _saveUserPlayers get _value => super._value as _saveUserPlayers;
}

/// @nodoc

class _$_saveUserPlayers implements _saveUserPlayers {
  const _$_saveUserPlayers();

  @override
  String toString() {
    return 'TransferEvent.saveUserPlayers()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _saveUserPlayers);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GameWeekId gameWeekId) getUserPlayers,
    required TResult Function(
            String transferOutPlayerId, PlayerPosition playerPosition)
        setTransferOutPlayer,
    required TResult Function() getPlayersInSelectedPosition,
    required TResult Function(String transferInPlayerId) transferUserPlayer,
    required TResult Function() cancelTransfer,
    required TResult Function() saveUserPlayers,
  }) {
    return saveUserPlayers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(GameWeekId gameWeekId)? getUserPlayers,
    TResult Function(String transferOutPlayerId, PlayerPosition playerPosition)?
        setTransferOutPlayer,
    TResult Function()? getPlayersInSelectedPosition,
    TResult Function(String transferInPlayerId)? transferUserPlayer,
    TResult Function()? cancelTransfer,
    TResult Function()? saveUserPlayers,
  }) {
    return saveUserPlayers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GameWeekId gameWeekId)? getUserPlayers,
    TResult Function(String transferOutPlayerId, PlayerPosition playerPosition)?
        setTransferOutPlayer,
    TResult Function()? getPlayersInSelectedPosition,
    TResult Function(String transferInPlayerId)? transferUserPlayer,
    TResult Function()? cancelTransfer,
    TResult Function()? saveUserPlayers,
    required TResult orElse(),
  }) {
    if (saveUserPlayers != null) {
      return saveUserPlayers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getUserPlayers value) getUserPlayers,
    required TResult Function(_setTransferOutPlayer value) setTransferOutPlayer,
    required TResult Function(_getPlayersInSelectedPosition value)
        getPlayersInSelectedPosition,
    required TResult Function(_transferUserPlayer value) transferUserPlayer,
    required TResult Function(_cancelTransfer value) cancelTransfer,
    required TResult Function(_saveUserPlayers value) saveUserPlayers,
  }) {
    return saveUserPlayers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_getUserPlayers value)? getUserPlayers,
    TResult Function(_setTransferOutPlayer value)? setTransferOutPlayer,
    TResult Function(_getPlayersInSelectedPosition value)?
        getPlayersInSelectedPosition,
    TResult Function(_transferUserPlayer value)? transferUserPlayer,
    TResult Function(_cancelTransfer value)? cancelTransfer,
    TResult Function(_saveUserPlayers value)? saveUserPlayers,
  }) {
    return saveUserPlayers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getUserPlayers value)? getUserPlayers,
    TResult Function(_setTransferOutPlayer value)? setTransferOutPlayer,
    TResult Function(_getPlayersInSelectedPosition value)?
        getPlayersInSelectedPosition,
    TResult Function(_transferUserPlayer value)? transferUserPlayer,
    TResult Function(_cancelTransfer value)? cancelTransfer,
    TResult Function(_saveUserPlayers value)? saveUserPlayers,
    required TResult orElse(),
  }) {
    if (saveUserPlayers != null) {
      return saveUserPlayers(this);
    }
    return orElse();
  }
}

abstract class _saveUserPlayers implements TransferEvent {
  const factory _saveUserPlayers() = _$_saveUserPlayers;
}

/// @nodoc
class _$TransferStateTearOff {
  const _$TransferStateTearOff();

  _TransferState call(
      {required UserTeam userTeam,
      required UserTeam userTeamCopy,
      required bool isLoading,
      required bool transfersMade,
      required int transfersMadeCount,
      required double remainingInBank,
      required String transferOutPlayerId,
      required PlayerPosition selectedPlayerPosition,
      required List<dynamic> transferredInPlayerIds,
      required List<UserPlayer> selectedPlayerReplacements,
      required Option<Either<dynamic, UserTeam>> userTeamFailureOrSuccess,
      required Option<Either<dynamic, List<UserPlayer>>>
          replacementPlayersFailureOrSuccess,
      required Option<Either<ValueFailure, dynamic>> valueFailureOrSuccess}) {
    return _TransferState(
      userTeam: userTeam,
      userTeamCopy: userTeamCopy,
      isLoading: isLoading,
      transfersMade: transfersMade,
      transfersMadeCount: transfersMadeCount,
      remainingInBank: remainingInBank,
      transferOutPlayerId: transferOutPlayerId,
      selectedPlayerPosition: selectedPlayerPosition,
      transferredInPlayerIds: transferredInPlayerIds,
      selectedPlayerReplacements: selectedPlayerReplacements,
      userTeamFailureOrSuccess: userTeamFailureOrSuccess,
      replacementPlayersFailureOrSuccess: replacementPlayersFailureOrSuccess,
      valueFailureOrSuccess: valueFailureOrSuccess,
    );
  }
}

/// @nodoc
const $TransferState = _$TransferStateTearOff();

/// @nodoc
mixin _$TransferState {
  UserTeam get userTeam => throw _privateConstructorUsedError;
  UserTeam get userTeamCopy => throw _privateConstructorUsedError; //
  bool get isLoading => throw _privateConstructorUsedError; //
  bool get transfersMade => throw _privateConstructorUsedError;
  int get transfersMadeCount => throw _privateConstructorUsedError;
  double get remainingInBank => throw _privateConstructorUsedError; //
  String get transferOutPlayerId => throw _privateConstructorUsedError;
  PlayerPosition get selectedPlayerPosition =>
      throw _privateConstructorUsedError; //
  List<dynamic> get transferredInPlayerIds =>
      throw _privateConstructorUsedError; //
  List<UserPlayer> get selectedPlayerReplacements =>
      throw _privateConstructorUsedError; //
  Option<Either<dynamic, UserTeam>> get userTeamFailureOrSuccess =>
      throw _privateConstructorUsedError;
  Option<Either<dynamic, List<UserPlayer>>>
      get replacementPlayersFailureOrSuccess =>
          throw _privateConstructorUsedError;
  Option<Either<ValueFailure, dynamic>> get valueFailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransferStateCopyWith<TransferState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferStateCopyWith<$Res> {
  factory $TransferStateCopyWith(
          TransferState value, $Res Function(TransferState) then) =
      _$TransferStateCopyWithImpl<$Res>;
  $Res call(
      {UserTeam userTeam,
      UserTeam userTeamCopy,
      bool isLoading,
      bool transfersMade,
      int transfersMadeCount,
      double remainingInBank,
      String transferOutPlayerId,
      PlayerPosition selectedPlayerPosition,
      List<dynamic> transferredInPlayerIds,
      List<UserPlayer> selectedPlayerReplacements,
      Option<Either<dynamic, UserTeam>> userTeamFailureOrSuccess,
      Option<Either<dynamic, List<UserPlayer>>>
          replacementPlayersFailureOrSuccess,
      Option<Either<ValueFailure, dynamic>> valueFailureOrSuccess});

  $UserTeamCopyWith<$Res> get userTeam;
  $UserTeamCopyWith<$Res> get userTeamCopy;
}

/// @nodoc
class _$TransferStateCopyWithImpl<$Res>
    implements $TransferStateCopyWith<$Res> {
  _$TransferStateCopyWithImpl(this._value, this._then);

  final TransferState _value;
  // ignore: unused_field
  final $Res Function(TransferState) _then;

  @override
  $Res call({
    Object? userTeam = freezed,
    Object? userTeamCopy = freezed,
    Object? isLoading = freezed,
    Object? transfersMade = freezed,
    Object? transfersMadeCount = freezed,
    Object? remainingInBank = freezed,
    Object? transferOutPlayerId = freezed,
    Object? selectedPlayerPosition = freezed,
    Object? transferredInPlayerIds = freezed,
    Object? selectedPlayerReplacements = freezed,
    Object? userTeamFailureOrSuccess = freezed,
    Object? replacementPlayersFailureOrSuccess = freezed,
    Object? valueFailureOrSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      userTeam: userTeam == freezed
          ? _value.userTeam
          : userTeam // ignore: cast_nullable_to_non_nullable
              as UserTeam,
      userTeamCopy: userTeamCopy == freezed
          ? _value.userTeamCopy
          : userTeamCopy // ignore: cast_nullable_to_non_nullable
              as UserTeam,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      transfersMade: transfersMade == freezed
          ? _value.transfersMade
          : transfersMade // ignore: cast_nullable_to_non_nullable
              as bool,
      transfersMadeCount: transfersMadeCount == freezed
          ? _value.transfersMadeCount
          : transfersMadeCount // ignore: cast_nullable_to_non_nullable
              as int,
      remainingInBank: remainingInBank == freezed
          ? _value.remainingInBank
          : remainingInBank // ignore: cast_nullable_to_non_nullable
              as double,
      transferOutPlayerId: transferOutPlayerId == freezed
          ? _value.transferOutPlayerId
          : transferOutPlayerId // ignore: cast_nullable_to_non_nullable
              as String,
      selectedPlayerPosition: selectedPlayerPosition == freezed
          ? _value.selectedPlayerPosition
          : selectedPlayerPosition // ignore: cast_nullable_to_non_nullable
              as PlayerPosition,
      transferredInPlayerIds: transferredInPlayerIds == freezed
          ? _value.transferredInPlayerIds
          : transferredInPlayerIds // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      selectedPlayerReplacements: selectedPlayerReplacements == freezed
          ? _value.selectedPlayerReplacements
          : selectedPlayerReplacements // ignore: cast_nullable_to_non_nullable
              as List<UserPlayer>,
      userTeamFailureOrSuccess: userTeamFailureOrSuccess == freezed
          ? _value.userTeamFailureOrSuccess
          : userTeamFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<dynamic, UserTeam>>,
      replacementPlayersFailureOrSuccess: replacementPlayersFailureOrSuccess ==
              freezed
          ? _value.replacementPlayersFailureOrSuccess
          : replacementPlayersFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<dynamic, List<UserPlayer>>>,
      valueFailureOrSuccess: valueFailureOrSuccess == freezed
          ? _value.valueFailureOrSuccess
          : valueFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<ValueFailure, dynamic>>,
    ));
  }

  @override
  $UserTeamCopyWith<$Res> get userTeam {
    return $UserTeamCopyWith<$Res>(_value.userTeam, (value) {
      return _then(_value.copyWith(userTeam: value));
    });
  }

  @override
  $UserTeamCopyWith<$Res> get userTeamCopy {
    return $UserTeamCopyWith<$Res>(_value.userTeamCopy, (value) {
      return _then(_value.copyWith(userTeamCopy: value));
    });
  }
}

/// @nodoc
abstract class _$TransferStateCopyWith<$Res>
    implements $TransferStateCopyWith<$Res> {
  factory _$TransferStateCopyWith(
          _TransferState value, $Res Function(_TransferState) then) =
      __$TransferStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserTeam userTeam,
      UserTeam userTeamCopy,
      bool isLoading,
      bool transfersMade,
      int transfersMadeCount,
      double remainingInBank,
      String transferOutPlayerId,
      PlayerPosition selectedPlayerPosition,
      List<dynamic> transferredInPlayerIds,
      List<UserPlayer> selectedPlayerReplacements,
      Option<Either<dynamic, UserTeam>> userTeamFailureOrSuccess,
      Option<Either<dynamic, List<UserPlayer>>>
          replacementPlayersFailureOrSuccess,
      Option<Either<ValueFailure, dynamic>> valueFailureOrSuccess});

  @override
  $UserTeamCopyWith<$Res> get userTeam;
  @override
  $UserTeamCopyWith<$Res> get userTeamCopy;
}

/// @nodoc
class __$TransferStateCopyWithImpl<$Res>
    extends _$TransferStateCopyWithImpl<$Res>
    implements _$TransferStateCopyWith<$Res> {
  __$TransferStateCopyWithImpl(
      _TransferState _value, $Res Function(_TransferState) _then)
      : super(_value, (v) => _then(v as _TransferState));

  @override
  _TransferState get _value => super._value as _TransferState;

  @override
  $Res call({
    Object? userTeam = freezed,
    Object? userTeamCopy = freezed,
    Object? isLoading = freezed,
    Object? transfersMade = freezed,
    Object? transfersMadeCount = freezed,
    Object? remainingInBank = freezed,
    Object? transferOutPlayerId = freezed,
    Object? selectedPlayerPosition = freezed,
    Object? transferredInPlayerIds = freezed,
    Object? selectedPlayerReplacements = freezed,
    Object? userTeamFailureOrSuccess = freezed,
    Object? replacementPlayersFailureOrSuccess = freezed,
    Object? valueFailureOrSuccess = freezed,
  }) {
    return _then(_TransferState(
      userTeam: userTeam == freezed
          ? _value.userTeam
          : userTeam // ignore: cast_nullable_to_non_nullable
              as UserTeam,
      userTeamCopy: userTeamCopy == freezed
          ? _value.userTeamCopy
          : userTeamCopy // ignore: cast_nullable_to_non_nullable
              as UserTeam,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      transfersMade: transfersMade == freezed
          ? _value.transfersMade
          : transfersMade // ignore: cast_nullable_to_non_nullable
              as bool,
      transfersMadeCount: transfersMadeCount == freezed
          ? _value.transfersMadeCount
          : transfersMadeCount // ignore: cast_nullable_to_non_nullable
              as int,
      remainingInBank: remainingInBank == freezed
          ? _value.remainingInBank
          : remainingInBank // ignore: cast_nullable_to_non_nullable
              as double,
      transferOutPlayerId: transferOutPlayerId == freezed
          ? _value.transferOutPlayerId
          : transferOutPlayerId // ignore: cast_nullable_to_non_nullable
              as String,
      selectedPlayerPosition: selectedPlayerPosition == freezed
          ? _value.selectedPlayerPosition
          : selectedPlayerPosition // ignore: cast_nullable_to_non_nullable
              as PlayerPosition,
      transferredInPlayerIds: transferredInPlayerIds == freezed
          ? _value.transferredInPlayerIds
          : transferredInPlayerIds // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      selectedPlayerReplacements: selectedPlayerReplacements == freezed
          ? _value.selectedPlayerReplacements
          : selectedPlayerReplacements // ignore: cast_nullable_to_non_nullable
              as List<UserPlayer>,
      userTeamFailureOrSuccess: userTeamFailureOrSuccess == freezed
          ? _value.userTeamFailureOrSuccess
          : userTeamFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<dynamic, UserTeam>>,
      replacementPlayersFailureOrSuccess: replacementPlayersFailureOrSuccess ==
              freezed
          ? _value.replacementPlayersFailureOrSuccess
          : replacementPlayersFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<dynamic, List<UserPlayer>>>,
      valueFailureOrSuccess: valueFailureOrSuccess == freezed
          ? _value.valueFailureOrSuccess
          : valueFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<ValueFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_TransferState implements _TransferState {
  const _$_TransferState(
      {required this.userTeam,
      required this.userTeamCopy,
      required this.isLoading,
      required this.transfersMade,
      required this.transfersMadeCount,
      required this.remainingInBank,
      required this.transferOutPlayerId,
      required this.selectedPlayerPosition,
      required this.transferredInPlayerIds,
      required this.selectedPlayerReplacements,
      required this.userTeamFailureOrSuccess,
      required this.replacementPlayersFailureOrSuccess,
      required this.valueFailureOrSuccess});

  @override
  final UserTeam userTeam;
  @override
  final UserTeam userTeamCopy;
  @override //
  final bool isLoading;
  @override //
  final bool transfersMade;
  @override
  final int transfersMadeCount;
  @override
  final double remainingInBank;
  @override //
  final String transferOutPlayerId;
  @override
  final PlayerPosition selectedPlayerPosition;
  @override //
  final List<dynamic> transferredInPlayerIds;
  @override //
  final List<UserPlayer> selectedPlayerReplacements;
  @override //
  final Option<Either<dynamic, UserTeam>> userTeamFailureOrSuccess;
  @override
  final Option<Either<dynamic, List<UserPlayer>>>
      replacementPlayersFailureOrSuccess;
  @override
  final Option<Either<ValueFailure, dynamic>> valueFailureOrSuccess;

  @override
  String toString() {
    return 'TransferState(userTeam: $userTeam, userTeamCopy: $userTeamCopy, isLoading: $isLoading, transfersMade: $transfersMade, transfersMadeCount: $transfersMadeCount, remainingInBank: $remainingInBank, transferOutPlayerId: $transferOutPlayerId, selectedPlayerPosition: $selectedPlayerPosition, transferredInPlayerIds: $transferredInPlayerIds, selectedPlayerReplacements: $selectedPlayerReplacements, userTeamFailureOrSuccess: $userTeamFailureOrSuccess, replacementPlayersFailureOrSuccess: $replacementPlayersFailureOrSuccess, valueFailureOrSuccess: $valueFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TransferState &&
            const DeepCollectionEquality().equals(other.userTeam, userTeam) &&
            const DeepCollectionEquality()
                .equals(other.userTeamCopy, userTeamCopy) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.transfersMade, transfersMade) &&
            const DeepCollectionEquality()
                .equals(other.transfersMadeCount, transfersMadeCount) &&
            const DeepCollectionEquality()
                .equals(other.remainingInBank, remainingInBank) &&
            const DeepCollectionEquality()
                .equals(other.transferOutPlayerId, transferOutPlayerId) &&
            const DeepCollectionEquality()
                .equals(other.selectedPlayerPosition, selectedPlayerPosition) &&
            const DeepCollectionEquality()
                .equals(other.transferredInPlayerIds, transferredInPlayerIds) &&
            const DeepCollectionEquality().equals(
                other.selectedPlayerReplacements, selectedPlayerReplacements) &&
            const DeepCollectionEquality().equals(
                other.userTeamFailureOrSuccess, userTeamFailureOrSuccess) &&
            const DeepCollectionEquality().equals(
                other.replacementPlayersFailureOrSuccess,
                replacementPlayersFailureOrSuccess) &&
            const DeepCollectionEquality()
                .equals(other.valueFailureOrSuccess, valueFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userTeam),
      const DeepCollectionEquality().hash(userTeamCopy),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(transfersMade),
      const DeepCollectionEquality().hash(transfersMadeCount),
      const DeepCollectionEquality().hash(remainingInBank),
      const DeepCollectionEquality().hash(transferOutPlayerId),
      const DeepCollectionEquality().hash(selectedPlayerPosition),
      const DeepCollectionEquality().hash(transferredInPlayerIds),
      const DeepCollectionEquality().hash(selectedPlayerReplacements),
      const DeepCollectionEquality().hash(userTeamFailureOrSuccess),
      const DeepCollectionEquality().hash(replacementPlayersFailureOrSuccess),
      const DeepCollectionEquality().hash(valueFailureOrSuccess));

  @JsonKey(ignore: true)
  @override
  _$TransferStateCopyWith<_TransferState> get copyWith =>
      __$TransferStateCopyWithImpl<_TransferState>(this, _$identity);
}

abstract class _TransferState implements TransferState {
  const factory _TransferState(
      {required UserTeam userTeam,
      required UserTeam userTeamCopy,
      required bool isLoading,
      required bool transfersMade,
      required int transfersMadeCount,
      required double remainingInBank,
      required String transferOutPlayerId,
      required PlayerPosition selectedPlayerPosition,
      required List<dynamic> transferredInPlayerIds,
      required List<UserPlayer> selectedPlayerReplacements,
      required Option<Either<dynamic, UserTeam>> userTeamFailureOrSuccess,
      required Option<Either<dynamic, List<UserPlayer>>>
          replacementPlayersFailureOrSuccess,
      required Option<Either<ValueFailure, dynamic>>
          valueFailureOrSuccess}) = _$_TransferState;

  @override
  UserTeam get userTeam;
  @override
  UserTeam get userTeamCopy;
  @override //
  bool get isLoading;
  @override //
  bool get transfersMade;
  @override
  int get transfersMadeCount;
  @override
  double get remainingInBank;
  @override //
  String get transferOutPlayerId;
  @override
  PlayerPosition get selectedPlayerPosition;
  @override //
  List<dynamic> get transferredInPlayerIds;
  @override //
  List<UserPlayer> get selectedPlayerReplacements;
  @override //
  Option<Either<dynamic, UserTeam>> get userTeamFailureOrSuccess;
  @override
  Option<Either<dynamic, List<UserPlayer>>>
      get replacementPlayersFailureOrSuccess;
  @override
  Option<Either<ValueFailure, dynamic>> get valueFailureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$TransferStateCopyWith<_TransferState> get copyWith =>
      throw _privateConstructorUsedError;
}
