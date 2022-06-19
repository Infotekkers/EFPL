// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SettingsTearOff {
  const _$SettingsTearOff();

  _Settings call(
      {required UserName userName,
      required TeamName teamName,
      required FavouriteEplTeam favouriteEplTeam}) {
    return _Settings(
      userName: userName,
      teamName: teamName,
      favouriteEplTeam: favouriteEplTeam,
    );
  }
}

/// @nodoc
const $Settings = _$SettingsTearOff();

/// @nodoc
mixin _$Settings {
  UserName get userName => throw _privateConstructorUsedError;
  TeamName get teamName => throw _privateConstructorUsedError;
  FavouriteEplTeam get favouriteEplTeam => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsCopyWith<Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) then) =
      _$SettingsCopyWithImpl<$Res>;
  $Res call(
      {UserName userName,
      TeamName teamName,
      FavouriteEplTeam favouriteEplTeam});
}

/// @nodoc
class _$SettingsCopyWithImpl<$Res> implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._value, this._then);

  final Settings _value;
  // ignore: unused_field
  final $Res Function(Settings) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? teamName = freezed,
    Object? favouriteEplTeam = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as UserName,
      teamName: teamName == freezed
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as TeamName,
      favouriteEplTeam: favouriteEplTeam == freezed
          ? _value.favouriteEplTeam
          : favouriteEplTeam // ignore: cast_nullable_to_non_nullable
              as FavouriteEplTeam,
    ));
  }
}

/// @nodoc
abstract class _$SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$SettingsCopyWith(_Settings value, $Res Function(_Settings) then) =
      __$SettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserName userName,
      TeamName teamName,
      FavouriteEplTeam favouriteEplTeam});
}

/// @nodoc
class __$SettingsCopyWithImpl<$Res> extends _$SettingsCopyWithImpl<$Res>
    implements _$SettingsCopyWith<$Res> {
  __$SettingsCopyWithImpl(_Settings _value, $Res Function(_Settings) _then)
      : super(_value, (v) => _then(v as _Settings));

  @override
  _Settings get _value => super._value as _Settings;

  @override
  $Res call({
    Object? userName = freezed,
    Object? teamName = freezed,
    Object? favouriteEplTeam = freezed,
  }) {
    return _then(_Settings(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as UserName,
      teamName: teamName == freezed
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as TeamName,
      favouriteEplTeam: favouriteEplTeam == freezed
          ? _value.favouriteEplTeam
          : favouriteEplTeam // ignore: cast_nullable_to_non_nullable
              as FavouriteEplTeam,
    ));
  }
}

/// @nodoc

class _$_Settings implements _Settings {
  const _$_Settings(
      {required this.userName,
      required this.teamName,
      required this.favouriteEplTeam});

  @override
  final UserName userName;
  @override
  final TeamName teamName;
  @override
  final FavouriteEplTeam favouriteEplTeam;

  @override
  String toString() {
    return 'Settings(userName: $userName, teamName: $teamName, favouriteEplTeam: $favouriteEplTeam)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Settings &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.teamName, teamName) &&
            const DeepCollectionEquality()
                .equals(other.favouriteEplTeam, favouriteEplTeam));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(teamName),
      const DeepCollectionEquality().hash(favouriteEplTeam));

  @JsonKey(ignore: true)
  @override
  _$SettingsCopyWith<_Settings> get copyWith =>
      __$SettingsCopyWithImpl<_Settings>(this, _$identity);
}

abstract class _Settings implements Settings {
  const factory _Settings(
      {required UserName userName,
      required TeamName teamName,
      required FavouriteEplTeam favouriteEplTeam}) = _$_Settings;

  @override
  UserName get userName;
  @override
  TeamName get teamName;
  @override
  FavouriteEplTeam get favouriteEplTeam;
  @override
  @JsonKey(ignore: true)
  _$SettingsCopyWith<_Settings> get copyWith =>
      throw _privateConstructorUsedError;
}
