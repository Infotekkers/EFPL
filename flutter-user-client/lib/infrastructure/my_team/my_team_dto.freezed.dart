// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_team_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyTeamDto _$MyTeamDtoFromJson(Map<String, dynamic> json) {
  return _MyTeamDto.fromJson(json);
}

/// @nodoc
class _$MyTeamDtoTearOff {
  const _$MyTeamDtoTearOff();

  _MyTeamDto call(
      {required String teamName,
      required String activeGameweek,
      required List<String> availableChips,
      required String activeChip,
      required Map<String, dynamic> players}) {
    return _MyTeamDto(
      teamName: teamName,
      activeGameweek: activeGameweek,
      availableChips: availableChips,
      activeChip: activeChip,
      players: players,
    );
  }

  MyTeamDto fromJson(Map<String, Object?> json) {
    return MyTeamDto.fromJson(json);
  }
}

/// @nodoc
const $MyTeamDto = _$MyTeamDtoTearOff();

/// @nodoc
mixin _$MyTeamDto {
  String get teamName => throw _privateConstructorUsedError;
  String get activeGameweek => throw _privateConstructorUsedError;
  List<String> get availableChips => throw _privateConstructorUsedError;
  String get activeChip => throw _privateConstructorUsedError;
  Map<String, dynamic> get players => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyTeamDtoCopyWith<MyTeamDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyTeamDtoCopyWith<$Res> {
  factory $MyTeamDtoCopyWith(MyTeamDto value, $Res Function(MyTeamDto) then) =
      _$MyTeamDtoCopyWithImpl<$Res>;
  $Res call(
      {String teamName,
      String activeGameweek,
      List<String> availableChips,
      String activeChip,
      Map<String, dynamic> players});
}

/// @nodoc
class _$MyTeamDtoCopyWithImpl<$Res> implements $MyTeamDtoCopyWith<$Res> {
  _$MyTeamDtoCopyWithImpl(this._value, this._then);

  final MyTeamDto _value;
  // ignore: unused_field
  final $Res Function(MyTeamDto) _then;

  @override
  $Res call({
    Object? teamName = freezed,
    Object? activeGameweek = freezed,
    Object? availableChips = freezed,
    Object? activeChip = freezed,
    Object? players = freezed,
  }) {
    return _then(_value.copyWith(
      teamName: teamName == freezed
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String,
      activeGameweek: activeGameweek == freezed
          ? _value.activeGameweek
          : activeGameweek // ignore: cast_nullable_to_non_nullable
              as String,
      availableChips: availableChips == freezed
          ? _value.availableChips
          : availableChips // ignore: cast_nullable_to_non_nullable
              as List<String>,
      activeChip: activeChip == freezed
          ? _value.activeChip
          : activeChip // ignore: cast_nullable_to_non_nullable
              as String,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$MyTeamDtoCopyWith<$Res> implements $MyTeamDtoCopyWith<$Res> {
  factory _$MyTeamDtoCopyWith(
          _MyTeamDto value, $Res Function(_MyTeamDto) then) =
      __$MyTeamDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String teamName,
      String activeGameweek,
      List<String> availableChips,
      String activeChip,
      Map<String, dynamic> players});
}

/// @nodoc
class __$MyTeamDtoCopyWithImpl<$Res> extends _$MyTeamDtoCopyWithImpl<$Res>
    implements _$MyTeamDtoCopyWith<$Res> {
  __$MyTeamDtoCopyWithImpl(_MyTeamDto _value, $Res Function(_MyTeamDto) _then)
      : super(_value, (v) => _then(v as _MyTeamDto));

  @override
  _MyTeamDto get _value => super._value as _MyTeamDto;

  @override
  $Res call({
    Object? teamName = freezed,
    Object? activeGameweek = freezed,
    Object? availableChips = freezed,
    Object? activeChip = freezed,
    Object? players = freezed,
  }) {
    return _then(_MyTeamDto(
      teamName: teamName == freezed
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String,
      activeGameweek: activeGameweek == freezed
          ? _value.activeGameweek
          : activeGameweek // ignore: cast_nullable_to_non_nullable
              as String,
      availableChips: availableChips == freezed
          ? _value.availableChips
          : availableChips // ignore: cast_nullable_to_non_nullable
              as List<String>,
      activeChip: activeChip == freezed
          ? _value.activeChip
          : activeChip // ignore: cast_nullable_to_non_nullable
              as String,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyTeamDto extends _MyTeamDto {
  const _$_MyTeamDto(
      {required this.teamName,
      required this.activeGameweek,
      required this.availableChips,
      required this.activeChip,
      required this.players})
      : super._();

  factory _$_MyTeamDto.fromJson(Map<String, dynamic> json) =>
      _$$_MyTeamDtoFromJson(json);

  @override
  final String teamName;
  @override
  final String activeGameweek;
  @override
  final List<String> availableChips;
  @override
  final String activeChip;
  @override
  final Map<String, dynamic> players;

  @override
  String toString() {
    return 'MyTeamDto(teamName: $teamName, activeGameweek: $activeGameweek, availableChips: $availableChips, activeChip: $activeChip, players: $players)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MyTeamDto &&
            const DeepCollectionEquality().equals(other.teamName, teamName) &&
            const DeepCollectionEquality()
                .equals(other.activeGameweek, activeGameweek) &&
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
      const DeepCollectionEquality().hash(activeGameweek),
      const DeepCollectionEquality().hash(availableChips),
      const DeepCollectionEquality().hash(activeChip),
      const DeepCollectionEquality().hash(players));

  @JsonKey(ignore: true)
  @override
  _$MyTeamDtoCopyWith<_MyTeamDto> get copyWith =>
      __$MyTeamDtoCopyWithImpl<_MyTeamDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyTeamDtoToJson(this);
  }
}

abstract class _MyTeamDto extends MyTeamDto {
  const factory _MyTeamDto(
      {required String teamName,
      required String activeGameweek,
      required List<String> availableChips,
      required String activeChip,
      required Map<String, dynamic> players}) = _$_MyTeamDto;
  const _MyTeamDto._() : super._();

  factory _MyTeamDto.fromJson(Map<String, dynamic> json) =
      _$_MyTeamDto.fromJson;

  @override
  String get teamName;
  @override
  String get activeGameweek;
  @override
  List<String> get availableChips;
  @override
  String get activeChip;
  @override
  Map<String, dynamic> get players;
  @override
  @JsonKey(ignore: true)
  _$MyTeamDtoCopyWith<_MyTeamDto> get copyWith =>
      throw _privateConstructorUsedError;
}
