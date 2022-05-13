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
      {required String name,
      required String playerId,
      required String eplTeamId,
      required String position,
      required String multiplier,
      required bool isCaptain,
      required bool isViceCaptain}) {
    return _PlayerDto(
      name: name,
      playerId: playerId,
      eplTeamId: eplTeamId,
      position: position,
      multiplier: multiplier,
      isCaptain: isCaptain,
      isViceCaptain: isViceCaptain,
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
  String get name => throw _privateConstructorUsedError;
  String get playerId => throw _privateConstructorUsedError;
  String get eplTeamId => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  String get multiplier => throw _privateConstructorUsedError;
  bool get isCaptain => throw _privateConstructorUsedError;
  bool get isViceCaptain => throw _privateConstructorUsedError;

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
      {String name,
      String playerId,
      String eplTeamId,
      String position,
      String multiplier,
      bool isCaptain,
      bool isViceCaptain});
}

/// @nodoc
class _$PlayerDtoCopyWithImpl<$Res> implements $PlayerDtoCopyWith<$Res> {
  _$PlayerDtoCopyWithImpl(this._value, this._then);

  final PlayerDto _value;
  // ignore: unused_field
  final $Res Function(PlayerDto) _then;

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
              as String,
      playerId: playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      eplTeamId: eplTeamId == freezed
          ? _value.eplTeamId
          : eplTeamId // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      multiplier: multiplier == freezed
          ? _value.multiplier
          : multiplier // ignore: cast_nullable_to_non_nullable
              as String,
      isCaptain: isCaptain == freezed
          ? _value.isCaptain
          : isCaptain // ignore: cast_nullable_to_non_nullable
              as bool,
      isViceCaptain: isViceCaptain == freezed
          ? _value.isViceCaptain
          : isViceCaptain // ignore: cast_nullable_to_non_nullable
              as bool,
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
      {String name,
      String playerId,
      String eplTeamId,
      String position,
      String multiplier,
      bool isCaptain,
      bool isViceCaptain});
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
    Object? name = freezed,
    Object? playerId = freezed,
    Object? eplTeamId = freezed,
    Object? position = freezed,
    Object? multiplier = freezed,
    Object? isCaptain = freezed,
    Object? isViceCaptain = freezed,
  }) {
    return _then(_PlayerDto(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      playerId: playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      eplTeamId: eplTeamId == freezed
          ? _value.eplTeamId
          : eplTeamId // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      multiplier: multiplier == freezed
          ? _value.multiplier
          : multiplier // ignore: cast_nullable_to_non_nullable
              as String,
      isCaptain: isCaptain == freezed
          ? _value.isCaptain
          : isCaptain // ignore: cast_nullable_to_non_nullable
              as bool,
      isViceCaptain: isViceCaptain == freezed
          ? _value.isViceCaptain
          : isViceCaptain // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlayerDto extends _PlayerDto {
  const _$_PlayerDto(
      {required this.name,
      required this.playerId,
      required this.eplTeamId,
      required this.position,
      required this.multiplier,
      required this.isCaptain,
      required this.isViceCaptain})
      : super._();

  factory _$_PlayerDto.fromJson(Map<String, dynamic> json) =>
      _$$_PlayerDtoFromJson(json);

  @override
  final String name;
  @override
  final String playerId;
  @override
  final String eplTeamId;
  @override
  final String position;
  @override
  final String multiplier;
  @override
  final bool isCaptain;
  @override
  final bool isViceCaptain;

  @override
  String toString() {
    return 'PlayerDto(name: $name, playerId: $playerId, eplTeamId: $eplTeamId, position: $position, multiplier: $multiplier, isCaptain: $isCaptain, isViceCaptain: $isViceCaptain)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlayerDto &&
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
  _$PlayerDtoCopyWith<_PlayerDto> get copyWith =>
      __$PlayerDtoCopyWithImpl<_PlayerDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlayerDtoToJson(this);
  }
}

abstract class _PlayerDto extends PlayerDto {
  const factory _PlayerDto(
      {required String name,
      required String playerId,
      required String eplTeamId,
      required String position,
      required String multiplier,
      required bool isCaptain,
      required bool isViceCaptain}) = _$_PlayerDto;
  const _PlayerDto._() : super._();

  factory _PlayerDto.fromJson(Map<String, dynamic> json) =
      _$_PlayerDto.fromJson;

  @override
  String get name;
  @override
  String get playerId;
  @override
  String get eplTeamId;
  @override
  String get position;
  @override
  String get multiplier;
  @override
  bool get isCaptain;
  @override
  bool get isViceCaptain;
  @override
  @JsonKey(ignore: true)
  _$PlayerDtoCopyWith<_PlayerDto> get copyWith =>
      throw _privateConstructorUsedError;
}
