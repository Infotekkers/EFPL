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
      required List<dynamic> teams,
      required int leagueStartGameWeek}) {
    return _CustomLeagueInfoDTO(
      leagueId: leagueId,
      leagueName: leagueName,
      leagueType: leagueType,
      leagueCode: leagueCode,
      adminId: adminId,
      teams: teams,
      leagueStartGameWeek: leagueStartGameWeek,
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
  List<dynamic> get teams => throw _privateConstructorUsedError;
  int get leagueStartGameWeek => throw _privateConstructorUsedError;

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
      List<dynamic> teams,
      int leagueStartGameWeek});
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
    Object? teams = freezed,
    Object? leagueStartGameWeek = freezed,
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
      teams: teams == freezed
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      leagueStartGameWeek: leagueStartGameWeek == freezed
          ? _value.leagueStartGameWeek
          : leagueStartGameWeek // ignore: cast_nullable_to_non_nullable
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
      List<dynamic> teams,
      int leagueStartGameWeek});
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
    Object? teams = freezed,
    Object? leagueStartGameWeek = freezed,
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
      teams: teams == freezed
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      leagueStartGameWeek: leagueStartGameWeek == freezed
          ? _value.leagueStartGameWeek
          : leagueStartGameWeek // ignore: cast_nullable_to_non_nullable
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
      required this.teams,
      required this.leagueStartGameWeek})
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
  final List<dynamic> teams;
  @override
  final int leagueStartGameWeek;

  @override
  String toString() {
    return 'CustomLeagueInfoDTO(leagueId: $leagueId, leagueName: $leagueName, leagueType: $leagueType, leagueCode: $leagueCode, adminId: $adminId, teams: $teams, leagueStartGameWeek: $leagueStartGameWeek)';
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
            const DeepCollectionEquality().equals(other.teams, teams) &&
            const DeepCollectionEquality()
                .equals(other.leagueStartGameWeek, leagueStartGameWeek));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(leagueId),
      const DeepCollectionEquality().hash(leagueName),
      const DeepCollectionEquality().hash(leagueType),
      const DeepCollectionEquality().hash(leagueCode),
      const DeepCollectionEquality().hash(adminId),
      const DeepCollectionEquality().hash(teams),
      const DeepCollectionEquality().hash(leagueStartGameWeek));

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
      required List<dynamic> teams,
      required int leagueStartGameWeek}) = _$_CustomLeagueInfoDTO;
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
  List<dynamic> get teams;
  @override
  int get leagueStartGameWeek;
  @override
  @JsonKey(ignore: true)
  _$CustomLeagueInfoDTOCopyWith<_CustomLeagueInfoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateCustomLeagueInputDto _$CreateCustomLeagueInputDtoFromJson(
    Map<String, dynamic> json) {
  return _CreateCustomLeagueInputDto.fromJson(json);
}

/// @nodoc
class _$CreateCustomLeagueInputDtoTearOff {
  const _$CreateCustomLeagueInputDtoTearOff();

  _CreateCustomLeagueInputDto call(
      {required String adminId, required String leagueName}) {
    return _CreateCustomLeagueInputDto(
      adminId: adminId,
      leagueName: leagueName,
    );
  }

  CreateCustomLeagueInputDto fromJson(Map<String, Object?> json) {
    return CreateCustomLeagueInputDto.fromJson(json);
  }
}

/// @nodoc
const $CreateCustomLeagueInputDto = _$CreateCustomLeagueInputDtoTearOff();

