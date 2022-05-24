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

  _LeagueTable call(
      {required TeamName teamName,
      required TeamLogo teamLogo,
      required List<dynamic> teamPosition}) {
    return _LeagueTable(
      teamName: teamName,
      teamLogo: teamLogo,
      teamPosition: teamPosition,
    );
  }
}

/// @nodoc
const $LeagueTable = _$LeagueTableTearOff();

/// @nodoc
mixin _$LeagueTable {
  TeamName get teamName => throw _privateConstructorUsedError;
  TeamLogo get teamLogo => throw _privateConstructorUsedError;
  List<dynamic> get teamPosition => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LeagueTableCopyWith<LeagueTable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeagueTableCopyWith<$Res> {
  factory $LeagueTableCopyWith(
          LeagueTable value, $Res Function(LeagueTable) then) =
      _$LeagueTableCopyWithImpl<$Res>;
  $Res call({TeamName teamName, TeamLogo teamLogo, List<dynamic> teamPosition});
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
    Object? teamPosition = freezed,
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
      teamPosition: teamPosition == freezed
          ? _value.teamPosition
          : teamPosition // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
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
  $Res call({TeamName teamName, TeamLogo teamLogo, List<dynamic> teamPosition});
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
    Object? teamPosition = freezed,
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
      teamPosition: teamPosition == freezed
          ? _value.teamPosition
          : teamPosition // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$_LeagueTable implements _LeagueTable {
  const _$_LeagueTable(
      {required this.teamName,
      required this.teamLogo,
      required this.teamPosition});

  @override
  final TeamName teamName;
  @override
  final TeamLogo teamLogo;
  @override
  final List<dynamic> teamPosition;

  @override
  String toString() {
    return 'LeagueTable(teamName: $teamName, teamLogo: $teamLogo, teamPosition: $teamPosition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LeagueTable &&
            const DeepCollectionEquality().equals(other.teamName, teamName) &&
            const DeepCollectionEquality().equals(other.teamLogo, teamLogo) &&
            const DeepCollectionEquality()
                .equals(other.teamPosition, teamPosition));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(teamName),
      const DeepCollectionEquality().hash(teamLogo),
      const DeepCollectionEquality().hash(teamPosition));

  @JsonKey(ignore: true)
  @override
  _$LeagueTableCopyWith<_LeagueTable> get copyWith =>
      __$LeagueTableCopyWithImpl<_LeagueTable>(this, _$identity);
}

abstract class _LeagueTable implements LeagueTable {
  const factory _LeagueTable(
      {required TeamName teamName,
      required TeamLogo teamLogo,
      required List<dynamic> teamPosition}) = _$_LeagueTable;

  @override
  TeamName get teamName;
  @override
  TeamLogo get teamLogo;
  @override
  List<dynamic> get teamPosition;
  @override
  @JsonKey(ignore: true)
  _$LeagueTableCopyWith<_LeagueTable> get copyWith =>
      throw _privateConstructorUsedError;
}
