// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingsDto _$SettingsDtoFromJson(Map<String, dynamic> json) {
  return _SettingsDto.fromJson(json);
}

/// @nodoc
class _$SettingsDtoTearOff {
  const _$SettingsDtoTearOff();

  _SettingsDto call(
      {required String teamName,
      required String favouriteEplTeam,
      required String userName}) {
    return _SettingsDto(
      teamName: teamName,
      favouriteEplTeam: favouriteEplTeam,
      userName: userName,
    );
  }

  SettingsDto fromJson(Map<String, Object?> json) {
    return SettingsDto.fromJson(json);
  }
}

/// @nodoc
const $SettingsDto = _$SettingsDtoTearOff();

/// @nodoc
mixin _$SettingsDto {
  String get teamName => throw _privateConstructorUsedError;
  String get favouriteEplTeam => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsDtoCopyWith<SettingsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsDtoCopyWith<$Res> {
  factory $SettingsDtoCopyWith(
          SettingsDto value, $Res Function(SettingsDto) then) =
      _$SettingsDtoCopyWithImpl<$Res>;
  $Res call({String teamName, String favouriteEplTeam, String userName});
}

/// @nodoc
class _$SettingsDtoCopyWithImpl<$Res> implements $SettingsDtoCopyWith<$Res> {
  _$SettingsDtoCopyWithImpl(this._value, this._then);

  final SettingsDto _value;
  // ignore: unused_field
  final $Res Function(SettingsDto) _then;

  @override
  $Res call({
    Object? teamName = freezed,
    Object? favouriteEplTeam = freezed,
    Object? userName = freezed,
  }) {
    return _then(_value.copyWith(
      teamName: teamName == freezed
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String,
      favouriteEplTeam: favouriteEplTeam == freezed
          ? _value.favouriteEplTeam
          : favouriteEplTeam // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SettingsDtoCopyWith<$Res>
    implements $SettingsDtoCopyWith<$Res> {
  factory _$SettingsDtoCopyWith(
          _SettingsDto value, $Res Function(_SettingsDto) then) =
      __$SettingsDtoCopyWithImpl<$Res>;
  @override
  $Res call({String teamName, String favouriteEplTeam, String userName});
}

/// @nodoc
class __$SettingsDtoCopyWithImpl<$Res> extends _$SettingsDtoCopyWithImpl<$Res>
    implements _$SettingsDtoCopyWith<$Res> {
  __$SettingsDtoCopyWithImpl(
      _SettingsDto _value, $Res Function(_SettingsDto) _then)
      : super(_value, (v) => _then(v as _SettingsDto));

  @override
  _SettingsDto get _value => super._value as _SettingsDto;

  @override
  $Res call({
    Object? teamName = freezed,
    Object? favouriteEplTeam = freezed,
    Object? userName = freezed,
  }) {
    return _then(_SettingsDto(
      teamName: teamName == freezed
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String,
      favouriteEplTeam: favouriteEplTeam == freezed
          ? _value.favouriteEplTeam
          : favouriteEplTeam // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SettingsDto extends _SettingsDto {
  const _$_SettingsDto(
      {required this.teamName,
      required this.favouriteEplTeam,
      required this.userName})
      : super._();

  factory _$_SettingsDto.fromJson(Map<String, dynamic> json) =>
      _$$_SettingsDtoFromJson(json);

  @override
  final String teamName;
  @override
  final String favouriteEplTeam;
  @override
  final String userName;

  @override
  String toString() {
    return 'SettingsDto(teamName: $teamName, favouriteEplTeam: $favouriteEplTeam, userName: $userName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SettingsDto &&
            const DeepCollectionEquality().equals(other.teamName, teamName) &&
            const DeepCollectionEquality()
                .equals(other.favouriteEplTeam, favouriteEplTeam) &&
            const DeepCollectionEquality().equals(other.userName, userName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(teamName),
      const DeepCollectionEquality().hash(favouriteEplTeam),
      const DeepCollectionEquality().hash(userName));

  @JsonKey(ignore: true)
  @override
  _$SettingsDtoCopyWith<_SettingsDto> get copyWith =>
      __$SettingsDtoCopyWithImpl<_SettingsDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingsDtoToJson(this);
  }
}

abstract class _SettingsDto extends SettingsDto {
  const factory _SettingsDto(
      {required String teamName,
      required String favouriteEplTeam,
      required String userName}) = _$_SettingsDto;
  const _SettingsDto._() : super._();

  factory _SettingsDto.fromJson(Map<String, dynamic> json) =
      _$_SettingsDto.fromJson;

  @override
  String get teamName;
  @override
  String get favouriteEplTeam;
  @override
  String get userName;
  @override
  @JsonKey(ignore: true)
  _$SettingsDtoCopyWith<_SettingsDto> get copyWith =>
      throw _privateConstructorUsedError;
}
