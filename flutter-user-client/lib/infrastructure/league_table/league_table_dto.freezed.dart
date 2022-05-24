// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'league_table_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LeagueTableDto _$LeagueTableDtoFromJson(Map<String, dynamic> json) {
  return _LeagueTableDto.fromJson(json);
}

/// @nodoc
class _$LeagueTableDtoTearOff {
  const _$LeagueTableDtoTearOff();

  _LeagueTableDto call(
      {required String teamName,
      required String teamLogo,
      required List<dynamic> teamPosition}) {
    return _LeagueTableDto(
      teamName: teamName,
      teamLogo: teamLogo,
      teamPosition: teamPosition,
    );
  }

  LeagueTableDto fromJson(Map<String, Object?> json) {
    return LeagueTableDto.fromJson(json);
  }
}

/// @nodoc
const $LeagueTableDto = _$LeagueTableDtoTearOff();

/// @nodoc
mixin _$LeagueTableDto {
  String get teamName => throw _privateConstructorUsedError;
  String get teamLogo => throw _privateConstructorUsedError;
  List<dynamic> get teamPosition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeagueTableDtoCopyWith<LeagueTableDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeagueTableDtoCopyWith<$Res> {
  factory $LeagueTableDtoCopyWith(
          LeagueTableDto value, $Res Function(LeagueTableDto) then) =
      _$LeagueTableDtoCopyWithImpl<$Res>;
  $Res call({String teamName, String teamLogo, List<dynamic> teamPosition});
}

/// @nodoc
class _$LeagueTableDtoCopyWithImpl<$Res>
    implements $LeagueTableDtoCopyWith<$Res> {
  _$LeagueTableDtoCopyWithImpl(this._value, this._then);

  final LeagueTableDto _value;
  // ignore: unused_field
  final $Res Function(LeagueTableDto) _then;

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
              as String,
      teamLogo: teamLogo == freezed
          ? _value.teamLogo
          : teamLogo // ignore: cast_nullable_to_non_nullable
              as String,
      teamPosition: teamPosition == freezed
          ? _value.teamPosition
          : teamPosition // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$LeagueTableDtoCopyWith<$Res>
    implements $LeagueTableDtoCopyWith<$Res> {
  factory _$LeagueTableDtoCopyWith(
          _LeagueTableDto value, $Res Function(_LeagueTableDto) then) =
      __$LeagueTableDtoCopyWithImpl<$Res>;
  @override
  $Res call({String teamName, String teamLogo, List<dynamic> teamPosition});
}

/// @nodoc
class __$LeagueTableDtoCopyWithImpl<$Res>
    extends _$LeagueTableDtoCopyWithImpl<$Res>
    implements _$LeagueTableDtoCopyWith<$Res> {
  __$LeagueTableDtoCopyWithImpl(
      _LeagueTableDto _value, $Res Function(_LeagueTableDto) _then)
      : super(_value, (v) => _then(v as _LeagueTableDto));

  @override
  _LeagueTableDto get _value => super._value as _LeagueTableDto;

  @override
  $Res call({
    Object? teamName = freezed,
    Object? teamLogo = freezed,
    Object? teamPosition = freezed,
  }) {
    return _then(_LeagueTableDto(
      teamName: teamName == freezed
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String,
      teamLogo: teamLogo == freezed
          ? _value.teamLogo
          : teamLogo // ignore: cast_nullable_to_non_nullable
              as String,
      teamPosition: teamPosition == freezed
          ? _value.teamPosition
          : teamPosition // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LeagueTableDto extends _LeagueTableDto {
  const _$_LeagueTableDto(
      {required this.teamName,
      required this.teamLogo,
      required this.teamPosition})
      : super._();

  factory _$_LeagueTableDto.fromJson(Map<String, dynamic> json) =>
      _$$_LeagueTableDtoFromJson(json);

  @override
  final String teamName;
  @override
  final String teamLogo;
  @override
  final List<dynamic> teamPosition;

  @override
  String toString() {
    return 'LeagueTableDto(teamName: $teamName, teamLogo: $teamLogo, teamPosition: $teamPosition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LeagueTableDto &&
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
  _$LeagueTableDtoCopyWith<_LeagueTableDto> get copyWith =>
      __$LeagueTableDtoCopyWithImpl<_LeagueTableDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LeagueTableDtoToJson(this);
  }
}

abstract class _LeagueTableDto extends LeagueTableDto {
  const factory _LeagueTableDto(
      {required String teamName,
      required String teamLogo,
      required List<dynamic> teamPosition}) = _$_LeagueTableDto;
  const _LeagueTableDto._() : super._();

  factory _LeagueTableDto.fromJson(Map<String, dynamic> json) =
      _$_LeagueTableDto.fromJson;

  @override
  String get teamName;
  @override
  String get teamLogo;
  @override
  List<dynamic> get teamPosition;
  @override
  @JsonKey(ignore: true)
  _$LeagueTableDtoCopyWith<_LeagueTableDto> get copyWith =>
      throw _privateConstructorUsedError;
}
