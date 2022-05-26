// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'epl_stats_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EPLStatsDto _$EPLStatsDtoFromJson(Map<String, dynamic> json) {
  return _EPLStatsDto.fromJson(json);
}

/// @nodoc
class _$EPLStatsDtoTearOff {
  const _$EPLStatsDtoTearOff();

  _EPLStatsDto call({required String name, required int amount}) {
    return _EPLStatsDto(
      name: name,
      amount: amount,
    );
  }

  EPLStatsDto fromJson(Map<String, Object?> json) {
    return EPLStatsDto.fromJson(json);
  }
}

/// @nodoc
const $EPLStatsDto = _$EPLStatsDtoTearOff();

/// @nodoc
mixin _$EPLStatsDto {
  String get name => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EPLStatsDtoCopyWith<EPLStatsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EPLStatsDtoCopyWith<$Res> {
  factory $EPLStatsDtoCopyWith(
          EPLStatsDto value, $Res Function(EPLStatsDto) then) =
      _$EPLStatsDtoCopyWithImpl<$Res>;
  $Res call({String name, int amount});
}

/// @nodoc
class _$EPLStatsDtoCopyWithImpl<$Res> implements $EPLStatsDtoCopyWith<$Res> {
  _$EPLStatsDtoCopyWithImpl(this._value, this._then);

  final EPLStatsDto _value;
  // ignore: unused_field
  final $Res Function(EPLStatsDto) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$EPLStatsDtoCopyWith<$Res>
    implements $EPLStatsDtoCopyWith<$Res> {
  factory _$EPLStatsDtoCopyWith(
          _EPLStatsDto value, $Res Function(_EPLStatsDto) then) =
      __$EPLStatsDtoCopyWithImpl<$Res>;
  @override
  $Res call({String name, int amount});
}

/// @nodoc
class __$EPLStatsDtoCopyWithImpl<$Res> extends _$EPLStatsDtoCopyWithImpl<$Res>
    implements _$EPLStatsDtoCopyWith<$Res> {
  __$EPLStatsDtoCopyWithImpl(
      _EPLStatsDto _value, $Res Function(_EPLStatsDto) _then)
      : super(_value, (v) => _then(v as _EPLStatsDto));

  @override
  _EPLStatsDto get _value => super._value as _EPLStatsDto;

  @override
  $Res call({
    Object? name = freezed,
    Object? amount = freezed,
  }) {
    return _then(_EPLStatsDto(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EPLStatsDto extends _EPLStatsDto {
  const _$_EPLStatsDto({required this.name, required this.amount}) : super._();

  factory _$_EPLStatsDto.fromJson(Map<String, dynamic> json) =>
      _$$_EPLStatsDtoFromJson(json);

  @override
  final String name;
  @override
  final int amount;

  @override
  String toString() {
    return 'EPLStatsDto(name: $name, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EPLStatsDto &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.amount, amount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(amount));

  @JsonKey(ignore: true)
  @override
  _$EPLStatsDtoCopyWith<_EPLStatsDto> get copyWith =>
      __$EPLStatsDtoCopyWithImpl<_EPLStatsDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EPLStatsDtoToJson(this);
  }
}

abstract class _EPLStatsDto extends EPLStatsDto {
  const factory _EPLStatsDto({required String name, required int amount}) =
      _$_EPLStatsDto;
  const _EPLStatsDto._() : super._();

  factory _EPLStatsDto.fromJson(Map<String, dynamic> json) =
      _$_EPLStatsDto.fromJson;

  @override
  String get name;
  @override
  int get amount;
  @override
  @JsonKey(ignore: true)
  _$EPLStatsDtoCopyWith<_EPLStatsDto> get copyWith =>
      throw _privateConstructorUsedError;
}
