// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserDetailTearOff {
  const _$UserDetailTearOff();

  _UserDetail call(
      {required UserName userName,
      required TeamName teamName,
      required FavouriteEplTeam favouriteEplTeam}) {
    return _UserDetail(
      userName: userName,
      teamName: teamName,
      favouriteEplTeam: favouriteEplTeam,
    );
  }
}

/// @nodoc
const $UserDetail = _$UserDetailTearOff();

/// @nodoc
mixin _$UserDetail {
  UserName get userName => throw _privateConstructorUsedError;
  TeamName get teamName => throw _privateConstructorUsedError;
  FavouriteEplTeam get favouriteEplTeam => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDetailCopyWith<UserDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailCopyWith<$Res> {
  factory $UserDetailCopyWith(
          UserDetail value, $Res Function(UserDetail) then) =
      _$UserDetailCopyWithImpl<$Res>;
  $Res call(
      {UserName userName,
      TeamName teamName,
      FavouriteEplTeam favouriteEplTeam});
}

/// @nodoc
class _$UserDetailCopyWithImpl<$Res> implements $UserDetailCopyWith<$Res> {
  _$UserDetailCopyWithImpl(this._value, this._then);

  final UserDetail _value;
  // ignore: unused_field
  final $Res Function(UserDetail) _then;

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
abstract class _$UserDetailCopyWith<$Res> implements $UserDetailCopyWith<$Res> {
  factory _$UserDetailCopyWith(
          _UserDetail value, $Res Function(_UserDetail) then) =
      __$UserDetailCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserName userName,
      TeamName teamName,
      FavouriteEplTeam favouriteEplTeam});
}

/// @nodoc
class __$UserDetailCopyWithImpl<$Res> extends _$UserDetailCopyWithImpl<$Res>
    implements _$UserDetailCopyWith<$Res> {
  __$UserDetailCopyWithImpl(
      _UserDetail _value, $Res Function(_UserDetail) _then)
      : super(_value, (v) => _then(v as _UserDetail));

  @override
  _UserDetail get _value => super._value as _UserDetail;

  @override
  $Res call({
    Object? userName = freezed,
    Object? teamName = freezed,
    Object? favouriteEplTeam = freezed,
  }) {
    return _then(_UserDetail(
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

class _$_UserDetail implements _UserDetail {
  const _$_UserDetail(
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
    return 'UserDetail(userName: $userName, teamName: $teamName, favouriteEplTeam: $favouriteEplTeam)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDetail &&
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
  _$UserDetailCopyWith<_UserDetail> get copyWith =>
      __$UserDetailCopyWithImpl<_UserDetail>(this, _$identity);
}

abstract class _UserDetail implements UserDetail {
  const factory _UserDetail(
      {required UserName userName,
      required TeamName teamName,
      required FavouriteEplTeam favouriteEplTeam}) = _$_UserDetail;

  @override
  UserName get userName;
  @override
  TeamName get teamName;
  @override
  FavouriteEplTeam get favouriteEplTeam;
  @override
  @JsonKey(ignore: true)
  _$UserDetailCopyWith<_UserDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
