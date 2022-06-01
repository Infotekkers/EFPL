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

  _CustomLeagues call(
      {required LeagueId leagueId,
      required LeagueName leagueName,
      required PreviousRank previousRank}) {
    return _CustomLeagues(
      leagueId: leagueId,
      leagueName: leagueName,
      previousRank: previousRank,
    );
  }
}

/// @nodoc
const $CustomLeagues = _$CustomLeaguesTearOff();

/// @nodoc
mixin _$CustomLeagues {
  LeagueId get leagueId => throw _privateConstructorUsedError;
  LeagueName get leagueName => throw _privateConstructorUsedError;
  PreviousRank get previousRank => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomLeaguesCopyWith<CustomLeagues> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomLeaguesCopyWith<$Res> {
  factory $CustomLeaguesCopyWith(
          CustomLeagues value, $Res Function(CustomLeagues) then) =
      _$CustomLeaguesCopyWithImpl<$Res>;
  $Res call(
      {LeagueId leagueId, LeagueName leagueName, PreviousRank previousRank});
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
    Object? leagueId = freezed,
    Object? leagueName = freezed,
    Object? previousRank = freezed,
  }) {
    return _then(_value.copyWith(
      leagueId: leagueId == freezed
          ? _value.leagueId
          : leagueId // ignore: cast_nullable_to_non_nullable
              as LeagueId,
      leagueName: leagueName == freezed
          ? _value.leagueName
          : leagueName // ignore: cast_nullable_to_non_nullable
              as LeagueName,
      previousRank: previousRank == freezed
          ? _value.previousRank
          : previousRank // ignore: cast_nullable_to_non_nullable
              as PreviousRank,
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
  $Res call(
      {LeagueId leagueId, LeagueName leagueName, PreviousRank previousRank});
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
    Object? leagueId = freezed,
    Object? leagueName = freezed,
    Object? previousRank = freezed,
  }) {
    return _then(_CustomLeagues(
      leagueId: leagueId == freezed
          ? _value.leagueId
          : leagueId // ignore: cast_nullable_to_non_nullable
              as LeagueId,
      leagueName: leagueName == freezed
          ? _value.leagueName
          : leagueName // ignore: cast_nullable_to_non_nullable
              as LeagueName,
      previousRank: previousRank == freezed
          ? _value.previousRank
          : previousRank // ignore: cast_nullable_to_non_nullable
              as PreviousRank,
    ));
  }
}

/// @nodoc

class _$_CustomLeagues implements _CustomLeagues {
  const _$_CustomLeagues(
      {required this.leagueId,
      required this.leagueName,
      required this.previousRank});

  @override
  final LeagueId leagueId;
  @override
  final LeagueName leagueName;
  @override
  final PreviousRank previousRank;

  @override
  String toString() {
    return 'CustomLeagues(leagueId: $leagueId, leagueName: $leagueName, previousRank: $previousRank)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomLeagues &&
            const DeepCollectionEquality().equals(other.leagueId, leagueId) &&
            const DeepCollectionEquality()
                .equals(other.leagueName, leagueName) &&
            const DeepCollectionEquality()
                .equals(other.previousRank, previousRank));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(leagueId),
      const DeepCollectionEquality().hash(leagueName),
      const DeepCollectionEquality().hash(previousRank));

  @JsonKey(ignore: true)
  @override
  _$CustomLeaguesCopyWith<_CustomLeagues> get copyWith =>
      __$CustomLeaguesCopyWithImpl<_CustomLeagues>(this, _$identity);
}

abstract class _CustomLeagues implements CustomLeagues {
  const factory _CustomLeagues(
      {required LeagueId leagueId,
      required LeagueName leagueName,
      required PreviousRank previousRank}) = _$_CustomLeagues;

  @override
  LeagueId get leagueId;
  @override
  LeagueName get leagueName;
  @override
  PreviousRank get previousRank;
  @override
  @JsonKey(ignore: true)
  _$CustomLeaguesCopyWith<_CustomLeagues> get copyWith =>
      throw _privateConstructorUsedError;
}
