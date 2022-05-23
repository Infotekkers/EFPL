// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'points.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PointsInfoTearOff {
  const _$PointsInfoTearOff();

  _PointsInfo call(
      {required List<PointUserPlayer> allPlayers,
      required int gameWeekId,
      required String teamName,
      required String activeChip,
      required int deduction,
      required int maxActiveCount}) {
    return _PointsInfo(
      allPlayers: allPlayers,
      gameWeekId: gameWeekId,
      teamName: teamName,
      activeChip: activeChip,
      deduction: deduction,
      maxActiveCount: maxActiveCount,
    );
  }
}

/// @nodoc
const $PointsInfo = _$PointsInfoTearOff();

/// @nodoc
mixin _$PointsInfo {
  List<PointUserPlayer> get allPlayers => throw _privateConstructorUsedError;
  int get gameWeekId => throw _privateConstructorUsedError;
  String get teamName => throw _privateConstructorUsedError;
  String get activeChip => throw _privateConstructorUsedError;
  int get deduction => throw _privateConstructorUsedError;
  int get maxActiveCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PointsInfoCopyWith<PointsInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointsInfoCopyWith<$Res> {
  factory $PointsInfoCopyWith(
          PointsInfo value, $Res Function(PointsInfo) then) =
      _$PointsInfoCopyWithImpl<$Res>;
  $Res call(
      {List<PointUserPlayer> allPlayers,
      int gameWeekId,
      String teamName,
      String activeChip,
      int deduction,
      int maxActiveCount});
}

/// @nodoc
class _$PointsInfoCopyWithImpl<$Res> implements $PointsInfoCopyWith<$Res> {
  _$PointsInfoCopyWithImpl(this._value, this._then);

  final PointsInfo _value;
  // ignore: unused_field
  final $Res Function(PointsInfo) _then;

  @override
  $Res call({
    Object? allPlayers = freezed,
    Object? gameWeekId = freezed,
    Object? teamName = freezed,
    Object? activeChip = freezed,
    Object? deduction = freezed,
    Object? maxActiveCount = freezed,
  }) {
    return _then(_value.copyWith(
      allPlayers: allPlayers == freezed
          ? _value.allPlayers
          : allPlayers // ignore: cast_nullable_to_non_nullable
              as List<PointUserPlayer>,
      gameWeekId: gameWeekId == freezed
          ? _value.gameWeekId
          : gameWeekId // ignore: cast_nullable_to_non_nullable
              as int,
      teamName: teamName == freezed
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String,
      activeChip: activeChip == freezed
          ? _value.activeChip
          : activeChip // ignore: cast_nullable_to_non_nullable
              as String,
      deduction: deduction == freezed
          ? _value.deduction
          : deduction // ignore: cast_nullable_to_non_nullable
              as int,
      maxActiveCount: maxActiveCount == freezed
          ? _value.maxActiveCount
          : maxActiveCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$PointsInfoCopyWith<$Res> implements $PointsInfoCopyWith<$Res> {
  factory _$PointsInfoCopyWith(
          _PointsInfo value, $Res Function(_PointsInfo) then) =
      __$PointsInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<PointUserPlayer> allPlayers,
      int gameWeekId,
      String teamName,
      String activeChip,
      int deduction,
      int maxActiveCount});
}

/// @nodoc
class __$PointsInfoCopyWithImpl<$Res> extends _$PointsInfoCopyWithImpl<$Res>
    implements _$PointsInfoCopyWith<$Res> {
  __$PointsInfoCopyWithImpl(
      _PointsInfo _value, $Res Function(_PointsInfo) _then)
      : super(_value, (v) => _then(v as _PointsInfo));

  @override
  _PointsInfo get _value => super._value as _PointsInfo;

  @override
  $Res call({
    Object? allPlayers = freezed,
    Object? gameWeekId = freezed,
    Object? teamName = freezed,
    Object? activeChip = freezed,
    Object? deduction = freezed,
    Object? maxActiveCount = freezed,
  }) {
    return _then(_PointsInfo(
      allPlayers: allPlayers == freezed
          ? _value.allPlayers
          : allPlayers // ignore: cast_nullable_to_non_nullable
              as List<PointUserPlayer>,
      gameWeekId: gameWeekId == freezed
          ? _value.gameWeekId
          : gameWeekId // ignore: cast_nullable_to_non_nullable
              as int,
      teamName: teamName == freezed
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String,
      activeChip: activeChip == freezed
          ? _value.activeChip
          : activeChip // ignore: cast_nullable_to_non_nullable
              as String,
      deduction: deduction == freezed
          ? _value.deduction
          : deduction // ignore: cast_nullable_to_non_nullable
              as int,
      maxActiveCount: maxActiveCount == freezed
          ? _value.maxActiveCount
          : maxActiveCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PointsInfo implements _PointsInfo {
  const _$_PointsInfo(
      {required this.allPlayers,
      required this.gameWeekId,
      required this.teamName,
      required this.activeChip,
      required this.deduction,
      required this.maxActiveCount});

  @override
  final List<PointUserPlayer> allPlayers;
  @override
  final int gameWeekId;
  @override
  final String teamName;
  @override
  final String activeChip;
  @override
  final int deduction;
  @override
  final int maxActiveCount;

  @override
  String toString() {
    return 'PointsInfo(allPlayers: $allPlayers, gameWeekId: $gameWeekId, teamName: $teamName, activeChip: $activeChip, deduction: $deduction, maxActiveCount: $maxActiveCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PointsInfo &&
            const DeepCollectionEquality()
                .equals(other.allPlayers, allPlayers) &&
            const DeepCollectionEquality()
                .equals(other.gameWeekId, gameWeekId) &&
            const DeepCollectionEquality().equals(other.teamName, teamName) &&
            const DeepCollectionEquality()
                .equals(other.activeChip, activeChip) &&
            const DeepCollectionEquality().equals(other.deduction, deduction) &&
            const DeepCollectionEquality()
                .equals(other.maxActiveCount, maxActiveCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(allPlayers),
      const DeepCollectionEquality().hash(gameWeekId),
      const DeepCollectionEquality().hash(teamName),
      const DeepCollectionEquality().hash(activeChip),
      const DeepCollectionEquality().hash(deduction),
      const DeepCollectionEquality().hash(maxActiveCount));

  @JsonKey(ignore: true)
  @override
  _$PointsInfoCopyWith<_PointsInfo> get copyWith =>
      __$PointsInfoCopyWithImpl<_PointsInfo>(this, _$identity);
}

abstract class _PointsInfo implements PointsInfo {
  const factory _PointsInfo(
      {required List<PointUserPlayer> allPlayers,
      required int gameWeekId,
      required String teamName,
      required String activeChip,
      required int deduction,
      required int maxActiveCount}) = _$_PointsInfo;

  @override
  List<PointUserPlayer> get allPlayers;
  @override
  int get gameWeekId;
  @override
  String get teamName;
  @override
  String get activeChip;
  @override
  int get deduction;
  @override
  int get maxActiveCount;
  @override
  @JsonKey(ignore: true)
  _$PointsInfoCopyWith<_PointsInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
