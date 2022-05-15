// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_player_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserPlayerDTO _$UserPlayerDTOFromJson(Map<String, dynamic> json) {
  return _UserPlayerDTO.fromJson(json);
}

/// @nodoc
class _$UserPlayerDTOTearOff {
  const _$UserPlayerDTOTearOff();

  _UserPlayerDTO call(
      {required String playerId,
      required String playerName,
      required double currentPrice,
      required String position,
      required String eplTeamId,
      required int multiplier,
      required bool isCaptain,
      required bool isViceCaptain,
      required Map<dynamic, dynamic> availability,
      required String eplTeamLogo,
      required int score,
      required List<dynamic> upComingFixtures}) {
    return _UserPlayerDTO(
      playerId: playerId,
      playerName: playerName,
      currentPrice: currentPrice,
      position: position,
      eplTeamId: eplTeamId,
      multiplier: multiplier,
      isCaptain: isCaptain,
      isViceCaptain: isViceCaptain,
      availability: availability,
      eplTeamLogo: eplTeamLogo,
      score: score,
      upComingFixtures: upComingFixtures,
    );
  }

  UserPlayerDTO fromJson(Map<String, Object?> json) {
    return UserPlayerDTO.fromJson(json);
  }
}

/// @nodoc
const $UserPlayerDTO = _$UserPlayerDTOTearOff();

