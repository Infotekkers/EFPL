// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'player_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlayerDto _$PlayerDtoFromJson(Map<String, dynamic> json) {
  return _PlayerDto.fromJson(json);
}

/// @nodoc
class _$PlayerDtoTearOff {
  const _$PlayerDtoTearOff();

  _PlayerDto call(
      {required String playerName,
      required int playerId,
      required String eplTeamId,
      required String position,
      required double currentPrice,
      String teamLogoUrl = "",
      Map<String, String> availability = const {
        "injuryStatus": "100",
        "injuryMessage": "fit to play"
      },
      List<dynamic> score = const [],
      List<dynamic> history = const []}) {
    return _PlayerDto(
      playerName: playerName,
      playerId: playerId,
      eplTeamId: eplTeamId,
      position: position,
      currentPrice: currentPrice,
      teamLogoUrl: teamLogoUrl,
      availability: availability,
      score: score,
      history: history,
    );
  }

  PlayerDto fromJson(Map<String, Object?> json) {
    return PlayerDto.fromJson(json);
  }
}

/// @nodoc
const $PlayerDto = _$PlayerDtoTearOff();

/// @nodoc
mixin _$PlayerDto {
  String get playerName => throw _privateConstructorUsedError;
  int get playerId => throw _privateConstructorUsedError;
  String get eplTeamId => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  double get currentPrice => throw _privateConstructorUsedError;
  String get teamLogoUrl => throw _privateConstructorUsedError;
  Map<String, String> get availability => throw _privateConstructorUsedError;
  List<dynamic> get score => throw _privateConstructorUsedError;
  List<dynamic> get history => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerDtoCopyWith<PlayerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerDtoCopyWith<$Res> {
  factory $PlayerDtoCopyWith(PlayerDto value, $Res Function(PlayerDto) then) =
      _$PlayerDtoCopyWithImpl<$Res>;
  $Res call(
      {String playerName,
      int playerId,
      String eplTeamId,
      String position,
      double currentPrice,
      String teamLogoUrl,
      Map<String, String> availability,
      List<dynamic> score,
      List<dynamic> history});
}

/// @nodoc
class _$PlayerDtoCopyWithImpl<$Res> implements $PlayerDtoCopyWith<$Res> {
  _$PlayerDtoCopyWithImpl(this._value, this._then);

  final PlayerDto _value;
  // ignore: unused_field
  final $Res Function(PlayerDto) _then;

  @override
  $Res call({
    Object? playerName = freezed,
    Object? playerId = freezed,
    Object? eplTeamId = freezed,
    Object? position = freezed,
    Object? currentPrice = freezed,
    Object? teamLogoUrl = freezed,
    Object? availability = freezed,
    Object? score = freezed,
    Object? history = freezed,
  }) {
    return _then(_value.copyWith(
      playerName: playerName == freezed
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      playerId: playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as int,
      eplTeamId: eplTeamId == freezed
          ? _value.eplTeamId
          : eplTeamId // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      currentPrice: currentPrice == freezed
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as double,
      teamLogoUrl: teamLogoUrl == freezed
          ? _value.teamLogoUrl
          : teamLogoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      availability: availability == freezed
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      history: history == freezed
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$PlayerDtoCopyWith<$Res> implements $PlayerDtoCopyWith<$Res> {
  factory _$PlayerDtoCopyWith(
          _PlayerDto value, $Res Function(_PlayerDto) then) =
      __$PlayerDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String playerName,
      int playerId,
      String eplTeamId,
      String position,
      double currentPrice,
      String teamLogoUrl,
      Map<String, String> availability,
      List<dynamic> score,
      List<dynamic> history});
}

/// @nodoc
class __$PlayerDtoCopyWithImpl<$Res> extends _$PlayerDtoCopyWithImpl<$Res>
    implements _$PlayerDtoCopyWith<$Res> {
  __$PlayerDtoCopyWithImpl(_PlayerDto _value, $Res Function(_PlayerDto) _then)
      : super(_value, (v) => _then(v as _PlayerDto));

  @override
  _PlayerDto get _value => super._value as _PlayerDto;

  @override
  $Res call({
    Object? playerName = freezed,
    Object? playerId = freezed,
    Object? eplTeamId = freezed,
    Object? position = freezed,
    Object? currentPrice = freezed,
    Object? teamLogoUrl = freezed,
    Object? availability = freezed,
    Object? score = freezed,
    Object? history = freezed,
  }) {
    return _then(_PlayerDto(
      playerName: playerName == freezed
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      playerId: playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as int,
      eplTeamId: eplTeamId == freezed
          ? _value.eplTeamId
          : eplTeamId // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      currentPrice: currentPrice == freezed
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as double,
      teamLogoUrl: teamLogoUrl == freezed
          ? _value.teamLogoUrl
          : teamLogoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      availability: availability == freezed
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      history: history == freezed
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlayerDto extends _PlayerDto {
  const _$_PlayerDto(
      {required this.playerName,
      required this.playerId,
      required this.eplTeamId,
      required this.position,
      required this.currentPrice,
      this.teamLogoUrl = "",
      this.availability = const {
        "injuryStatus": "100",
        "injuryMessage": "fit to play"
      },
      this.score = const [],
      this.history = const []})
      : super._();

  factory _$_PlayerDto.fromJson(Map<String, dynamic> json) =>
      _$$_PlayerDtoFromJson(json);

  @override
  final String playerName;
  @override
  final int playerId;
  @override
  final String eplTeamId;
  @override
  final String position;
  @override
  final double currentPrice;
  @JsonKey()
  @override
  final String teamLogoUrl;
  @JsonKey()
  @override
  final Map<String, String> availability;
  @JsonKey()
  @override
  final List<dynamic> score;
  @JsonKey()
  @override
  final List<dynamic> history;

  @override
  String toString() {
    return 'PlayerDto(playerName: $playerName, playerId: $playerId, eplTeamId: $eplTeamId, position: $position, currentPrice: $currentPrice, teamLogoUrl: $teamLogoUrl, availability: $availability, score: $score, history: $history)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlayerDto &&
            const DeepCollectionEquality()
                .equals(other.playerName, playerName) &&
            const DeepCollectionEquality().equals(other.playerId, playerId) &&
            const DeepCollectionEquality().equals(other.eplTeamId, eplTeamId) &&
            const DeepCollectionEquality().equals(other.position, position) &&
            const DeepCollectionEquality()
                .equals(other.currentPrice, currentPrice) &&
            const DeepCollectionEquality()
                .equals(other.teamLogoUrl, teamLogoUrl) &&
            const DeepCollectionEquality()
                .equals(other.availability, availability) &&
            const DeepCollectionEquality().equals(other.score, score) &&
            const DeepCollectionEquality().equals(other.history, history));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerName),
      const DeepCollectionEquality().hash(playerId),
      const DeepCollectionEquality().hash(eplTeamId),
      const DeepCollectionEquality().hash(position),
      const DeepCollectionEquality().hash(currentPrice),
      const DeepCollectionEquality().hash(teamLogoUrl),
      const DeepCollectionEquality().hash(availability),
      const DeepCollectionEquality().hash(score),
      const DeepCollectionEquality().hash(history));

  @JsonKey(ignore: true)
  @override
  _$PlayerDtoCopyWith<_PlayerDto> get copyWith =>
      __$PlayerDtoCopyWithImpl<_PlayerDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlayerDtoToJson(this);
  }
}

abstract class _PlayerDto extends PlayerDto {
  const factory _PlayerDto(
      {required String playerName,
      required int playerId,
      required String eplTeamId,
      required String position,
      required double currentPrice,
      String teamLogoUrl,
      Map<String, String> availability,
      List<dynamic> score,
      List<dynamic> history}) = _$_PlayerDto;
  const _PlayerDto._() : super._();

  factory _PlayerDto.fromJson(Map<String, dynamic> json) =
      _$_PlayerDto.fromJson;

  @override
  String get playerName;
  @override
  int get playerId;
  @override
  String get eplTeamId;
  @override
  String get position;
  @override
  double get currentPrice;
  @override
  String get teamLogoUrl;
  @override
  Map<String, String> get availability;
  @override
  List<dynamic> get score;
  @override
  List<dynamic> get history;
  @override
  @JsonKey(ignore: true)
  _$PlayerDtoCopyWith<_PlayerDto> get copyWith =>
      throw _privateConstructorUsedError;
}
