// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDetailDto _$UserDetailDtoFromJson(Map<String, dynamic> json) {
  return _UserDetailDto.fromJson(json);
}

/// @nodoc
class _$UserDetailDtoTearOff {
  const _$UserDetailDtoTearOff();

  _UserDetailDto call(
      {required String teamName,
      required String favouriteEplTeam,
      required String userName}) {
    return _UserDetailDto(
      teamName: teamName,
      favouriteEplTeam: favouriteEplTeam,
      userName: userName,
    );
  }

  UserDetailDto fromJson(Map<String, Object?> json) {
    return UserDetailDto.fromJson(json);
  }
}

/// @nodoc
const $UserDetailDto = _$UserDetailDtoTearOff();

/// @nodoc
mixin _$UserDetailDto {
  String get teamName => throw _privateConstructorUsedError;
  String get favouriteEplTeam => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDetailDtoCopyWith<UserDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailDtoCopyWith<$Res> {
  factory $UserDetailDtoCopyWith(
          UserDetailDto value, $Res Function(UserDetailDto) then) =
      _$UserDetailDtoCopyWithImpl<$Res>;
  $Res call({String teamName, String favouriteEplTeam, String userName});
}

/// @nodoc
class _$UserDetailDtoCopyWithImpl<$Res>
    implements $UserDetailDtoCopyWith<$Res> {
  _$UserDetailDtoCopyWithImpl(this._value, this._then);

  final UserDetailDto _value;
  // ignore: unused_field
  final $Res Function(UserDetailDto) _then;

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
abstract class _$UserDetailDtoCopyWith<$Res>
    implements $UserDetailDtoCopyWith<$Res> {
  factory _$UserDetailDtoCopyWith(
          _UserDetailDto value, $Res Function(_UserDetailDto) then) =
      __$UserDetailDtoCopyWithImpl<$Res>;
  @override
  $Res call({String teamName, String favouriteEplTeam, String userName});
}

/// @nodoc
class __$UserDetailDtoCopyWithImpl<$Res>
    extends _$UserDetailDtoCopyWithImpl<$Res>
    implements _$UserDetailDtoCopyWith<$Res> {
  __$UserDetailDtoCopyWithImpl(
      _UserDetailDto _value, $Res Function(_UserDetailDto) _then)
      : super(_value, (v) => _then(v as _UserDetailDto));

  @override
  _UserDetailDto get _value => super._value as _UserDetailDto;

  @override
  $Res call({
    Object? teamName = freezed,
    Object? favouriteEplTeam = freezed,
    Object? userName = freezed,
  }) {
    return _then(_UserDetailDto(
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
class _$_UserDetailDto extends _UserDetailDto {
  const _$_UserDetailDto(
      {required this.teamName,
      required this.favouriteEplTeam,
      required this.userName})
      : super._();

  factory _$_UserDetailDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserDetailDtoFromJson(json);

  @override
  final String teamName;
  @override
  final String favouriteEplTeam;
  @override
  final String userName;

  @override
  String toString() {
    return 'UserDetailDto(teamName: $teamName, favouriteEplTeam: $favouriteEplTeam, userName: $userName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDetailDto &&
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
  _$UserDetailDtoCopyWith<_UserDetailDto> get copyWith =>
      __$UserDetailDtoCopyWithImpl<_UserDetailDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDetailDtoToJson(this);
  }
}

abstract class _UserDetailDto extends UserDetailDto {
  const factory _UserDetailDto(
      {required String teamName,
      required String favouriteEplTeam,
      required String userName}) = _$_UserDetailDto;
  const _UserDetailDto._() : super._();

  factory _UserDetailDto.fromJson(Map<String, dynamic> json) =
      _$_UserDetailDto.fromJson;

  @override
  String get teamName;
  @override
  String get favouriteEplTeam;
  @override
  String get userName;
  @override
  @JsonKey(ignore: true)
  _$UserDetailDtoCopyWith<_UserDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}
