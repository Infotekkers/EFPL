// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'points_player_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PointUserPlayerDTO _$PointUserPlayerDTOFromJson(Map<String, dynamic> json) {
  return _PointUserPlayerDTO.fromJson(json);
}

/// @nodoc
class _$PointUserPlayerDTOTearOff {
  const _$PointUserPlayerDTOTearOff();

  _PointUserPlayerDTO call(
      {required String playerId,
      required String playerName,
      required String playerPosition,
      required String eplTeamId,
      required int multiplier,
      required bool isCaptain,
      required bool isViceCaptain,
      required List<dynamic> score,
      required String fixtureStatus,
      required String fixtureScore,
      required String fixtureTeams}) {
    return _PointUserPlayerDTO(
      playerId: playerId,
      playerName: playerName,
      playerPosition: playerPosition,
      eplTeamId: eplTeamId,
      multiplier: multiplier,
      isCaptain: isCaptain,
      isViceCaptain: isViceCaptain,
      score: score,
      fixtureStatus: fixtureStatus,
      fixtureScore: fixtureScore,
      fixtureTeams: fixtureTeams,
    );
  }

  PointUserPlayerDTO fromJson(Map<String, Object?> json) {
    return PointUserPlayerDTO.fromJson(json);
  }
}

/// @nodoc
const $PointUserPlayerDTO = _$PointUserPlayerDTOTearOff();

