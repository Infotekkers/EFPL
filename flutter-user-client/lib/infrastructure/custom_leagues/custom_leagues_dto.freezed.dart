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

CustomLeagueInfoDTO _$CustomLeagueInfoDTOFromJson(Map<String, dynamic> json) {
  return _CustomLeagueInfoDTO.fromJson(json);
}

/// @nodoc
class _$CustomLeagueInfoDTOTearOff {
  const _$CustomLeagueInfoDTOTearOff();

  _CustomLeagueInfoDTO call(
      {required int leagueId,
      required String leagueName,
      required String leagueType,
      required String leagueCode,
      required String adminId,
      required List<dynamic> customLeagueMembers,
      required int leagueStartGameweek}) {
    return _CustomLeagueInfoDTO(
      leagueId: leagueId,
      leagueName: leagueName,
      leagueType: leagueType,
      leagueCode: leagueCode,
      adminId: adminId,
      customLeagueMembers: customLeagueMembers,
      leagueStartGameweek: leagueStartGameweek,
    );
  }

  CustomLeagueInfoDTO fromJson(Map<String, Object?> json) {
    return CustomLeagueInfoDTO.fromJson(json);
  }
}

/// @nodoc
const $CustomLeagueInfoDTO = _$CustomLeagueInfoDTOTearOff();

