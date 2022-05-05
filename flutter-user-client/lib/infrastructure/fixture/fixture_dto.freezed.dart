// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fixture_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FixtureDTO _$FixtureDTOFromJson(Map<String, dynamic> json) {
  return _FixtureDTO.fromJson(json);
}

/// @nodoc
class _$FixtureDTOTearOff {
  const _$FixtureDTOTearOff();

  _FixtureDTO call(
      {required int gameweekId,
      required String matchId,
      required String schedule,
      required String status,
      required String homeTeam,
      required String awayTeam,
      required List<dynamic> homeTeamLineUp,
      required List<dynamic> awayTeamLineUp,
      required String score,
      required List<dynamic> matchStat}) {
    return _FixtureDTO(
      gameweekId: gameweekId,
      matchId: matchId,
      schedule: schedule,
      status: status,
      homeTeam: homeTeam,
      awayTeam: awayTeam,
      homeTeamLineUp: homeTeamLineUp,
      awayTeamLineUp: awayTeamLineUp,
      score: score,
      matchStat: matchStat,
    );
  }

  FixtureDTO fromJson(Map<String, Object?> json) {
    return FixtureDTO.fromJson(json);
  }
}

/// @nodoc
const $FixtureDTO = _$FixtureDTOTearOff();

/// @nodoc
mixin _$FixtureDTO {
  int get gameweekId => throw _privateConstructorUsedError;
  String get matchId => throw _privateConstructorUsedError;
  String get schedule => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get homeTeam => throw _privateConstructorUsedError;
  String get awayTeam => throw _privateConstructorUsedError;
  List<dynamic> get homeTeamLineUp => throw _privateConstructorUsedError;
  List<dynamic> get awayTeamLineUp => throw _privateConstructorUsedError;
  String get score => throw _privateConstructorUsedError;
  List<dynamic> get matchStat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FixtureDTOCopyWith<FixtureDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FixtureDTOCopyWith<$Res> {
  factory $FixtureDTOCopyWith(
          FixtureDTO value, $Res Function(FixtureDTO) then) =
      _$FixtureDTOCopyWithImpl<$Res>;
  $Res call(
      {int gameweekId,
      String matchId,
      String schedule,
      String status,
      String homeTeam,
      String awayTeam,
      List<dynamic> homeTeamLineUp,
      List<dynamic> awayTeamLineUp,
      String score,
      List<dynamic> matchStat});
}

/// @nodoc
class _$FixtureDTOCopyWithImpl<$Res> implements $FixtureDTOCopyWith<$Res> {
  _$FixtureDTOCopyWithImpl(this._value, this._then);

  final FixtureDTO _value;
  // ignore: unused_field
  final $Res Function(FixtureDTO) _then;

  @override
  $Res call({
    Object? gameweekId = freezed,
    Object? matchId = freezed,
    Object? schedule = freezed,
    Object? status = freezed,
    Object? homeTeam = freezed,
    Object? awayTeam = freezed,
    Object? homeTeamLineUp = freezed,
    Object? awayTeamLineUp = freezed,
    Object? score = freezed,
    Object? matchStat = freezed,
  }) {
    return _then(_value.copyWith(
      gameweekId: gameweekId == freezed
          ? _value.gameweekId
          : gameweekId // ignore: cast_nullable_to_non_nullable
              as int,
      matchId: matchId == freezed
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String,
      schedule: schedule == freezed
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      homeTeam: homeTeam == freezed
          ? _value.homeTeam
          : homeTeam // ignore: cast_nullable_to_non_nullable
              as String,
      awayTeam: awayTeam == freezed
          ? _value.awayTeam
          : awayTeam // ignore: cast_nullable_to_non_nullable
              as String,
      homeTeamLineUp: homeTeamLineUp == freezed
          ? _value.homeTeamLineUp
          : homeTeamLineUp // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      awayTeamLineUp: awayTeamLineUp == freezed
          ? _value.awayTeamLineUp
          : awayTeamLineUp // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as String,
      matchStat: matchStat == freezed
          ? _value.matchStat
          : matchStat // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$FixtureDTOCopyWith<$Res> implements $FixtureDTOCopyWith<$Res> {
  factory _$FixtureDTOCopyWith(
          _FixtureDTO value, $Res Function(_FixtureDTO) then) =
      __$FixtureDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {int gameweekId,
      String matchId,
      String schedule,
      String status,
      String homeTeam,
      String awayTeam,
      List<dynamic> homeTeamLineUp,
      List<dynamic> awayTeamLineUp,
      String score,
      List<dynamic> matchStat});
}

/// @nodoc
class __$FixtureDTOCopyWithImpl<$Res> extends _$FixtureDTOCopyWithImpl<$Res>
    implements _$FixtureDTOCopyWith<$Res> {
  __$FixtureDTOCopyWithImpl(
      _FixtureDTO _value, $Res Function(_FixtureDTO) _then)
      : super(_value, (v) => _then(v as _FixtureDTO));

  @override
  _FixtureDTO get _value => super._value as _FixtureDTO;

  @override
  $Res call({
    Object? gameweekId = freezed,
    Object? matchId = freezed,
    Object? schedule = freezed,
    Object? status = freezed,
    Object? homeTeam = freezed,
    Object? awayTeam = freezed,
    Object? homeTeamLineUp = freezed,
    Object? awayTeamLineUp = freezed,
    Object? score = freezed,
    Object? matchStat = freezed,
  }) {
    return _then(_FixtureDTO(
      gameweekId: gameweekId == freezed
          ? _value.gameweekId
          : gameweekId // ignore: cast_nullable_to_non_nullable
              as int,
      matchId: matchId == freezed
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String,
      schedule: schedule == freezed
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      homeTeam: homeTeam == freezed
          ? _value.homeTeam
          : homeTeam // ignore: cast_nullable_to_non_nullable
              as String,
      awayTeam: awayTeam == freezed
          ? _value.awayTeam
          : awayTeam // ignore: cast_nullable_to_non_nullable
              as String,
      homeTeamLineUp: homeTeamLineUp == freezed
          ? _value.homeTeamLineUp
          : homeTeamLineUp // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      awayTeamLineUp: awayTeamLineUp == freezed
          ? _value.awayTeamLineUp
          : awayTeamLineUp // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as String,
      matchStat: matchStat == freezed
          ? _value.matchStat
          : matchStat // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FixtureDTO extends _FixtureDTO {
  const _$_FixtureDTO(
      {required this.gameweekId,
      required this.matchId,
      required this.schedule,
      required this.status,
      required this.homeTeam,
      required this.awayTeam,
      required this.homeTeamLineUp,
      required this.awayTeamLineUp,
      required this.score,
      required this.matchStat})
      : super._();

  factory _$_FixtureDTO.fromJson(Map<String, dynamic> json) =>
      _$$_FixtureDTOFromJson(json);

  @override
  final int gameweekId;
  @override
  final String matchId;
  @override
  final String schedule;
  @override
  final String status;
  @override
  final String homeTeam;
  @override
  final String awayTeam;
  @override
  final List<dynamic> homeTeamLineUp;
  @override
  final List<dynamic> awayTeamLineUp;
  @override
  final String score;
  @override
  final List<dynamic> matchStat;

  @override
  String toString() {
    return 'FixtureDTO(gameweekId: $gameweekId, matchId: $matchId, schedule: $schedule, status: $status, homeTeam: $homeTeam, awayTeam: $awayTeam, homeTeamLineUp: $homeTeamLineUp, awayTeamLineUp: $awayTeamLineUp, score: $score, matchStat: $matchStat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FixtureDTO &&
            const DeepCollectionEquality()
                .equals(other.gameweekId, gameweekId) &&
            const DeepCollectionEquality().equals(other.matchId, matchId) &&
            const DeepCollectionEquality().equals(other.schedule, schedule) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.homeTeam, homeTeam) &&
            const DeepCollectionEquality().equals(other.awayTeam, awayTeam) &&
            const DeepCollectionEquality()
                .equals(other.homeTeamLineUp, homeTeamLineUp) &&
            const DeepCollectionEquality()
                .equals(other.awayTeamLineUp, awayTeamLineUp) &&
            const DeepCollectionEquality().equals(other.score, score) &&
            const DeepCollectionEquality().equals(other.matchStat, matchStat));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(gameweekId),
      const DeepCollectionEquality().hash(matchId),
      const DeepCollectionEquality().hash(schedule),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(homeTeam),
      const DeepCollectionEquality().hash(awayTeam),
      const DeepCollectionEquality().hash(homeTeamLineUp),
      const DeepCollectionEquality().hash(awayTeamLineUp),
      const DeepCollectionEquality().hash(score),
      const DeepCollectionEquality().hash(matchStat));

  @JsonKey(ignore: true)
  @override
  _$FixtureDTOCopyWith<_FixtureDTO> get copyWith =>
      __$FixtureDTOCopyWithImpl<_FixtureDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FixtureDTOToJson(this);
  }
}

abstract class _FixtureDTO extends FixtureDTO {
  const factory _FixtureDTO(
      {required int gameweekId,
      required String matchId,
      required String schedule,
      required String status,
      required String homeTeam,
      required String awayTeam,
      required List<dynamic> homeTeamLineUp,
      required List<dynamic> awayTeamLineUp,
      required String score,
      required List<dynamic> matchStat}) = _$_FixtureDTO;
  const _FixtureDTO._() : super._();

  factory _FixtureDTO.fromJson(Map<String, dynamic> json) =
      _$_FixtureDTO.fromJson;

  @override
  int get gameweekId;
  @override
  String get matchId;
  @override
  String get schedule;
  @override
  String get status;
  @override
  String get homeTeam;
  @override
  String get awayTeam;
  @override
  List<dynamic> get homeTeamLineUp;
  @override
  List<dynamic> get awayTeamLineUp;
  @override
  String get score;
  @override
  List<dynamic> get matchStat;
  @override
  @JsonKey(ignore: true)
  _$FixtureDTOCopyWith<_FixtureDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
