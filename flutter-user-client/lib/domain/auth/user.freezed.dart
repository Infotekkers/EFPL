// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required EmailAddress emailAddress,
      required UserName userName,
      required TeamName teamName,
      required Country country,
      required FavoriteEplTeam favoriteEplTeam}) {
    return _User(
      emailAddress: emailAddress,
      userName: userName,
      teamName: teamName,
      country: country,
      favoriteEplTeam: favoriteEplTeam,
    );
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
// required UniqueId id,
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  UserName get userName => throw _privateConstructorUsedError;
  TeamName get teamName => throw _privateConstructorUsedError;
  Country get country => throw _privateConstructorUsedError;
  FavoriteEplTeam get favoriteEplTeam => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {EmailAddress emailAddress,
      UserName userName,
      TeamName teamName,
      Country country,
      FavoriteEplTeam favoriteEplTeam});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

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
              as EmailAddress,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as UserName,
      teamName: teamName == freezed
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as TeamName,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country,
      favoriteEplTeam: favoriteEplTeam == freezed
          ? _value.favoriteEplTeam
          : favoriteEplTeam // ignore: cast_nullable_to_non_nullable
              as FavoriteEplTeam,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {EmailAddress emailAddress,
      UserName userName,
      TeamName teamName,
      Country country,
      FavoriteEplTeam favoriteEplTeam});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? emailAddress = freezed,
    Object? userName = freezed,
    Object? teamName = freezed,
    Object? country = freezed,
    Object? favoriteEplTeam = freezed,
  }) {
    return _then(_User(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as UserName,
      teamName: teamName == freezed
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as TeamName,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country,
      favoriteEplTeam: favoriteEplTeam == freezed
          ? _value.favoriteEplTeam
          : favoriteEplTeam // ignore: cast_nullable_to_non_nullable
              as FavoriteEplTeam,
    ));
  }
}

/// @nodoc

class _$_User implements _User {
  const _$_User(
      {required this.emailAddress,
      required this.userName,
      required this.teamName,
      required this.country,
      required this.favoriteEplTeam});

  @override // required UniqueId id,
  final EmailAddress emailAddress;
  @override
  final UserName userName;
  @override
  final TeamName teamName;
  @override
  final Country country;
  @override
  final FavoriteEplTeam favoriteEplTeam;

  @override
  String toString() {
    return 'User(emailAddress: $emailAddress, userName: $userName, teamName: $teamName, country: $country, favoriteEplTeam: $favoriteEplTeam)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
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
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);
}

abstract class _User implements User {
  const factory _User(
      {required EmailAddress emailAddress,
      required UserName userName,
      required TeamName teamName,
      required Country country,
      required FavoriteEplTeam favoriteEplTeam}) = _$_User;

  @override // required UniqueId id,
  EmailAddress get emailAddress;
  @override
  UserName get userName;
  @override
  TeamName get teamName;
  @override
  Country get country;
  @override
  FavoriteEplTeam get favoriteEplTeam;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
