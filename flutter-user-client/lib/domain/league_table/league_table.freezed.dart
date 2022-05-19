// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'league_table.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LeagueTableTearOff {
  const _$LeagueTableTearOff();

  _LeagueTable call({required TeamName teamName, required TeamLogo teamLogo}) {
    return _LeagueTable(
      teamName: teamName,
      teamLogo: teamLogo,
    );
  }
}

/// @nodoc
const $LeagueTable = _$LeagueTableTearOff();

/// @nodoc
mixin _$LeagueTable {
  TeamName get teamName => throw _privateConstructorUsedError;
  TeamLogo get teamLogo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LeagueTableCopyWith<LeagueTable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeagueTableCopyWith<$Res> {
  factory $LeagueTableCopyWith(
          LeagueTable value, $Res Function(LeagueTable) then) =
      _$LeagueTableCopyWithImpl<$Res>;
  $Res call({TeamName teamName, TeamLogo teamLogo});
}

/// @nodoc
class _$LeagueTableCopyWithImpl<$Res> implements $LeagueTableCopyWith<$Res> {
  _$LeagueTableCopyWithImpl(this._value, this._then);

  final LeagueTable _value;
  // ignore: unused_field
  final $Res Function(LeagueTable) _then;

  @override
  $Res call({
    Object? teamName = freezed,
    Object? teamLogo = freezed,
  }) {
    return _then(_value.copyWith(
      teamName: teamName == freezed
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as TeamName,
      teamLogo: teamLogo == freezed
          ? _value.teamLogo
          : teamLogo // ignore: cast_nullable_to_non_nullable
              as TeamLogo,
    ));
  }
}

/// @nodoc
abstract class _$LeagueTableCopyWith<$Res>
    implements $LeagueTableCopyWith<$Res> {
  factory _$LeagueTableCopyWith(
          _LeagueTable value, $Res Function(_LeagueTable) then) =
      __$LeagueTableCopyWithImpl<$Res>;
  @override
  $Res call({TeamName teamName, TeamLogo teamLogo});
}

/// @nodoc
class __$LeagueTableCopyWithImpl<$Res> extends _$LeagueTableCopyWithImpl<$Res>
    implements _$LeagueTableCopyWith<$Res> {
  __$LeagueTableCopyWithImpl(
      _LeagueTable _value, $Res Function(_LeagueTable) _then)
      : super(_value, (v) => _then(v as _LeagueTable));

  @override
  _LeagueTable get _value => super._value as _LeagueTable;

  @override
  $Res call({
    Object? teamName = freezed,
    Object? teamLogo = freezed,
  }) {
    return _then(_LeagueTable(
      teamName: teamName == freezed
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as TeamName,
      teamLogo: teamLogo == freezed
          ? _value.teamLogo
          : teamLogo // ignore: cast_nullable_to_non_nullable
              as TeamLogo,
    ));
  }
}

/// @nodoc

class _$_LeagueTable implements _LeagueTable {
  const _$_LeagueTable({required this.teamName, required this.teamLogo});

  @override
  final TeamName teamName;
  @override
  final TeamLogo teamLogo;

  @override
  String toString() {
    return 'LeagueTable(teamName: $teamName, teamLogo: $teamLogo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LeagueTable &&
            const DeepCollectionEquality().equals(other.teamName, teamName) &&
            const DeepCollectionEquality().equals(other.teamLogo, teamLogo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(teamName),
      const DeepCollectionEquality().hash(teamLogo));

  @JsonKey(ignore: true)
  @override
  _$LeagueTableCopyWith<_LeagueTable> get copyWith =>
      __$LeagueTableCopyWithImpl<_LeagueTable>(this, _$identity);
}

abstract class _LeagueTable implements LeagueTable {
  const factory _LeagueTable(
      {required TeamName teamName,
      required TeamLogo teamLogo}) = _$_LeagueTable;

  @override
  TeamName get teamName;
  @override
  TeamLogo get teamLogo;
  @override
  @JsonKey(ignore: true)
  _$LeagueTableCopyWith<_LeagueTable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$TeamLeagueTableTearOff {
  const _$TeamLeagueTableTearOff();

  _TeamLeagueTable call(
      {required TeamPoint teamPoint,
      required TeamWon won,
      required TeamLost lost,
      required TeamDraw Draw,
      required TeamGoalDifferntial goalDifferntial,
      required TeamGoalAgainst goalAgainst,
      required TeamGoalFor goalFor}) {
    return _TeamLeagueTable(
      teamPoint: teamPoint,
      won: won,
      lost: lost,
      Draw: Draw,
      goalDifferntial: goalDifferntial,
      goalAgainst: goalAgainst,
      goalFor: goalFor,
    );
  }
}

/// @nodoc
const $TeamLeagueTable = _$TeamLeagueTableTearOff();

/// @nodoc
mixin _$TeamLeagueTable {
  TeamPoint get teamPoint => throw _privateConstructorUsedError;
  TeamWon get won => throw _privateConstructorUsedError;
  TeamLost get lost => throw _privateConstructorUsedError;
  TeamDraw get Draw => throw _privateConstructorUsedError;
  TeamGoalDifferntial get goalDifferntial => throw _privateConstructorUsedError;
  TeamGoalAgainst get goalAgainst => throw _privateConstructorUsedError;
  TeamGoalFor get goalFor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TeamLeagueTableCopyWith<TeamLeagueTable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamLeagueTableCopyWith<$Res> {
  factory $TeamLeagueTableCopyWith(
          TeamLeagueTable value, $Res Function(TeamLeagueTable) then) =
      _$TeamLeagueTableCopyWithImpl<$Res>;
  $Res call(
      {TeamPoint teamPoint,
      TeamWon won,
      TeamLost lost,
      TeamDraw Draw,
      TeamGoalDifferntial goalDifferntial,
      TeamGoalAgainst goalAgainst,
      TeamGoalFor goalFor});
}

/// @nodoc
class _$TeamLeagueTableCopyWithImpl<$Res>
    implements $TeamLeagueTableCopyWith<$Res> {
  _$TeamLeagueTableCopyWithImpl(this._value, this._then);

  final TeamLeagueTable _value;
  // ignore: unused_field
  final $Res Function(TeamLeagueTable) _then;

  @override
  $Res call({
    Object? teamPoint = freezed,
    Object? won = freezed,
    Object? lost = freezed,
    Object? Draw = freezed,
    Object? goalDifferntial = freezed,
    Object? goalAgainst = freezed,
    Object? goalFor = freezed,
  }) {
    return _then(_value.copyWith(
      teamPoint: teamPoint == freezed
          ? _value.teamPoint
          : teamPoint // ignore: cast_nullable_to_non_nullable
              as TeamPoint,
      won: won == freezed
          ? _value.won
          : won // ignore: cast_nullable_to_non_nullable
              as TeamWon,
      lost: lost == freezed
          ? _value.lost
          : lost // ignore: cast_nullable_to_non_nullable
              as TeamLost,
      Draw: Draw == freezed
          ? _value.Draw
          : Draw // ignore: cast_nullable_to_non_nullable
              as TeamDraw,
      goalDifferntial: goalDifferntial == freezed
          ? _value.goalDifferntial
          : goalDifferntial // ignore: cast_nullable_to_non_nullable
              as TeamGoalDifferntial,
      goalAgainst: goalAgainst == freezed
          ? _value.goalAgainst
          : goalAgainst // ignore: cast_nullable_to_non_nullable
              as TeamGoalAgainst,
      goalFor: goalFor == freezed
          ? _value.goalFor
          : goalFor // ignore: cast_nullable_to_non_nullable
              as TeamGoalFor,
    ));
  }
}

/// @nodoc
abstract class _$TeamLeagueTableCopyWith<$Res>
    implements $TeamLeagueTableCopyWith<$Res> {
  factory _$TeamLeagueTableCopyWith(
          _TeamLeagueTable value, $Res Function(_TeamLeagueTable) then) =
      __$TeamLeagueTableCopyWithImpl<$Res>;
  @override
  $Res call(
      {TeamPoint teamPoint,
      TeamWon won,
      TeamLost lost,
      TeamDraw Draw,
      TeamGoalDifferntial goalDifferntial,
      TeamGoalAgainst goalAgainst,
      TeamGoalFor goalFor});
}

/// @nodoc
class __$TeamLeagueTableCopyWithImpl<$Res>
    extends _$TeamLeagueTableCopyWithImpl<$Res>
    implements _$TeamLeagueTableCopyWith<$Res> {
  __$TeamLeagueTableCopyWithImpl(
      _TeamLeagueTable _value, $Res Function(_TeamLeagueTable) _then)
      : super(_value, (v) => _then(v as _TeamLeagueTable));

  @override
  _TeamLeagueTable get _value => super._value as _TeamLeagueTable;

  @override
  $Res call({
    Object? teamPoint = freezed,
    Object? won = freezed,
    Object? lost = freezed,
    Object? Draw = freezed,
    Object? goalDifferntial = freezed,
    Object? goalAgainst = freezed,
    Object? goalFor = freezed,
  }) {
    return _then(_TeamLeagueTable(
      teamPoint: teamPoint == freezed
          ? _value.teamPoint
          : teamPoint // ignore: cast_nullable_to_non_nullable
              as TeamPoint,
      won: won == freezed
          ? _value.won
          : won // ignore: cast_nullable_to_non_nullable
              as TeamWon,
      lost: lost == freezed
          ? _value.lost
          : lost // ignore: cast_nullable_to_non_nullable
              as TeamLost,
      Draw: Draw == freezed
          ? _value.Draw
          : Draw // ignore: cast_nullable_to_non_nullable
              as TeamDraw,
      goalDifferntial: goalDifferntial == freezed
          ? _value.goalDifferntial
          : goalDifferntial // ignore: cast_nullable_to_non_nullable
              as TeamGoalDifferntial,
      goalAgainst: goalAgainst == freezed
          ? _value.goalAgainst
          : goalAgainst // ignore: cast_nullable_to_non_nullable
              as TeamGoalAgainst,
      goalFor: goalFor == freezed
          ? _value.goalFor
          : goalFor // ignore: cast_nullable_to_non_nullable
              as TeamGoalFor,
    ));
  }
}

/// @nodoc

class _$_TeamLeagueTable implements _TeamLeagueTable {
  const _$_TeamLeagueTable(
      {required this.teamPoint,
      required this.won,
      required this.lost,
      required this.Draw,
      required this.goalDifferntial,
      required this.goalAgainst,
      required this.goalFor});

  @override
  final TeamPoint teamPoint;
  @override
  final TeamWon won;
  @override
  final TeamLost lost;
  @override
  final TeamDraw Draw;
  @override
  final TeamGoalDifferntial goalDifferntial;
  @override
  final TeamGoalAgainst goalAgainst;
  @override
  final TeamGoalFor goalFor;

  @override
  String toString() {
    return 'TeamLeagueTable(teamPoint: $teamPoint, won: $won, lost: $lost, Draw: $Draw, goalDifferntial: $goalDifferntial, goalAgainst: $goalAgainst, goalFor: $goalFor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TeamLeagueTable &&
            const DeepCollectionEquality().equals(other.teamPoint, teamPoint) &&
            const DeepCollectionEquality().equals(other.won, won) &&
            const DeepCollectionEquality().equals(other.lost, lost) &&
            const DeepCollectionEquality().equals(other.Draw, Draw) &&
            const DeepCollectionEquality()
                .equals(other.goalDifferntial, goalDifferntial) &&
            const DeepCollectionEquality()
                .equals(other.goalAgainst, goalAgainst) &&
            const DeepCollectionEquality().equals(other.goalFor, goalFor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(teamPoint),
      const DeepCollectionEquality().hash(won),
      const DeepCollectionEquality().hash(lost),
      const DeepCollectionEquality().hash(Draw),
      const DeepCollectionEquality().hash(goalDifferntial),
      const DeepCollectionEquality().hash(goalAgainst),
      const DeepCollectionEquality().hash(goalFor));

  @JsonKey(ignore: true)
  @override
  _$TeamLeagueTableCopyWith<_TeamLeagueTable> get copyWith =>
      __$TeamLeagueTableCopyWithImpl<_TeamLeagueTable>(this, _$identity);
}

abstract class _TeamLeagueTable implements TeamLeagueTable {
  const factory _TeamLeagueTable(
      {required TeamPoint teamPoint,
      required TeamWon won,
      required TeamLost lost,
      required TeamDraw Draw,
      required TeamGoalDifferntial goalDifferntial,
      required TeamGoalAgainst goalAgainst,
      required TeamGoalFor goalFor}) = _$_TeamLeagueTable;

  @override
  TeamPoint get teamPoint;
  @override
  TeamWon get won;
  @override
  TeamLost get lost;
  @override
  TeamDraw get Draw;
  @override
  TeamGoalDifferntial get goalDifferntial;
  @override
  TeamGoalAgainst get goalAgainst;
  @override
  TeamGoalFor get goalFor;
  @override
  @JsonKey(ignore: true)
  _$TeamLeagueTableCopyWith<_TeamLeagueTable> get copyWith =>
      throw _privateConstructorUsedError;
}
