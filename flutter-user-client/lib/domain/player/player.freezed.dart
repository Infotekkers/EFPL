// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlayerTearOff {
  const _$PlayerTearOff();

  _Player call(
      {required Name name,
      required Id playerId,
      required EplTeamId eplTeamId,
      required Position position,
      required Multiplier multiplier,
      required IsCaptain isCaptain,
      required IsViceCaptain isViceCaptain}) {
    return _Player(
      name: name,
      playerId: playerId,
      eplTeamId: eplTeamId,
      position: position,
      multiplier: multiplier,
      isCaptain: isCaptain,
      isViceCaptain: isViceCaptain,
    );
  }
}

/// @nodoc
const $Player = _$PlayerTearOff();

/// @nodoc
mixin _$Player {
  Name get name => throw _privateConstructorUsedError;
  Id get playerId => throw _privateConstructorUsedError;
  EplTeamId get eplTeamId => throw _privateConstructorUsedError;
  Position get position => throw _privateConstructorUsedError;
  Multiplier get multiplier => throw _privateConstructorUsedError;
  IsCaptain get isCaptain => throw _privateConstructorUsedError;
  IsViceCaptain get isViceCaptain => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerCopyWith<Player> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) then) =
      _$PlayerCopyWithImpl<$Res>;
  $Res call(
      {Name name,
      Id playerId,
      EplTeamId eplTeamId,
      Position position,
      Multiplier multiplier,
      IsCaptain isCaptain,
      IsViceCaptain isViceCaptain});
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res> implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._value, this._then);

  final Player _value;
  // ignore: unused_field
  final $Res Function(Player) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? playerId = freezed,
    Object? eplTeamId = freezed,
    Object? position = freezed,
    Object? multiplier = freezed,
    Object? isCaptain = freezed,
    Object? isViceCaptain = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      playerId: playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as Id,
      eplTeamId: eplTeamId == freezed
          ? _value.eplTeamId
          : eplTeamId // ignore: cast_nullable_to_non_nullable
              as EplTeamId,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
      multiplier: multiplier == freezed
          ? _value.multiplier
          : multiplier // ignore: cast_nullable_to_non_nullable
              as Multiplier,
      isCaptain: isCaptain == freezed
          ? _value.isCaptain
          : isCaptain // ignore: cast_nullable_to_non_nullable
              as IsCaptain,
      isViceCaptain: isViceCaptain == freezed
          ? _value.isViceCaptain
          : isViceCaptain // ignore: cast_nullable_to_non_nullable
              as IsViceCaptain,
    ));
  }
}

/// @nodoc
abstract class _$PlayerCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$PlayerCopyWith(_Player value, $Res Function(_Player) then) =
      __$PlayerCopyWithImpl<$Res>;
  @override
  $Res call(
      {Name name,
      Id playerId,
      EplTeamId eplTeamId,
      Position position,
      Multiplier multiplier,
      IsCaptain isCaptain,
      IsViceCaptain isViceCaptain});
}

/// @nodoc
class __$PlayerCopyWithImpl<$Res> extends _$PlayerCopyWithImpl<$Res>
    implements _$PlayerCopyWith<$Res> {
  __$PlayerCopyWithImpl(_Player _value, $Res Function(_Player) _then)
      : super(_value, (v) => _then(v as _Player));

  @override
  _Player get _value => super._value as _Player;

  @override
  $Res call({
    Object? name = freezed,
    Object? playerId = freezed,
    Object? eplTeamId = freezed,
    Object? position = freezed,
    Object? multiplier = freezed,
    Object? isCaptain = freezed,
    Object? isViceCaptain = freezed,
  }) {
    return _then(_Player(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      playerId: playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as Id,
      eplTeamId: eplTeamId == freezed
          ? _value.eplTeamId
          : eplTeamId // ignore: cast_nullable_to_non_nullable
              as EplTeamId,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
      multiplier: multiplier == freezed
          ? _value.multiplier
          : multiplier // ignore: cast_nullable_to_non_nullable
              as Multiplier,
      isCaptain: isCaptain == freezed
          ? _value.isCaptain
          : isCaptain // ignore: cast_nullable_to_non_nullable
              as IsCaptain,
      isViceCaptain: isViceCaptain == freezed
          ? _value.isViceCaptain
          : isViceCaptain // ignore: cast_nullable_to_non_nullable
              as IsViceCaptain,
    ));
  }
}

/// @nodoc

class _$_Player implements _Player {
  const _$_Player(
      {required this.name,
      required this.playerId,
      required this.eplTeamId,
      required this.position,
      required this.multiplier,
      required this.isCaptain,
      required this.isViceCaptain});

  @override
  final Name name;
  @override
  final Id playerId;
  @override
  final EplTeamId eplTeamId;
  @override
  final Position position;
  @override
  final Multiplier multiplier;
  @override
  final IsCaptain isCaptain;
  @override
  final IsViceCaptain isViceCaptain;

  @override
  String toString() {
    return 'Player(name: $name, playerId: $playerId, eplTeamId: $eplTeamId, position: $position, multiplier: $multiplier, isCaptain: $isCaptain, isViceCaptain: $isViceCaptain)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Player &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.playerId, playerId) &&
            const DeepCollectionEquality().equals(other.eplTeamId, eplTeamId) &&
            const DeepCollectionEquality().equals(other.position, position) &&
            const DeepCollectionEquality()
                .equals(other.multiplier, multiplier) &&
            const DeepCollectionEquality().equals(other.isCaptain, isCaptain) &&
            const DeepCollectionEquality()
                .equals(other.isViceCaptain, isViceCaptain));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(playerId),
      const DeepCollectionEquality().hash(eplTeamId),
      const DeepCollectionEquality().hash(position),
      const DeepCollectionEquality().hash(multiplier),
      const DeepCollectionEquality().hash(isCaptain),
      const DeepCollectionEquality().hash(isViceCaptain));

  @JsonKey(ignore: true)
  @override
  _$PlayerCopyWith<_Player> get copyWith =>
      __$PlayerCopyWithImpl<_Player>(this, _$identity);
}

abstract class _Player implements Player {
  const factory _Player(
      {required Name name,
      required Id playerId,
      required EplTeamId eplTeamId,
      required Position position,
      required Multiplier multiplier,
      required IsCaptain isCaptain,
      required IsViceCaptain isViceCaptain}) = _$_Player;

  @override
  Name get name;
  @override
  Id get playerId;
  @override
  EplTeamId get eplTeamId;
  @override
  Position get position;
  @override
  Multiplier get multiplier;
  @override
  IsCaptain get isCaptain;
  @override
  IsViceCaptain get isViceCaptain;
  @override
  @JsonKey(ignore: true)
  _$PlayerCopyWith<_Player> get copyWith => throw _privateConstructorUsedError;
}
