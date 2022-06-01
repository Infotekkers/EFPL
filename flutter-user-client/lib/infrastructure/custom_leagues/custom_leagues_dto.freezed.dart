// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'custom_leagues_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomLeaguesDTO _$CustomLeaguesDTOFromJson(Map<String, dynamic> json) {
  return _CustomLeaguesDTO.fromJson(json);
}

/// @nodoc
class _$CustomLeaguesDTOTearOff {
  const _$CustomLeaguesDTOTearOff();

  _CustomLeaguesDTO call(
      {required int leagueId,
      required String leagueName,
      required int previousRank}) {
    return _CustomLeaguesDTO(
      leagueId: leagueId,
      leagueName: leagueName,
      previousRank: previousRank,
    );
  }

  CustomLeaguesDTO fromJson(Map<String, Object?> json) {
    return CustomLeaguesDTO.fromJson(json);
  }
}

/// @nodoc
const $CustomLeaguesDTO = _$CustomLeaguesDTOTearOff();

/// @nodoc
mixin _$CustomLeaguesDTO {
  int get leagueId => throw _privateConstructorUsedError;
  String get leagueName => throw _privateConstructorUsedError;
  int get previousRank => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomLeaguesDTOCopyWith<CustomLeaguesDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomLeaguesDTOCopyWith<$Res> {
  factory $CustomLeaguesDTOCopyWith(
          CustomLeaguesDTO value, $Res Function(CustomLeaguesDTO) then) =
      _$CustomLeaguesDTOCopyWithImpl<$Res>;
  $Res call({int leagueId, String leagueName, int previousRank});
}

/// @nodoc
class _$CustomLeaguesDTOCopyWithImpl<$Res>
    implements $CustomLeaguesDTOCopyWith<$Res> {
  _$CustomLeaguesDTOCopyWithImpl(this._value, this._then);

  final CustomLeaguesDTO _value;
  // ignore: unused_field
  final $Res Function(CustomLeaguesDTO) _then;

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
              as int,
      leagueName: leagueName == freezed
          ? _value.leagueName
          : leagueName // ignore: cast_nullable_to_non_nullable
              as String,
      previousRank: previousRank == freezed
          ? _value.previousRank
          : previousRank // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$CustomLeaguesDTOCopyWith<$Res>
    implements $CustomLeaguesDTOCopyWith<$Res> {
  factory _$CustomLeaguesDTOCopyWith(
          _CustomLeaguesDTO value, $Res Function(_CustomLeaguesDTO) then) =
      __$CustomLeaguesDTOCopyWithImpl<$Res>;
  @override
  $Res call({int leagueId, String leagueName, int previousRank});
}

/// @nodoc
class __$CustomLeaguesDTOCopyWithImpl<$Res>
    extends _$CustomLeaguesDTOCopyWithImpl<$Res>
    implements _$CustomLeaguesDTOCopyWith<$Res> {
  __$CustomLeaguesDTOCopyWithImpl(
      _CustomLeaguesDTO _value, $Res Function(_CustomLeaguesDTO) _then)
      : super(_value, (v) => _then(v as _CustomLeaguesDTO));

  @override
  _CustomLeaguesDTO get _value => super._value as _CustomLeaguesDTO;

  @override
  $Res call({
    Object? leagueId = freezed,
    Object? leagueName = freezed,
    Object? previousRank = freezed,
  }) {
    return _then(_CustomLeaguesDTO(
      leagueId: leagueId == freezed
          ? _value.leagueId
          : leagueId // ignore: cast_nullable_to_non_nullable
              as int,
      leagueName: leagueName == freezed
          ? _value.leagueName
          : leagueName // ignore: cast_nullable_to_non_nullable
              as String,
      previousRank: previousRank == freezed
          ? _value.previousRank
          : previousRank // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomLeaguesDTO extends _CustomLeaguesDTO {
  const _$_CustomLeaguesDTO(
      {required this.leagueId,
      required this.leagueName,
      required this.previousRank})
      : super._();

  factory _$_CustomLeaguesDTO.fromJson(Map<String, dynamic> json) =>
      _$$_CustomLeaguesDTOFromJson(json);

  @override
  final int leagueId;
  @override
  final String leagueName;
  @override
  final int previousRank;

  @override
  String toString() {
    return 'CustomLeaguesDTO(leagueId: $leagueId, leagueName: $leagueName, previousRank: $previousRank)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomLeaguesDTO &&
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
  _$CustomLeaguesDTOCopyWith<_CustomLeaguesDTO> get copyWith =>
      __$CustomLeaguesDTOCopyWithImpl<_CustomLeaguesDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomLeaguesDTOToJson(this);
  }
}

abstract class _CustomLeaguesDTO extends CustomLeaguesDTO {
  const factory _CustomLeaguesDTO(
      {required int leagueId,
      required String leagueName,
      required int previousRank}) = _$_CustomLeaguesDTO;
  const _CustomLeaguesDTO._() : super._();

  factory _CustomLeaguesDTO.fromJson(Map<String, dynamic> json) =
      _$_CustomLeaguesDTO.fromJson;

  @override
  int get leagueId;
  @override
  String get leagueName;
  @override
  int get previousRank;
  @override
  @JsonKey(ignore: true)
  _$CustomLeaguesDTOCopyWith<_CustomLeaguesDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