/// @nodoc
mixin _$CreateCustomLeagueInputDto {
  String get adminId => throw _privateConstructorUsedError;
  String get leagueName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateCustomLeagueInputDtoCopyWith<CreateCustomLeagueInputDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCustomLeagueInputDtoCopyWith<$Res> {
  factory $CreateCustomLeagueInputDtoCopyWith(CreateCustomLeagueInputDto value,
          $Res Function(CreateCustomLeagueInputDto) then) =
      _$CreateCustomLeagueInputDtoCopyWithImpl<$Res>;
  $Res call({String adminId, String leagueName});
}

/// @nodoc
class _$CreateCustomLeagueInputDtoCopyWithImpl<$Res>
    implements $CreateCustomLeagueInputDtoCopyWith<$Res> {
  _$CreateCustomLeagueInputDtoCopyWithImpl(this._value, this._then);

  final CreateCustomLeagueInputDto _value;
  // ignore: unused_field
  final $Res Function(CreateCustomLeagueInputDto) _then;

  @override
  $Res call({
    Object? adminId = freezed,
    Object? leagueName = freezed,
  }) {
    return _then(_value.copyWith(
      adminId: adminId == freezed
          ? _value.adminId
          : adminId // ignore: cast_nullable_to_non_nullable
              as String,
      leagueName: leagueName == freezed
          ? _value.leagueName
          : leagueName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CreateCustomLeagueInputDtoCopyWith<$Res>
    implements $CreateCustomLeagueInputDtoCopyWith<$Res> {
  factory _$CreateCustomLeagueInputDtoCopyWith(
          _CreateCustomLeagueInputDto value,
          $Res Function(_CreateCustomLeagueInputDto) then) =
      __$CreateCustomLeagueInputDtoCopyWithImpl<$Res>;
  @override
  $Res call({String adminId, String leagueName});
}

/// @nodoc
class __$CreateCustomLeagueInputDtoCopyWithImpl<$Res>
    extends _$CreateCustomLeagueInputDtoCopyWithImpl<$Res>
    implements _$CreateCustomLeagueInputDtoCopyWith<$Res> {
  __$CreateCustomLeagueInputDtoCopyWithImpl(_CreateCustomLeagueInputDto _value,
      $Res Function(_CreateCustomLeagueInputDto) _then)
      : super(_value, (v) => _then(v as _CreateCustomLeagueInputDto));

  @override
  _CreateCustomLeagueInputDto get _value =>
      super._value as _CreateCustomLeagueInputDto;

  @override
  $Res call({
    Object? adminId = freezed,
    Object? leagueName = freezed,
  }) {
    return _then(_CreateCustomLeagueInputDto(
      adminId: adminId == freezed
          ? _value.adminId
          : adminId // ignore: cast_nullable_to_non_nullable
              as String,
      leagueName: leagueName == freezed
          ? _value.leagueName
          : leagueName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateCustomLeagueInputDto extends _CreateCustomLeagueInputDto {
  const _$_CreateCustomLeagueInputDto(
      {required this.adminId, required this.leagueName})
      : super._();

  factory _$_CreateCustomLeagueInputDto.fromJson(Map<String, dynamic> json) =>
      _$$_CreateCustomLeagueInputDtoFromJson(json);

  @override
  final String adminId;
  @override
  final String leagueName;

  @override
  String toString() {
    return 'CreateCustomLeagueInputDto(adminId: $adminId, leagueName: $leagueName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateCustomLeagueInputDto &&
            const DeepCollectionEquality().equals(other.adminId, adminId) &&
            const DeepCollectionEquality()
                .equals(other.leagueName, leagueName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(adminId),
      const DeepCollectionEquality().hash(leagueName));

  @JsonKey(ignore: true)
  @override
  _$CreateCustomLeagueInputDtoCopyWith<_CreateCustomLeagueInputDto>
      get copyWith => __$CreateCustomLeagueInputDtoCopyWithImpl<
          _CreateCustomLeagueInputDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateCustomLeagueInputDtoToJson(this);
  }
}

abstract class _CreateCustomLeagueInputDto extends CreateCustomLeagueInputDto {
  const factory _CreateCustomLeagueInputDto(
      {required String adminId,
      required String leagueName}) = _$_CreateCustomLeagueInputDto;
  const _CreateCustomLeagueInputDto._() : super._();

  factory _CreateCustomLeagueInputDto.fromJson(Map<String, dynamic> json) =
      _$_CreateCustomLeagueInputDto.fromJson;

  @override
  String get adminId;
  @override
  String get leagueName;
  @override
  @JsonKey(ignore: true)
  _$CreateCustomLeagueInputDtoCopyWith<_CreateCustomLeagueInputDto>
      get copyWith => throw _privateConstructorUsedError;
}

JoinCustomLeagueInputDto _$JoinCustomLeagueInputDtoFromJson(
    Map<String, dynamic> json) {
  return _JoinCustomLeagueInputDto.fromJson(json);
}

/// @nodoc
class _$JoinCustomLeagueInputDtoTearOff {
  const _$JoinCustomLeagueInputDtoTearOff();

  _JoinCustomLeagueInputDto call(
      {required String userId, required String leagueCode}) {
    return _JoinCustomLeagueInputDto(
      userId: userId,
      leagueCode: leagueCode,
    );
  }

  JoinCustomLeagueInputDto fromJson(Map<String, Object?> json) {
    return JoinCustomLeagueInputDto.fromJson(json);
  }
}

/// @nodoc
const $JoinCustomLeagueInputDto = _$JoinCustomLeagueInputDtoTearOff();

/// @nodoc
mixin _$JoinCustomLeagueInputDto {
  String get userId => throw _privateConstructorUsedError;
  String get leagueCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JoinCustomLeagueInputDtoCopyWith<JoinCustomLeagueInputDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinCustomLeagueInputDtoCopyWith<$Res> {
  factory $JoinCustomLeagueInputDtoCopyWith(JoinCustomLeagueInputDto value,
          $Res Function(JoinCustomLeagueInputDto) then) =
      _$JoinCustomLeagueInputDtoCopyWithImpl<$Res>;
  $Res call({String userId, String leagueCode});
}

/// @nodoc
class _$JoinCustomLeagueInputDtoCopyWithImpl<$Res>
    implements $JoinCustomLeagueInputDtoCopyWith<$Res> {
  _$JoinCustomLeagueInputDtoCopyWithImpl(this._value, this._then);

  final JoinCustomLeagueInputDto _value;
  // ignore: unused_field
  final $Res Function(JoinCustomLeagueInputDto) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? leagueCode = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      leagueCode: leagueCode == freezed
          ? _value.leagueCode
          : leagueCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$JoinCustomLeagueInputDtoCopyWith<$Res>
    implements $JoinCustomLeagueInputDtoCopyWith<$Res> {
  factory _$JoinCustomLeagueInputDtoCopyWith(_JoinCustomLeagueInputDto value,
          $Res Function(_JoinCustomLeagueInputDto) then) =
      __$JoinCustomLeagueInputDtoCopyWithImpl<$Res>;
  @override
  $Res call({String userId, String leagueCode});
}

/// @nodoc
class __$JoinCustomLeagueInputDtoCopyWithImpl<$Res>
    extends _$JoinCustomLeagueInputDtoCopyWithImpl<$Res>
    implements _$JoinCustomLeagueInputDtoCopyWith<$Res> {
  __$JoinCustomLeagueInputDtoCopyWithImpl(_JoinCustomLeagueInputDto _value,
      $Res Function(_JoinCustomLeagueInputDto) _then)
      : super(_value, (v) => _then(v as _JoinCustomLeagueInputDto));

  @override
  _JoinCustomLeagueInputDto get _value =>
      super._value as _JoinCustomLeagueInputDto;

  @override
  $Res call({
    Object? userId = freezed,
    Object? leagueCode = freezed,
  }) {
    return _then(_JoinCustomLeagueInputDto(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      leagueCode: leagueCode == freezed
          ? _value.leagueCode
          : leagueCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JoinCustomLeagueInputDto extends _JoinCustomLeagueInputDto {
  const _$_JoinCustomLeagueInputDto(
      {required this.userId, required this.leagueCode})
      : super._();

  factory _$_JoinCustomLeagueInputDto.fromJson(Map<String, dynamic> json) =>
      _$$_JoinCustomLeagueInputDtoFromJson(json);

  @override
  final String userId;
  @override
  final String leagueCode;

  @override
  String toString() {
    return 'JoinCustomLeagueInputDto(userId: $userId, leagueCode: $leagueCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _JoinCustomLeagueInputDto &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.leagueCode, leagueCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(leagueCode));

  @JsonKey(ignore: true)
  @override
  _$JoinCustomLeagueInputDtoCopyWith<_JoinCustomLeagueInputDto> get copyWith =>
      __$JoinCustomLeagueInputDtoCopyWithImpl<_JoinCustomLeagueInputDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JoinCustomLeagueInputDtoToJson(this);
  }
}

abstract class _JoinCustomLeagueInputDto extends JoinCustomLeagueInputDto {
  const factory _JoinCustomLeagueInputDto(
      {required String userId,
      required String leagueCode}) = _$_JoinCustomLeagueInputDto;
  const _JoinCustomLeagueInputDto._() : super._();

  factory _JoinCustomLeagueInputDto.fromJson(Map<String, dynamic> json) =
      _$_JoinCustomLeagueInputDto.fromJson;

  @override
  String get userId;
  @override
  String get leagueCode;
  @override
  @JsonKey(ignore: true)
  _$JoinCustomLeagueInputDtoCopyWith<_JoinCustomLeagueInputDto> get copyWith =>
      throw _privateConstructorUsedError;
}
