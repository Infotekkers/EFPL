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
      required Gameweek gameweek,
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
      gameweek: gameweek,
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
  Gameweek get gameweek => throw _privateConstructorUsedError;
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
      Gameweek gameweek,
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
    Object? gameweek = freezed,
    Object? availableChips = freezed,
    Object? activeChip = freezed,
    Object? players = freezed,
  }) {
    return _then(_value.copyWith(
      teamName: teamName == freezed
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as TeamName,
      gameweek: gameweek == freezed
          ? _value.gameweek
          : gameweek // ignore: cast_nullable_to_non_nullable
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
      Gameweek gameweek,
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
    Object? gameweek = freezed,
    Object? availableChips = freezed,
    Object? activeChip = freezed,
    Object? players = freezed,
  }) {
    return _then(_MyTeam(
      teamName: teamName == freezed
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as TeamName,
      gameweek: gameweek == freezed
          ? _value.gameweek
          : gameweek // ignore: cast_nullable_to_non_nullable
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
      required this.gameweek,
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
  final Gameweek gameweek;
  @override
  final AvailableChips availableChips;
  @override
  final Chip activeChip;
  @JsonKey()
  @override
  final Map<String, dynamic> players;

  @override
  String toString() {
    return 'MyTeam(teamName: $teamName, gameweek: $gameweek, availableChips: $availableChips, activeChip: $activeChip, players: $players)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MyTeam &&
            const DeepCollectionEquality().equals(other.teamName, teamName) &&
            const DeepCollectionEquality().equals(other.gameweek, gameweek) &&
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
      const DeepCollectionEquality().hash(gameweek),
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
      required Gameweek gameweek,
      required AvailableChips availableChips,
      required Chip activeChip,
      Map<String, dynamic> players}) = _$_MyTeam;

  @override
  TeamName get teamName;
  @override
  Gameweek get gameweek;
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