/// @nodoc
mixin _$PointUserPlayerDTO {
  String get playerId => throw _privateConstructorUsedError;
  String get playerName => throw _privateConstructorUsedError;
  String get playerPosition => throw _privateConstructorUsedError;
  String get eplTeamId => throw _privateConstructorUsedError;
  int get multiplier => throw _privateConstructorUsedError;
  bool get isCaptain => throw _privateConstructorUsedError;
  bool get isViceCaptain => throw _privateConstructorUsedError;
  List<dynamic> get score =>
      throw _privateConstructorUsedError; // required PlayerAvailability availability,
  String get fixtureStatus => throw _privateConstructorUsedError;
  String get fixtureScore => throw _privateConstructorUsedError;
  String get fixtureTeams => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointUserPlayerDTOCopyWith<PointUserPlayerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointUserPlayerDTOCopyWith<$Res> {
  factory $PointUserPlayerDTOCopyWith(
          PointUserPlayerDTO value, $Res Function(PointUserPlayerDTO) then) =
      _$PointUserPlayerDTOCopyWithImpl<$Res>;
  $Res call(
      {String playerId,
      String playerName,
      String playerPosition,
      String eplTeamId,
      int multiplier,
      bool isCaptain,
      bool isViceCaptain,
      List<dynamic> score,
      String fixtureStatus,
      String fixtureScore,
      String fixtureTeams});
}

/// @nodoc
class _$PointUserPlayerDTOCopyWithImpl<$Res>
    implements $PointUserPlayerDTOCopyWith<$Res> {
  _$PointUserPlayerDTOCopyWithImpl(this._value, this._then);

  final PointUserPlayerDTO _value;
  // ignore: unused_field
  final $Res Function(PointUserPlayerDTO) _then;

  @override
  $Res call({
    Object? playerId = freezed,
    Object? playerName = freezed,
    Object? playerPosition = freezed,
    Object? eplTeamId = freezed,
    Object? multiplier = freezed,
    Object? isCaptain = freezed,
    Object? isViceCaptain = freezed,
    Object? score = freezed,
    Object? fixtureStatus = freezed,
    Object? fixtureScore = freezed,
    Object? fixtureTeams = freezed,
  }) {
    return _then(_value.copyWith(
      playerId: playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      playerName: playerName == freezed
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      playerPosition: playerPosition == freezed
          ? _value.playerPosition
          : playerPosition // ignore: cast_nullable_to_non_nullable
              as String,
      eplTeamId: eplTeamId == freezed
          ? _value.eplTeamId
          : eplTeamId // ignore: cast_nullable_to_non_nullable
              as String,
      multiplier: multiplier == freezed
          ? _value.multiplier
          : multiplier // ignore: cast_nullable_to_non_nullable
              as int,
      isCaptain: isCaptain == freezed
          ? _value.isCaptain
          : isCaptain // ignore: cast_nullable_to_non_nullable
              as bool,
      isViceCaptain: isViceCaptain == freezed
          ? _value.isViceCaptain
          : isViceCaptain // ignore: cast_nullable_to_non_nullable
              as bool,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      fixtureStatus: fixtureStatus == freezed
          ? _value.fixtureStatus
          : fixtureStatus // ignore: cast_nullable_to_non_nullable
              as String,
      fixtureScore: fixtureScore == freezed
          ? _value.fixtureScore
          : fixtureScore // ignore: cast_nullable_to_non_nullable
              as String,
      fixtureTeams: fixtureTeams == freezed
          ? _value.fixtureTeams
          : fixtureTeams // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PointUserPlayerDTOCopyWith<$Res>
    implements $PointUserPlayerDTOCopyWith<$Res> {
  factory _$PointUserPlayerDTOCopyWith(
          _PointUserPlayerDTO value, $Res Function(_PointUserPlayerDTO) then) =
      __$PointUserPlayerDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String playerId,
      String playerName,
      String playerPosition,
      String eplTeamId,
      int multiplier,
      bool isCaptain,
      bool isViceCaptain,
      List<dynamic> score,
      String fixtureStatus,
      String fixtureScore,
      String fixtureTeams});
}

/// @nodoc
class __$PointUserPlayerDTOCopyWithImpl<$Res>
    extends _$PointUserPlayerDTOCopyWithImpl<$Res>
    implements _$PointUserPlayerDTOCopyWith<$Res> {
  __$PointUserPlayerDTOCopyWithImpl(
      _PointUserPlayerDTO _value, $Res Function(_PointUserPlayerDTO) _then)
      : super(_value, (v) => _then(v as _PointUserPlayerDTO));

  @override
  _PointUserPlayerDTO get _value => super._value as _PointUserPlayerDTO;

  @override
  $Res call({
    Object? playerId = freezed,
    Object? playerName = freezed,
    Object? playerPosition = freezed,
    Object? eplTeamId = freezed,
    Object? multiplier = freezed,
    Object? isCaptain = freezed,
    Object? isViceCaptain = freezed,
    Object? score = freezed,
    Object? fixtureStatus = freezed,
    Object? fixtureScore = freezed,
    Object? fixtureTeams = freezed,
  }) {
    return _then(_PointUserPlayerDTO(
      playerId: playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      playerName: playerName == freezed
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      playerPosition: playerPosition == freezed
          ? _value.playerPosition
          : playerPosition // ignore: cast_nullable_to_non_nullable
              as String,
      eplTeamId: eplTeamId == freezed
          ? _value.eplTeamId
          : eplTeamId // ignore: cast_nullable_to_non_nullable
              as String,
      multiplier: multiplier == freezed
          ? _value.multiplier
          : multiplier // ignore: cast_nullable_to_non_nullable
              as int,
      isCaptain: isCaptain == freezed
          ? _value.isCaptain
          : isCaptain // ignore: cast_nullable_to_non_nullable
              as bool,
      isViceCaptain: isViceCaptain == freezed
          ? _value.isViceCaptain
          : isViceCaptain // ignore: cast_nullable_to_non_nullable
              as bool,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      fixtureStatus: fixtureStatus == freezed
          ? _value.fixtureStatus
          : fixtureStatus // ignore: cast_nullable_to_non_nullable
              as String,
      fixtureScore: fixtureScore == freezed
          ? _value.fixtureScore
          : fixtureScore // ignore: cast_nullable_to_non_nullable
              as String,
      fixtureTeams: fixtureTeams == freezed
          ? _value.fixtureTeams
          : fixtureTeams // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PointUserPlayerDTO extends _PointUserPlayerDTO {
  const _$_PointUserPlayerDTO(
      {required this.playerId,
      required this.playerName,
      required this.playerPosition,
      required this.eplTeamId,
      required this.multiplier,
      required this.isCaptain,
      required this.isViceCaptain,
      required this.score,
      required this.fixtureStatus,
      required this.fixtureScore,
      required this.fixtureTeams})
      : super._();

  factory _$_PointUserPlayerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_PointUserPlayerDTOFromJson(json);

  @override
  final String playerId;
  @override
  final String playerName;
  @override
  final String playerPosition;
  @override
  final String eplTeamId;
  @override
  final int multiplier;
  @override
  final bool isCaptain;
  @override
  final bool isViceCaptain;
  @override
  final List<dynamic> score;
  @override // required PlayerAvailability availability,
  final String fixtureStatus;
  @override
  final String fixtureScore;
  @override
  final String fixtureTeams;

  @override
  String toString() {
    return 'PointUserPlayerDTO(playerId: $playerId, playerName: $playerName, playerPosition: $playerPosition, eplTeamId: $eplTeamId, multiplier: $multiplier, isCaptain: $isCaptain, isViceCaptain: $isViceCaptain, score: $score, fixtureStatus: $fixtureStatus, fixtureScore: $fixtureScore, fixtureTeams: $fixtureTeams)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PointUserPlayerDTO &&
            const DeepCollectionEquality().equals(other.playerId, playerId) &&
            const DeepCollectionEquality()
                .equals(other.playerName, playerName) &&
            const DeepCollectionEquality()
                .equals(other.playerPosition, playerPosition) &&
            const DeepCollectionEquality().equals(other.eplTeamId, eplTeamId) &&
            const DeepCollectionEquality()
                .equals(other.multiplier, multiplier) &&
            const DeepCollectionEquality().equals(other.isCaptain, isCaptain) &&
            const DeepCollectionEquality()
                .equals(other.isViceCaptain, isViceCaptain) &&
            const DeepCollectionEquality().equals(other.score, score) &&
            const DeepCollectionEquality()
                .equals(other.fixtureStatus, fixtureStatus) &&
            const DeepCollectionEquality()
                .equals(other.fixtureScore, fixtureScore) &&
            const DeepCollectionEquality()
                .equals(other.fixtureTeams, fixtureTeams));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerId),
      const DeepCollectionEquality().hash(playerName),
      const DeepCollectionEquality().hash(playerPosition),
      const DeepCollectionEquality().hash(eplTeamId),
      const DeepCollectionEquality().hash(multiplier),
      const DeepCollectionEquality().hash(isCaptain),
      const DeepCollectionEquality().hash(isViceCaptain),
      const DeepCollectionEquality().hash(score),
      const DeepCollectionEquality().hash(fixtureStatus),
      const DeepCollectionEquality().hash(fixtureScore),
      const DeepCollectionEquality().hash(fixtureTeams));

  @JsonKey(ignore: true)
  @override
  _$PointUserPlayerDTOCopyWith<_PointUserPlayerDTO> get copyWith =>
      __$PointUserPlayerDTOCopyWithImpl<_PointUserPlayerDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PointUserPlayerDTOToJson(this);
  }
}

abstract class _PointUserPlayerDTO extends PointUserPlayerDTO {
  const factory _PointUserPlayerDTO(
      {required String playerId,
      required String playerName,
      required String playerPosition,
      required String eplTeamId,
      required int multiplier,
      required bool isCaptain,
      required bool isViceCaptain,
      required List<dynamic> score,
      required String fixtureStatus,
      required String fixtureScore,
      required String fixtureTeams}) = _$_PointUserPlayerDTO;
  const _PointUserPlayerDTO._() : super._();

  factory _PointUserPlayerDTO.fromJson(Map<String, dynamic> json) =
      _$_PointUserPlayerDTO.fromJson;

  @override
  String get playerId;
  @override
  String get playerName;
  @override
  String get playerPosition;
  @override
  String get eplTeamId;
  @override
  int get multiplier;
  @override
  bool get isCaptain;
  @override
  bool get isViceCaptain;
  @override
  List<dynamic> get score;
  @override // required PlayerAvailability availability,
  String get fixtureStatus;
  @override
  String get fixtureScore;
  @override
  String get fixtureTeams;
  @override
  @JsonKey(ignore: true)
  _$PointUserPlayerDTOCopyWith<_PointUserPlayerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}