/// @nodoc
mixin _$CustomLeagueInfoDTO {
  int get leagueId => throw _privateConstructorUsedError;
  String get leagueName => throw _privateConstructorUsedError;
  String get leagueType => throw _privateConstructorUsedError;
  String get leagueCode => throw _privateConstructorUsedError;
  String get adminId => throw _privateConstructorUsedError;
  List<dynamic> get customLeagueMembers => throw _privateConstructorUsedError;
  int get leagueStartGameweek => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomLeagueInfoDTOCopyWith<CustomLeagueInfoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomLeagueInfoDTOCopyWith<$Res> {
  factory $CustomLeagueInfoDTOCopyWith(
          CustomLeagueInfoDTO value, $Res Function(CustomLeagueInfoDTO) then) =
      _$CustomLeagueInfoDTOCopyWithImpl<$Res>;
  $Res call(
      {int leagueId,
      String leagueName,
      String leagueType,
      String leagueCode,
      String adminId,
      List<dynamic> customLeagueMembers,
      int leagueStartGameweek});
}

/// @nodoc
class _$CustomLeagueInfoDTOCopyWithImpl<$Res>
    implements $CustomLeagueInfoDTOCopyWith<$Res> {
  _$CustomLeagueInfoDTOCopyWithImpl(this._value, this._then);

  final CustomLeagueInfoDTO _value;
  // ignore: unused_field
  final $Res Function(CustomLeagueInfoDTO) _then;

  @override
  $Res call({
    Object? leagueId = freezed,
    Object? leagueName = freezed,
    Object? leagueType = freezed,
    Object? leagueCode = freezed,
    Object? adminId = freezed,
    Object? customLeagueMembers = freezed,
    Object? leagueStartGameweek = freezed,
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
      leagueType: leagueType == freezed
          ? _value.leagueType
          : leagueType // ignore: cast_nullable_to_non_nullable
              as String,
      leagueCode: leagueCode == freezed
          ? _value.leagueCode
          : leagueCode // ignore: cast_nullable_to_non_nullable
              as String,
      adminId: adminId == freezed
          ? _value.adminId
          : adminId // ignore: cast_nullable_to_non_nullable
              as String,
      customLeagueMembers: customLeagueMembers == freezed
          ? _value.customLeagueMembers
          : customLeagueMembers // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      leagueStartGameweek: leagueStartGameweek == freezed
          ? _value.leagueStartGameweek
          : leagueStartGameweek // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$CustomLeagueInfoDTOCopyWith<$Res>
    implements $CustomLeagueInfoDTOCopyWith<$Res> {
  factory _$CustomLeagueInfoDTOCopyWith(_CustomLeagueInfoDTO value,
          $Res Function(_CustomLeagueInfoDTO) then) =
      __$CustomLeagueInfoDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {int leagueId,
      String leagueName,
      String leagueType,
      String leagueCode,
      String adminId,
      List<dynamic> customLeagueMembers,
      int leagueStartGameweek});
}

/// @nodoc
class __$CustomLeagueInfoDTOCopyWithImpl<$Res>
    extends _$CustomLeagueInfoDTOCopyWithImpl<$Res>
    implements _$CustomLeagueInfoDTOCopyWith<$Res> {
  __$CustomLeagueInfoDTOCopyWithImpl(
      _CustomLeagueInfoDTO _value, $Res Function(_CustomLeagueInfoDTO) _then)
      : super(_value, (v) => _then(v as _CustomLeagueInfoDTO));

  @override
  _CustomLeagueInfoDTO get _value => super._value as _CustomLeagueInfoDTO;

  @override
  $Res call({
    Object? leagueId = freezed,
    Object? leagueName = freezed,
    Object? leagueType = freezed,
    Object? leagueCode = freezed,
    Object? adminId = freezed,
    Object? customLeagueMembers = freezed,
    Object? leagueStartGameweek = freezed,
  }) {
    return _then(_CustomLeagueInfoDTO(
      leagueId: leagueId == freezed
          ? _value.leagueId
          : leagueId // ignore: cast_nullable_to_non_nullable
              as int,
      leagueName: leagueName == freezed
          ? _value.leagueName
          : leagueName // ignore: cast_nullable_to_non_nullable
              as String,
      leagueType: leagueType == freezed
          ? _value.leagueType
          : leagueType // ignore: cast_nullable_to_non_nullable
              as String,
      leagueCode: leagueCode == freezed
          ? _value.leagueCode
          : leagueCode // ignore: cast_nullable_to_non_nullable
              as String,
      adminId: adminId == freezed
          ? _value.adminId
          : adminId // ignore: cast_nullable_to_non_nullable
              as String,
      customLeagueMembers: customLeagueMembers == freezed
          ? _value.customLeagueMembers
          : customLeagueMembers // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      leagueStartGameweek: leagueStartGameweek == freezed
          ? _value.leagueStartGameweek
          : leagueStartGameweek // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomLeagueInfoDTO extends _CustomLeagueInfoDTO {
  const _$_CustomLeagueInfoDTO(
      {required this.leagueId,
      required this.leagueName,
      required this.leagueType,
      required this.leagueCode,
      required this.adminId,
      required this.customLeagueMembers,
      required this.leagueStartGameweek})
      : super._();

  factory _$_CustomLeagueInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$$_CustomLeagueInfoDTOFromJson(json);

  @override
  final int leagueId;
  @override
  final String leagueName;
  @override
  final String leagueType;
  @override
  final String leagueCode;
  @override
  final String adminId;
  @override
  final List<dynamic> customLeagueMembers;
  @override
  final int leagueStartGameweek;

  @override
  String toString() {
    return 'CustomLeagueInfoDTO(leagueId: $leagueId, leagueName: $leagueName, leagueType: $leagueType, leagueCode: $leagueCode, adminId: $adminId, customLeagueMembers: $customLeagueMembers, leagueStartGameweek: $leagueStartGameweek)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomLeagueInfoDTO &&
            const DeepCollectionEquality().equals(other.leagueId, leagueId) &&
            const DeepCollectionEquality()
                .equals(other.leagueName, leagueName) &&
            const DeepCollectionEquality()
                .equals(other.leagueType, leagueType) &&
            const DeepCollectionEquality()
                .equals(other.leagueCode, leagueCode) &&
            const DeepCollectionEquality().equals(other.adminId, adminId) &&
            const DeepCollectionEquality()
                .equals(other.customLeagueMembers, customLeagueMembers) &&
            const DeepCollectionEquality()
                .equals(other.leagueStartGameweek, leagueStartGameweek));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(leagueId),
      const DeepCollectionEquality().hash(leagueName),
      const DeepCollectionEquality().hash(leagueType),
      const DeepCollectionEquality().hash(leagueCode),
      const DeepCollectionEquality().hash(adminId),
      const DeepCollectionEquality().hash(customLeagueMembers),
      const DeepCollectionEquality().hash(leagueStartGameweek));

  @JsonKey(ignore: true)
  @override
  _$CustomLeagueInfoDTOCopyWith<_CustomLeagueInfoDTO> get copyWith =>
      __$CustomLeagueInfoDTOCopyWithImpl<_CustomLeagueInfoDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomLeagueInfoDTOToJson(this);
  }
}

abstract class _CustomLeagueInfoDTO extends CustomLeagueInfoDTO {
  const factory _CustomLeagueInfoDTO(
      {required int leagueId,
      required String leagueName,
      required String leagueType,
      required String leagueCode,
      required String adminId,
      required List<dynamic> customLeagueMembers,
      required int leagueStartGameweek}) = _$_CustomLeagueInfoDTO;
  const _CustomLeagueInfoDTO._() : super._();

  factory _CustomLeagueInfoDTO.fromJson(Map<String, dynamic> json) =
      _$_CustomLeagueInfoDTO.fromJson;

  @override
  int get leagueId;
  @override
  String get leagueName;
  @override
  String get leagueType;
  @override
  String get leagueCode;
  @override
  String get adminId;
  @override
  List<dynamic> get customLeagueMembers;
  @override
  int get leagueStartGameweek;
  @override
  @JsonKey(ignore: true)
  _$CustomLeagueInfoDTOCopyWith<_CustomLeagueInfoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