/// @nodoc
mixin _$UserPlayerDTO {
  String get playerId => throw _privateConstructorUsedError;
  String get playerName => throw _privateConstructorUsedError;
  double get currentPrice => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  String get eplTeamId => throw _privateConstructorUsedError;
  int get multiplier => throw _privateConstructorUsedError;
  bool get isCaptain => throw _privateConstructorUsedError;
  bool get isViceCaptain => throw _privateConstructorUsedError;
  Map<dynamic, dynamic> get availability => throw _privateConstructorUsedError;
  String get eplTeamLogo => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  List<dynamic> get upComingFixtures => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPlayerDTOCopyWith<UserPlayerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPlayerDTOCopyWith<$Res> {
  factory $UserPlayerDTOCopyWith(
          UserPlayerDTO value, $Res Function(UserPlayerDTO) then) =
      _$UserPlayerDTOCopyWithImpl<$Res>;
  $Res call(
      {String playerId,
      String playerName,
      double currentPrice,
      String position,
      String eplTeamId,
      int multiplier,
      bool isCaptain,
      bool isViceCaptain,
      Map<dynamic, dynamic> availability,
      String eplTeamLogo,
      int score,
      List<dynamic> upComingFixtures});
}

/// @nodoc
class _$UserPlayerDTOCopyWithImpl<$Res>
    implements $UserPlayerDTOCopyWith<$Res> {
  _$UserPlayerDTOCopyWithImpl(this._value, this._then);

  final UserPlayerDTO _value;
  // ignore: unused_field
  final $Res Function(UserPlayerDTO) _then;

  @override
  $Res call({
    Object? playerId = freezed,
    Object? playerName = freezed,
    Object? currentPrice = freezed,
    Object? position = freezed,
    Object? eplTeamId = freezed,
    Object? multiplier = freezed,
    Object? isCaptain = freezed,
    Object? isViceCaptain = freezed,
    Object? availability = freezed,
    Object? eplTeamLogo = freezed,
    Object? score = freezed,
    Object? upComingFixtures = freezed,
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
      currentPrice: currentPrice == freezed
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as double,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
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
      availability: availability == freezed
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      eplTeamLogo: eplTeamLogo == freezed
          ? _value.eplTeamLogo
          : eplTeamLogo // ignore: cast_nullable_to_non_nullable
              as String,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      upComingFixtures: upComingFixtures == freezed
          ? _value.upComingFixtures
          : upComingFixtures // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$UserPlayerDTOCopyWith<$Res>
    implements $UserPlayerDTOCopyWith<$Res> {
  factory _$UserPlayerDTOCopyWith(
          _UserPlayerDTO value, $Res Function(_UserPlayerDTO) then) =
      __$UserPlayerDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String playerId,
      String playerName,
      double currentPrice,
      String position,
      String eplTeamId,
      int multiplier,
      bool isCaptain,
      bool isViceCaptain,
      Map<dynamic, dynamic> availability,
      String eplTeamLogo,
      int score,
      List<dynamic> upComingFixtures});
}

/// @nodoc
class __$UserPlayerDTOCopyWithImpl<$Res>
    extends _$UserPlayerDTOCopyWithImpl<$Res>
    implements _$UserPlayerDTOCopyWith<$Res> {
  __$UserPlayerDTOCopyWithImpl(
      _UserPlayerDTO _value, $Res Function(_UserPlayerDTO) _then)
      : super(_value, (v) => _then(v as _UserPlayerDTO));

  @override
  _UserPlayerDTO get _value => super._value as _UserPlayerDTO;

  @override
  $Res call({
    Object? playerId = freezed,
    Object? playerName = freezed,
    Object? currentPrice = freezed,
    Object? position = freezed,
    Object? eplTeamId = freezed,
    Object? multiplier = freezed,
    Object? isCaptain = freezed,
    Object? isViceCaptain = freezed,
    Object? availability = freezed,
    Object? eplTeamLogo = freezed,
    Object? score = freezed,
    Object? upComingFixtures = freezed,
  }) {
    return _then(_UserPlayerDTO(
      playerId: playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      playerName: playerName == freezed
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      currentPrice: currentPrice == freezed
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as double,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
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
      availability: availability == freezed
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      eplTeamLogo: eplTeamLogo == freezed
          ? _value.eplTeamLogo
          : eplTeamLogo // ignore: cast_nullable_to_non_nullable
              as String,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      upComingFixtures: upComingFixtures == freezed
          ? _value.upComingFixtures
          : upComingFixtures // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserPlayerDTO extends _UserPlayerDTO {
  const _$_UserPlayerDTO(
      {required this.playerId,
      required this.playerName,
      required this.currentPrice,
      required this.position,
      required this.eplTeamId,
      required this.multiplier,
      required this.isCaptain,
      required this.isViceCaptain,
      required this.availability,
      required this.eplTeamLogo,
      required this.score,
      required this.upComingFixtures})
      : super._();

  factory _$_UserPlayerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_UserPlayerDTOFromJson(json);

  @override
  final String playerId;
  @override
  final String playerName;
  @override
  final double currentPrice;
  @override
  final String position;
  @override
  final String eplTeamId;
  @override
  final int multiplier;
  @override
  final bool isCaptain;
  @override
  final bool isViceCaptain;
  @override
  final Map<dynamic, dynamic> availability;
  @override
  final String eplTeamLogo;
  @override
  final int score;
  @override
  final List<dynamic> upComingFixtures;

  @override
  String toString() {
    return 'UserPlayerDTO(playerId: $playerId, playerName: $playerName, currentPrice: $currentPrice, position: $position, eplTeamId: $eplTeamId, multiplier: $multiplier, isCaptain: $isCaptain, isViceCaptain: $isViceCaptain, availability: $availability, eplTeamLogo: $eplTeamLogo, score: $score, upComingFixtures: $upComingFixtures)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserPlayerDTO &&
            const DeepCollectionEquality().equals(other.playerId, playerId) &&
            const DeepCollectionEquality()
                .equals(other.playerName, playerName) &&
            const DeepCollectionEquality()
                .equals(other.currentPrice, currentPrice) &&
            const DeepCollectionEquality().equals(other.position, position) &&
            const DeepCollectionEquality().equals(other.eplTeamId, eplTeamId) &&
            const DeepCollectionEquality()
                .equals(other.multiplier, multiplier) &&
            const DeepCollectionEquality().equals(other.isCaptain, isCaptain) &&
            const DeepCollectionEquality()
                .equals(other.isViceCaptain, isViceCaptain) &&
            const DeepCollectionEquality()
                .equals(other.availability, availability) &&
            const DeepCollectionEquality()
                .equals(other.eplTeamLogo, eplTeamLogo) &&
            const DeepCollectionEquality().equals(other.score, score) &&
            const DeepCollectionEquality()
                .equals(other.upComingFixtures, upComingFixtures));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerId),
      const DeepCollectionEquality().hash(playerName),
      const DeepCollectionEquality().hash(currentPrice),
      const DeepCollectionEquality().hash(position),
      const DeepCollectionEquality().hash(eplTeamId),
      const DeepCollectionEquality().hash(multiplier),
      const DeepCollectionEquality().hash(isCaptain),
      const DeepCollectionEquality().hash(isViceCaptain),
      const DeepCollectionEquality().hash(availability),
      const DeepCollectionEquality().hash(eplTeamLogo),
      const DeepCollectionEquality().hash(score),
      const DeepCollectionEquality().hash(upComingFixtures));

  @JsonKey(ignore: true)
  @override
  _$UserPlayerDTOCopyWith<_UserPlayerDTO> get copyWith =>
      __$UserPlayerDTOCopyWithImpl<_UserPlayerDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserPlayerDTOToJson(this);
  }
}

abstract class _UserPlayerDTO extends UserPlayerDTO {
  const factory _UserPlayerDTO(
      {required String playerId,
      required String playerName,
      required double currentPrice,
      required String position,
      required String eplTeamId,
      required int multiplier,
      required bool isCaptain,
      required bool isViceCaptain,
      required Map<dynamic, dynamic> availability,
      required String eplTeamLogo,
      required int score,
      required List<dynamic> upComingFixtures}) = _$_UserPlayerDTO;
  const _UserPlayerDTO._() : super._();

  factory _UserPlayerDTO.fromJson(Map<String, dynamic> json) =
      _$_UserPlayerDTO.fromJson;

  @override
  String get playerId;
  @override
  String get playerName;
  @override
  double get currentPrice;
  @override
  String get position;
  @override
  String get eplTeamId;
  @override
  int get multiplier;
  @override
  bool get isCaptain;
  @override
  bool get isViceCaptain;
  @override
  Map<dynamic, dynamic> get availability;
  @override
  String get eplTeamLogo;
  @override
  int get score;
  @override
  List<dynamic> get upComingFixtures;
  @override
  @JsonKey(ignore: true)
  _$UserPlayerDTOCopyWith<_UserPlayerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
