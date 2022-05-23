// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'epl_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EPLStatsTearOff {
  const _$EPLStatsTearOff();

  _EPLStat call({required PlayerName name}) {
    return _EPLStat(
      name: name,
    );
  }
}

/// @nodoc
const $EPLStats = _$EPLStatsTearOff();

/// @nodoc
mixin _$EPLStats {
  PlayerName get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EPLStatsCopyWith<EPLStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EPLStatsCopyWith<$Res> {
  factory $EPLStatsCopyWith(EPLStats value, $Res Function(EPLStats) then) =
      _$EPLStatsCopyWithImpl<$Res>;
  $Res call({PlayerName name});
}

/// @nodoc
class _$EPLStatsCopyWithImpl<$Res> implements $EPLStatsCopyWith<$Res> {
  _$EPLStatsCopyWithImpl(this._value, this._then);

  final EPLStats _value;
  // ignore: unused_field
  final $Res Function(EPLStats) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as PlayerName,
    ));
  }
}

/// @nodoc
abstract class _$EPLStatCopyWith<$Res> implements $EPLStatsCopyWith<$Res> {
  factory _$EPLStatCopyWith(_EPLStat value, $Res Function(_EPLStat) then) =
      __$EPLStatCopyWithImpl<$Res>;
  @override
  $Res call({PlayerName name});
}

/// @nodoc
class __$EPLStatCopyWithImpl<$Res> extends _$EPLStatsCopyWithImpl<$Res>
    implements _$EPLStatCopyWith<$Res> {
  __$EPLStatCopyWithImpl(_EPLStat _value, $Res Function(_EPLStat) _then)
      : super(_value, (v) => _then(v as _EPLStat));

  @override
  _EPLStat get _value => super._value as _EPLStat;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_EPLStat(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as PlayerName,
    ));
  }
}

/// @nodoc

class _$_EPLStat implements _EPLStat {
  const _$_EPLStat({required this.name});

  @override
  final PlayerName name;

  @override
  String toString() {
    return 'EPLStats(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EPLStat &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$EPLStatCopyWith<_EPLStat> get copyWith =>
      __$EPLStatCopyWithImpl<_EPLStat>(this, _$identity);
}

abstract class _EPLStat implements EPLStats {
  const factory _EPLStat({required PlayerName name}) = _$_EPLStat;

  @override
  PlayerName get name;
  @override
  @JsonKey(ignore: true)
  _$EPLStatCopyWith<_EPLStat> get copyWith =>
      throw _privateConstructorUsedError;
}
