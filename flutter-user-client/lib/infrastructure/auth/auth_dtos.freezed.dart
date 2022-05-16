// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserDtoTearOff {
  const _$UserDtoTearOff();

  _UserDto call(
      {required String emailAddress,
      required String userName,
      required String teamName,
      required String country,
      required String favoriteEplTeam}) {
    return _UserDto(
      emailAddress: emailAddress,
      userName: userName,
      teamName: teamName,
      country: country,
      favoriteEplTeam: favoriteEplTeam,
    );
  }
}

/// @nodoc
const $UserDto = _$UserDtoTearOff();

/// @nodoc
mixin _$UserDto {
  String get emailAddress => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get teamName => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get favoriteEplTeam => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res>;
  $Res call(
      {String emailAddress,
      String userName,
      String teamName,
      String country,
      String favoriteEplTeam});
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res> implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  final UserDto _value;
  // ignore: unused_field
  final $Res Function(UserDto) _then;

  @override
  $Res call({
    Object? emailAddress = freezed,
    Object? userName = freezed,
    Object? teamName = freezed,
    Object? country = freezed,
    Object? favoriteEplTeam = freezed,
  }) {
    return _then(_value.copyWith(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      teamName: teamName == freezed
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteEplTeam: favoriteEplTeam == freezed
          ? _value.favoriteEplTeam
          : favoriteEplTeam // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserDtoCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$UserDtoCopyWith(_UserDto value, $Res Function(_UserDto) then) =
      __$UserDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String emailAddress,
      String userName,
      String teamName,
      String country,
      String favoriteEplTeam});
}

/// @nodoc
class __$UserDtoCopyWithImpl<$Res> extends _$UserDtoCopyWithImpl<$Res>
    implements _$UserDtoCopyWith<$Res> {
  __$UserDtoCopyWithImpl(_UserDto _value, $Res Function(_UserDto) _then)
      : super(_value, (v) => _then(v as _UserDto));

  @override
  _UserDto get _value => super._value as _UserDto;

  @override
  $Res call({
    Object? emailAddress = freezed,
    Object? userName = freezed,
    Object? teamName = freezed,
    Object? country = freezed,
    Object? favoriteEplTeam = freezed,
  }) {
    return _then(_UserDto(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      teamName: teamName == freezed
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteEplTeam: favoriteEplTeam == freezed
          ? _value.favoriteEplTeam
          : favoriteEplTeam // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UserDto extends _UserDto {
  const _$_UserDto(
      {required this.emailAddress,
      required this.userName,
      required this.teamName,
      required this.country,
      required this.favoriteEplTeam})
      : super._();

  @override
  final String emailAddress;
  @override
  final String userName;
  @override
  final String teamName;
  @override
  final String country;
  @override
  final String favoriteEplTeam;

  @override
  String toString() {
    return 'UserDto(emailAddress: $emailAddress, userName: $userName, teamName: $teamName, country: $country, favoriteEplTeam: $favoriteEplTeam)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDto &&
            const DeepCollectionEquality()
                .equals(other.emailAddress, emailAddress) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.teamName, teamName) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality()
                .equals(other.favoriteEplTeam, favoriteEplTeam));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(emailAddress),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(teamName),
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(favoriteEplTeam));

  @JsonKey(ignore: true)
  @override
  _$UserDtoCopyWith<_UserDto> get copyWith =>
      __$UserDtoCopyWithImpl<_UserDto>(this, _$identity);
}

abstract class _UserDto extends UserDto {
  const factory _UserDto(
      {required String emailAddress,
      required String userName,
      required String teamName,
      required String country,
      required String favoriteEplTeam}) = _$_UserDto;
  const _UserDto._() : super._();

  @override
  String get emailAddress;
  @override
  String get userName;
  @override
  String get teamName;
  @override
  String get country;
  @override
  String get favoriteEplTeam;
  @override
  @JsonKey(ignore: true)
  _$UserDtoCopyWith<_UserDto> get copyWith =>
      throw _privateConstructorUsedError;
}
