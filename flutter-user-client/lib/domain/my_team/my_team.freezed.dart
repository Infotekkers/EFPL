// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_team.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MyTeamTearOff {
  const _$MyTeamTearOff();

  _MyTeam call(
      {required TeamName teamName,
      required Gameweek activeGameweek,
      required AvailableChips availableChips,
      required Chip activeChip,
      Map<String, dynamic> players = const {
        'gk': [],
        'def': [],
        'mid': [],
        'att': [],
        'sub': []
      }}) {
    return _MyTeam(
      teamName: teamName,
      activeGameweek: activeGameweek,
      availableChips: availableChips,
      activeChip: activeChip,
      players: players,
    );
  }
}

/// @nodoc
const $MyTeam = _$MyTeamTearOff();

/// @nodoc
mixin _$MyTeam {
  TeamName get teamName => throw _privateConstructorUsedError;
  Gameweek get activeGameweek => throw _privateConstructorUsedError;
  AvailableChips get availableChips => throw _privateConstructorUsedError;
  Chip get activeChip => throw _privateConstructorUsedError;
  Map<String, dynamic> get players => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyTeamCopyWith<MyTeam> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyTeamCopyWith<$Res> {
  factory $MyTeamCopyWith(MyTeam value, $Res Function(MyTeam) then) =
      _$MyTeamCopyWithImpl<$Res>;
  $Res call(
      {TeamName teamName,
      Gameweek activeGameweek,
      AvailableChips availableChips,
      Chip activeChip,
      Map<String, dynamic> players});
}

/// @nodoc
class _$MyTeamCopyWithImpl<$Res> implements $MyTeamCopyWith<$Res> {
  _$MyTeamCopyWithImpl(this._value, this._then);

  final MyTeam _value;
  // ignore: unused_field
  final $Res Function(MyTeam) _then;

  @override
  $Res call({
    Object? teamName = freezed,
    Object? activeGameweek = freezed,
    Object? availableChips = freezed,
    Object? activeChip = freezed,
    Object? players = freezed,
  }) {
    return _then(_value.copyWith(
      teamName: teamName == freezed
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as TeamName,
      activeGameweek: activeGameweek == freezed
          ? _value.activeGameweek
          : activeGameweek // ignore: cast_nullable_to_non_nullable
              as Gameweek,
      availableChips: availableChips == freezed
          ? _value.availableChips
          : availableChips // ignore: cast_nullable_to_non_nullable
              as AvailableChips,
      activeChip: activeChip == freezed
          ? _value.activeChip
          : activeChip // ignore: cast_nullable_to_non_nullable
              as Chip,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$MyTeamCopyWith<$Res> implements $MyTeamCopyWith<$Res> {
  factory _$MyTeamCopyWith(_MyTeam value, $Res Function(_MyTeam) then) =
      __$MyTeamCopyWithImpl<$Res>;
  @override
  $Res call(
      {TeamName teamName,
      Gameweek activeGameweek,
      AvailableChips availableChips,
      Chip activeChip,
      Map<String, dynamic> players});
}

/// @nodoc
class __$MyTeamCopyWithImpl<$Res> extends _$MyTeamCopyWithImpl<$Res>
    implements _$MyTeamCopyWith<$Res> {
  __$MyTeamCopyWithImpl(_MyTeam _value, $Res Function(_MyTeam) _then)
      : super(_value, (v) => _then(v as _MyTeam));

  @override
  _MyTeam get _value => super._value as _MyTeam;

  @override
  $Res call({
    Object? teamName = freezed,
    Object? activeGameweek = freezed,
    Object? availableChips = freezed,
    Object? activeChip = freezed,
    Object? players = freezed,
  }) {
    return _then(_MyTeam(
      teamName: teamName == freezed
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as TeamName,
      activeGameweek: activeGameweek == freezed
          ? _value.activeGameweek
          : activeGameweek // ignore: cast_nullable_to_non_nullable
              as Gameweek,
      availableChips: availableChips == freezed
          ? _value.availableChips
          : availableChips // ignore: cast_nullable_to_non_nullable
              as AvailableChips,
      activeChip: activeChip == freezed
          ? _value.activeChip
          : activeChip // ignore: cast_nullable_to_non_nullable
              as Chip,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$_MyTeam implements _MyTeam {
  const _$_MyTeam(
      {required this.teamName,
      required this.activeGameweek,
      required this.availableChips,
      required this.activeChip,
      this.players = const {
        'gk': [],
        'def': [],
        'mid': [],
        'att': [],
        'sub': []
      }});

  @override
  final TeamName teamName;
  @override
  final Gameweek activeGameweek;
  @override
  final AvailableChips availableChips;
  @override
  final Chip activeChip;
  @JsonKey()
  @override
  final Map<String, dynamic> players;

  @override
  String toString() {
    return 'MyTeam(teamName: $teamName, activeGameweek: $activeGameweek, availableChips: $availableChips, activeChip: $activeChip, players: $players)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MyTeam &&
            const DeepCollectionEquality().equals(other.teamName, teamName) &&
            const DeepCollectionEquality()
                .equals(other.activeGameweek, activeGameweek) &&
            const DeepCollectionEquality()
                .equals(other.availableChips, availableChips) &&
            const DeepCollectionEquality()
                .equals(other.activeChip, activeChip) &&
            const DeepCollectionEquality().equals(other.players, players));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(teamName),
      const DeepCollectionEquality().hash(activeGameweek),
      const DeepCollectionEquality().hash(availableChips),
      const DeepCollectionEquality().hash(activeChip),
      const DeepCollectionEquality().hash(players));

  @JsonKey(ignore: true)
  @override
  _$MyTeamCopyWith<_MyTeam> get copyWith =>
      __$MyTeamCopyWithImpl<_MyTeam>(this, _$identity);
}

abstract class _MyTeam implements MyTeam {
  const factory _MyTeam(
      {required TeamName teamName,
      required Gameweek activeGameweek,
      required AvailableChips availableChips,
      required Chip activeChip,
      Map<String, dynamic> players}) = _$_MyTeam;

  @override
  TeamName get teamName;
  @override
  Gameweek get activeGameweek;
  @override
  AvailableChips get availableChips;
  @override
  Chip get activeChip;
  @override
  Map<String, dynamic> get players;
  @override
  @JsonKey(ignore: true)
  _$MyTeamCopyWith<_MyTeam> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$MyTeamPlayerTearOff {
  const _$MyTeamPlayerTearOff();

  _MyTeamPlayer call(
      {required PlayerName playerName,
      required PlayerId playerId,
      required EplTeamId eplTeamId,
      required Position position,
      required Multiplier multiplier,
      required IsCaptain isCaptain,
      required IsViceCaptain isViceCaptain}) {
    return _MyTeamPlayer(
      playerName: playerName,
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
const $MyTeamPlayer = _$MyTeamPlayerTearOff();

/// @nodoc
mixin _$MyTeamPlayer {
  PlayerName get playerName => throw _privateConstructorUsedError;
  PlayerId get playerId => throw _privateConstructorUsedError;
  EplTeamId get eplTeamId => throw _privateConstructorUsedError;
  Position get position => throw _privateConstructorUsedError;
  Multiplier get multiplier => throw _privateConstructorUsedError;
  IsCaptain get isCaptain => throw _privateConstructorUsedError;
  IsViceCaptain get isViceCaptain => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyTeamPlayerCopyWith<MyTeamPlayer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyTeamPlayerCopyWith<$Res> {
  factory $MyTeamPlayerCopyWith(
          MyTeamPlayer value, $Res Function(MyTeamPlayer) then) =
      _$MyTeamPlayerCopyWithImpl<$Res>;
  $Res call(
      {PlayerName playerName,
      PlayerId playerId,
      EplTeamId eplTeamId,
      Position position,
      Multiplier multiplier,
      IsCaptain isCaptain,
      IsViceCaptain isViceCaptain});
}

/// @nodoc
class _$MyTeamPlayerCopyWithImpl<$Res> implements $MyTeamPlayerCopyWith<$Res> {
  _$MyTeamPlayerCopyWithImpl(this._value, this._then);

  final MyTeamPlayer _value;
  // ignore: unused_field
  final $Res Function(MyTeamPlayer) _then;

  @override
  $Res call({
    Object? playerName = freezed,
    Object? playerId = freezed,
    Object? eplTeamId = freezed,
    Object? position = freezed,
    Object? multiplier = freezed,
    Object? isCaptain = freezed,
    Object? isViceCaptain = freezed,
  }) {
    return _then(_value.copyWith(
      playerName: playerName == freezed
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as PlayerName,
      playerId: playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as PlayerId,
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
abstract class _$MyTeamPlayerCopyWith<$Res>
    implements $MyTeamPlayerCopyWith<$Res> {
  factory _$MyTeamPlayerCopyWith(
          _MyTeamPlayer value, $Res Function(_MyTeamPlayer) then) =
      __$MyTeamPlayerCopyWithImpl<$Res>;
  @override
  $Res call(
      {PlayerName playerName,
      PlayerId playerId,
      EplTeamId eplTeamId,
      Position position,
      Multiplier multiplier,
      IsCaptain isCaptain,
      IsViceCaptain isViceCaptain});
}

/// @nodoc
class __$MyTeamPlayerCopyWithImpl<$Res> extends _$MyTeamPlayerCopyWithImpl<$Res>
    implements _$MyTeamPlayerCopyWith<$Res> {
  __$MyTeamPlayerCopyWithImpl(
      _MyTeamPlayer _value, $Res Function(_MyTeamPlayer) _then)
      : super(_value, (v) => _then(v as _MyTeamPlayer));

  @override
  _MyTeamPlayer get _value => super._value as _MyTeamPlayer;

  @override
  $Res call({
    Object? playerName = freezed,
    Object? playerId = freezed,
    Object? eplTeamId = freezed,
    Object? position = freezed,
    Object? multiplier = freezed,
    Object? isCaptain = freezed,
    Object? isViceCaptain = freezed,
  }) {
    return _then(_MyTeamPlayer(
      playerName: playerName == freezed
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as PlayerName,
      playerId: playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as PlayerId,
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

class _$_MyTeamPlayer implements _MyTeamPlayer {
  const _$_MyTeamPlayer(
      {required this.playerName,
      required this.playerId,
      required this.eplTeamId,
      required this.position,
      required this.multiplier,
      required this.isCaptain,
      required this.isViceCaptain});

  @override
  final PlayerName playerName;
  @override
  final PlayerId playerId;
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
    return 'MyTeamPlayer(playerName: $playerName, playerId: $playerId, eplTeamId: $eplTeamId, position: $position, multiplier: $multiplier, isCaptain: $isCaptain, isViceCaptain: $isViceCaptain)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MyTeamPlayer &&
            const DeepCollectionEquality()
                .equals(other.playerName, playerName) &&
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
      const DeepCollectionEquality().hash(playerName),
      const DeepCollectionEquality().hash(playerId),
      const DeepCollectionEquality().hash(eplTeamId),
      const DeepCollectionEquality().hash(position),
      const DeepCollectionEquality().hash(multiplier),
      const DeepCollectionEquality().hash(isCaptain),
      const DeepCollectionEquality().hash(isViceCaptain));

  @JsonKey(ignore: true)
  @override
  _$MyTeamPlayerCopyWith<_MyTeamPlayer> get copyWith =>
      __$MyTeamPlayerCopyWithImpl<_MyTeamPlayer>(this, _$identity);
}

abstract class _MyTeamPlayer implements MyTeamPlayer {
  const factory _MyTeamPlayer(
      {required PlayerName playerName,
      required PlayerId playerId,
      required EplTeamId eplTeamId,
      required Position position,
      required Multiplier multiplier,
      required IsCaptain isCaptain,
      required IsViceCaptain isViceCaptain}) = _$_MyTeamPlayer;

  @override
  PlayerName get playerName;
  @override
  PlayerId get playerId;
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
  _$MyTeamPlayerCopyWith<_MyTeamPlayer> get copyWith =>
      throw _privateConstructorUsedError;
}
