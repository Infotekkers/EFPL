// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'custom_leagues.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserCustomLeagueTearOff {
  const _$UserCustomLeagueTearOff();

  _UserCustomLeague call({required List<dynamic> userCustomLeagues}) {
    return _UserCustomLeague(
      userCustomLeagues: userCustomLeagues,
    );
  }
}

/// @nodoc
const $UserCustomLeague = _$UserCustomLeagueTearOff();

/// @nodoc
mixin _$UserCustomLeague {
  List<dynamic> get userCustomLeagues => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCustomLeagueCopyWith<UserCustomLeague> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCustomLeagueCopyWith<$Res> {
  factory $UserCustomLeagueCopyWith(
          UserCustomLeague value, $Res Function(UserCustomLeague) then) =
      _$UserCustomLeagueCopyWithImpl<$Res>;
  $Res call({List<dynamic> userCustomLeagues});
}

/// @nodoc
class _$UserCustomLeagueCopyWithImpl<$Res>
    implements $UserCustomLeagueCopyWith<$Res> {
  _$UserCustomLeagueCopyWithImpl(this._value, this._then);

  final UserCustomLeague _value;
  // ignore: unused_field
  final $Res Function(UserCustomLeague) _then;

  @override
  $Res call({
    Object? userCustomLeagues = freezed,
  }) {
    return _then(_value.copyWith(
      userCustomLeagues: userCustomLeagues == freezed
          ? _value.userCustomLeagues
          : userCustomLeagues // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$UserCustomLeagueCopyWith<$Res>
    implements $UserCustomLeagueCopyWith<$Res> {
  factory _$UserCustomLeagueCopyWith(
          _UserCustomLeague value, $Res Function(_UserCustomLeague) then) =
      __$UserCustomLeagueCopyWithImpl<$Res>;
  @override
  $Res call({List<dynamic> userCustomLeagues});
}

/// @nodoc
class __$UserCustomLeagueCopyWithImpl<$Res>
    extends _$UserCustomLeagueCopyWithImpl<$Res>
    implements _$UserCustomLeagueCopyWith<$Res> {
  __$UserCustomLeagueCopyWithImpl(
      _UserCustomLeague _value, $Res Function(_UserCustomLeague) _then)
      : super(_value, (v) => _then(v as _UserCustomLeague));

  @override
  _UserCustomLeague get _value => super._value as _UserCustomLeague;

  @override
  $Res call({
    Object? userCustomLeagues = freezed,
  }) {
    return _then(_UserCustomLeague(
      userCustomLeagues: userCustomLeagues == freezed
          ? _value.userCustomLeagues
          : userCustomLeagues // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$_UserCustomLeague implements _UserCustomLeague {
  const _$_UserCustomLeague({required this.userCustomLeagues});

  @override
  final List<dynamic> userCustomLeagues;

  @override
  String toString() {
    return 'UserCustomLeague(userCustomLeagues: $userCustomLeagues)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserCustomLeague &&
            const DeepCollectionEquality()
                .equals(other.userCustomLeagues, userCustomLeagues));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(userCustomLeagues));

  @JsonKey(ignore: true)
  @override
  _$UserCustomLeagueCopyWith<_UserCustomLeague> get copyWith =>
      __$UserCustomLeagueCopyWithImpl<_UserCustomLeague>(this, _$identity);
}

abstract class _UserCustomLeague implements UserCustomLeague {
  const factory _UserCustomLeague({required List<dynamic> userCustomLeagues}) =
      _$_UserCustomLeague;

  @override
  List<dynamic> get userCustomLeagues;
  @override
  @JsonKey(ignore: true)
  _$UserCustomLeagueCopyWith<_UserCustomLeague> get copyWith =>
      throw _privateConstructorUsedError;
}
