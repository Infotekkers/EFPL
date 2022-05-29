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
class _$CustomLeaguesTearOff {
  const _$CustomLeaguesTearOff();

  _CustomLeagues call({required List<dynamic> userCustomLeagues}) {
    return _CustomLeagues(
      userCustomLeagues: userCustomLeagues,
    );
  }
}

/// @nodoc
const $CustomLeagues = _$CustomLeaguesTearOff();

/// @nodoc
mixin _$CustomLeagues {
  List<dynamic> get userCustomLeagues => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomLeaguesCopyWith<CustomLeagues> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomLeaguesCopyWith<$Res> {
  factory $CustomLeaguesCopyWith(
          CustomLeagues value, $Res Function(CustomLeagues) then) =
      _$CustomLeaguesCopyWithImpl<$Res>;
  $Res call({List<dynamic> userCustomLeagues});
}

/// @nodoc
class _$CustomLeaguesCopyWithImpl<$Res>
    implements $CustomLeaguesCopyWith<$Res> {
  _$CustomLeaguesCopyWithImpl(this._value, this._then);

  final CustomLeagues _value;
  // ignore: unused_field
  final $Res Function(CustomLeagues) _then;

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
abstract class _$CustomLeaguesCopyWith<$Res>
    implements $CustomLeaguesCopyWith<$Res> {
  factory _$CustomLeaguesCopyWith(
          _CustomLeagues value, $Res Function(_CustomLeagues) then) =
      __$CustomLeaguesCopyWithImpl<$Res>;
  @override
  $Res call({List<dynamic> userCustomLeagues});
}

/// @nodoc
class __$CustomLeaguesCopyWithImpl<$Res>
    extends _$CustomLeaguesCopyWithImpl<$Res>
    implements _$CustomLeaguesCopyWith<$Res> {
  __$CustomLeaguesCopyWithImpl(
      _CustomLeagues _value, $Res Function(_CustomLeagues) _then)
      : super(_value, (v) => _then(v as _CustomLeagues));

  @override
  _CustomLeagues get _value => super._value as _CustomLeagues;

  @override
  $Res call({
    Object? userCustomLeagues = freezed,
  }) {
    return _then(_CustomLeagues(
      userCustomLeagues: userCustomLeagues == freezed
          ? _value.userCustomLeagues
          : userCustomLeagues // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$_CustomLeagues implements _CustomLeagues {
  const _$_CustomLeagues({required this.userCustomLeagues});

  @override
  final List<dynamic> userCustomLeagues;

  @override
  String toString() {
    return 'CustomLeagues(userCustomLeagues: $userCustomLeagues)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomLeagues &&
            const DeepCollectionEquality()
                .equals(other.userCustomLeagues, userCustomLeagues));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(userCustomLeagues));

  @JsonKey(ignore: true)
  @override
  _$CustomLeaguesCopyWith<_CustomLeagues> get copyWith =>
      __$CustomLeaguesCopyWithImpl<_CustomLeagues>(this, _$identity);
}

abstract class _CustomLeagues implements CustomLeagues {
  const factory _CustomLeagues({required List<dynamic> userCustomLeagues}) =
      _$_CustomLeagues;

  @override
  List<dynamic> get userCustomLeagues;
  @override
  @JsonKey(ignore: true)
  _$CustomLeaguesCopyWith<_CustomLeagues> get copyWith =>
      throw _privateConstructorUsedError;
}
