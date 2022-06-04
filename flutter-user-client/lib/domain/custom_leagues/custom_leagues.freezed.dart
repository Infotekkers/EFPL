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

/// @nodoc
class _$CustomLeaguesInfoTearOff {
  const _$CustomLeaguesInfoTearOff();

  _CustomLeaguesInfo call(
      {required LeagueId leagueId,
      required LeagueName leagueName,
      required LeagueType leagueType,
      required LeagueCode leagueCode,
      required AdminId adminId,
      required List<CustomLeagueMember> customleagueMembers,
      required LeagueStartGameweek leagueStartGameweek}) {
    return _CustomLeaguesInfo(
      leagueId: leagueId,
      leagueName: leagueName,
      leagueType: leagueType,
      leagueCode: leagueCode,
      adminId: adminId,
      customleagueMembers: customleagueMembers,
      leagueStartGameweek: leagueStartGameweek,
    );
  }
}

/// @nodoc
const $CustomLeaguesInfo = _$CustomLeaguesInfoTearOff();

/// @nodoc
mixin _$CustomLeaguesInfo {
  LeagueId get leagueId => throw _privateConstructorUsedError;
  LeagueName get leagueName => throw _privateConstructorUsedError;
  LeagueType get leagueType => throw _privateConstructorUsedError;
  LeagueCode get leagueCode => throw _privateConstructorUsedError;
  AdminId get adminId => throw _privateConstructorUsedError;
  List<CustomLeagueMember> get customleagueMembers =>
      throw _privateConstructorUsedError;
  LeagueStartGameweek get leagueStartGameweek =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomLeaguesInfoCopyWith<CustomLeaguesInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomLeaguesInfoCopyWith<$Res> {
  factory $CustomLeaguesInfoCopyWith(
          CustomLeaguesInfo value, $Res Function(CustomLeaguesInfo) then) =
      _$CustomLeaguesInfoCopyWithImpl<$Res>;
  $Res call(
      {LeagueId leagueId,
      LeagueName leagueName,
      LeagueType leagueType,
      LeagueCode leagueCode,
      AdminId adminId,
      List<CustomLeagueMember> customleagueMembers,
      LeagueStartGameweek leagueStartGameweek});
}

/// @nodoc
class _$CustomLeaguesInfoCopyWithImpl<$Res>
    implements $CustomLeaguesInfoCopyWith<$Res> {
  _$CustomLeaguesInfoCopyWithImpl(this._value, this._then);

  final CustomLeaguesInfo _value;
  // ignore: unused_field
  final $Res Function(CustomLeaguesInfo) _then;

  @override
  $Res call({
    Object? leagueId = freezed,
    Object? leagueName = freezed,
    Object? leagueType = freezed,
    Object? leagueCode = freezed,
    Object? adminId = freezed,
    Object? customleagueMembers = freezed,
    Object? leagueStartGameweek = freezed,
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
      leagueType: leagueType == freezed
          ? _value.leagueType
          : leagueType // ignore: cast_nullable_to_non_nullable
              as LeagueType,
      leagueCode: leagueCode == freezed
          ? _value.leagueCode
          : leagueCode // ignore: cast_nullable_to_non_nullable
              as LeagueCode,
      adminId: adminId == freezed
          ? _value.adminId
          : adminId // ignore: cast_nullable_to_non_nullable
              as AdminId,
      customleagueMembers: customleagueMembers == freezed
          ? _value.customleagueMembers
          : customleagueMembers // ignore: cast_nullable_to_non_nullable
              as List<CustomLeagueMember>,
      leagueStartGameweek: leagueStartGameweek == freezed
          ? _value.leagueStartGameweek
          : leagueStartGameweek // ignore: cast_nullable_to_non_nullable
              as LeagueStartGameweek,
    ));
  }
}

/// @nodoc
abstract class _$CustomLeaguesInfoCopyWith<$Res>
    implements $CustomLeaguesInfoCopyWith<$Res> {
  factory _$CustomLeaguesInfoCopyWith(
          _CustomLeaguesInfo value, $Res Function(_CustomLeaguesInfo) then) =
      __$CustomLeaguesInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {LeagueId leagueId,
      LeagueName leagueName,
      LeagueType leagueType,
      LeagueCode leagueCode,
      AdminId adminId,
      List<CustomLeagueMember> customleagueMembers,
      LeagueStartGameweek leagueStartGameweek});
}

/// @nodoc
class __$CustomLeaguesInfoCopyWithImpl<$Res>
    extends _$CustomLeaguesInfoCopyWithImpl<$Res>
    implements _$CustomLeaguesInfoCopyWith<$Res> {
  __$CustomLeaguesInfoCopyWithImpl(
      _CustomLeaguesInfo _value, $Res Function(_CustomLeaguesInfo) _then)
      : super(_value, (v) => _then(v as _CustomLeaguesInfo));

  @override
  _CustomLeaguesInfo get _value => super._value as _CustomLeaguesInfo;

  @override
  $Res call({
    Object? leagueId = freezed,
    Object? leagueName = freezed,
    Object? leagueType = freezed,
    Object? leagueCode = freezed,
    Object? adminId = freezed,
    Object? customleagueMembers = freezed,
    Object? leagueStartGameweek = freezed,
  }) {
    return _then(_CustomLeaguesInfo(
      leagueId: leagueId == freezed
          ? _value.leagueId
          : leagueId // ignore: cast_nullable_to_non_nullable
              as LeagueId,
      leagueName: leagueName == freezed
          ? _value.leagueName
          : leagueName // ignore: cast_nullable_to_non_nullable
              as LeagueName,
      leagueType: leagueType == freezed
          ? _value.leagueType
          : leagueType // ignore: cast_nullable_to_non_nullable
              as LeagueType,
      leagueCode: leagueCode == freezed
          ? _value.leagueCode
          : leagueCode // ignore: cast_nullable_to_non_nullable
              as LeagueCode,
      adminId: adminId == freezed
          ? _value.adminId
          : adminId // ignore: cast_nullable_to_non_nullable
              as AdminId,
      customleagueMembers: customleagueMembers == freezed
          ? _value.customleagueMembers
          : customleagueMembers // ignore: cast_nullable_to_non_nullable
              as List<CustomLeagueMember>,
      leagueStartGameweek: leagueStartGameweek == freezed
          ? _value.leagueStartGameweek
          : leagueStartGameweek // ignore: cast_nullable_to_non_nullable
              as LeagueStartGameweek,
    ));
  }
}

/// @nodoc

class _$_CustomLeaguesInfo implements _CustomLeaguesInfo {
  const _$_CustomLeaguesInfo(
      {required this.leagueId,
      required this.leagueName,
      required this.leagueType,
      required this.leagueCode,
      required this.adminId,
      required this.customleagueMembers,
      required this.leagueStartGameweek});

  @override
  final LeagueId leagueId;
  @override
  final LeagueName leagueName;
  @override
  final LeagueType leagueType;
  @override
  final LeagueCode leagueCode;
  @override
  final AdminId adminId;
  @override
  final List<CustomLeagueMember> customleagueMembers;
  @override
  final LeagueStartGameweek leagueStartGameweek;

  @override
  String toString() {
    return 'CustomLeaguesInfo(leagueId: $leagueId, leagueName: $leagueName, leagueType: $leagueType, leagueCode: $leagueCode, adminId: $adminId, customleagueMembers: $customleagueMembers, leagueStartGameweek: $leagueStartGameweek)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomLeaguesInfo &&
            const DeepCollectionEquality().equals(other.leagueId, leagueId) &&
            const DeepCollectionEquality()
                .equals(other.leagueName, leagueName) &&
            const DeepCollectionEquality()
                .equals(other.leagueType, leagueType) &&
            const DeepCollectionEquality()
                .equals(other.leagueCode, leagueCode) &&
            const DeepCollectionEquality().equals(other.adminId, adminId) &&
            const DeepCollectionEquality()
                .equals(other.customleagueMembers, customleagueMembers) &&
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
      const DeepCollectionEquality().hash(customleagueMembers),
      const DeepCollectionEquality().hash(leagueStartGameweek));

  @JsonKey(ignore: true)
  @override
  _$CustomLeaguesInfoCopyWith<_CustomLeaguesInfo> get copyWith =>
      __$CustomLeaguesInfoCopyWithImpl<_CustomLeaguesInfo>(this, _$identity);
}

abstract class _CustomLeaguesInfo implements CustomLeaguesInfo {
  const factory _CustomLeaguesInfo(
      {required LeagueId leagueId,
      required LeagueName leagueName,
      required LeagueType leagueType,
      required LeagueCode leagueCode,
      required AdminId adminId,
      required List<CustomLeagueMember> customleagueMembers,
      required LeagueStartGameweek leagueStartGameweek}) = _$_CustomLeaguesInfo;

  @override
  LeagueId get leagueId;
  @override
  LeagueName get leagueName;
  @override
  LeagueType get leagueType;
  @override
  LeagueCode get leagueCode;
  @override
  AdminId get adminId;
  @override
  List<CustomLeagueMember> get customleagueMembers;
  @override
  LeagueStartGameweek get leagueStartGameweek;
  @override
  @JsonKey(ignore: true)
  _$CustomLeaguesInfoCopyWith<_CustomLeaguesInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$CustomLeagueMemberTearOff {
  const _$CustomLeagueMemberTearOff();

  _CustomLeagueMember call(
      {required MemberId memberId,
      required MemberTeamName memberTeamName,
      required MemberPoints memberPoints}) {
    return _CustomLeagueMember(
      memberId: memberId,
      memberTeamName: memberTeamName,
      memberPoints: memberPoints,
    );
  }
}

/// @nodoc
const $CustomLeagueMember = _$CustomLeagueMemberTearOff();

/// @nodoc
mixin _$CustomLeagueMember {
  MemberId get memberId => throw _privateConstructorUsedError;
  MemberTeamName get memberTeamName => throw _privateConstructorUsedError;
  MemberPoints get memberPoints => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomLeagueMemberCopyWith<CustomLeagueMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomLeagueMemberCopyWith<$Res> {
  factory $CustomLeagueMemberCopyWith(
          CustomLeagueMember value, $Res Function(CustomLeagueMember) then) =
      _$CustomLeagueMemberCopyWithImpl<$Res>;
  $Res call(
      {MemberId memberId,
      MemberTeamName memberTeamName,
      MemberPoints memberPoints});
}

/// @nodoc
class _$CustomLeagueMemberCopyWithImpl<$Res>
    implements $CustomLeagueMemberCopyWith<$Res> {
  _$CustomLeagueMemberCopyWithImpl(this._value, this._then);

  final CustomLeagueMember _value;
  // ignore: unused_field
  final $Res Function(CustomLeagueMember) _then;

  @override
  $Res call({
    Object? memberId = freezed,
    Object? memberTeamName = freezed,
    Object? memberPoints = freezed,
  }) {
    return _then(_value.copyWith(
      memberId: memberId == freezed
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as MemberId,
      memberTeamName: memberTeamName == freezed
          ? _value.memberTeamName
          : memberTeamName // ignore: cast_nullable_to_non_nullable
              as MemberTeamName,
      memberPoints: memberPoints == freezed
          ? _value.memberPoints
          : memberPoints // ignore: cast_nullable_to_non_nullable
              as MemberPoints,
    ));
  }
}

/// @nodoc
abstract class _$CustomLeagueMemberCopyWith<$Res>
    implements $CustomLeagueMemberCopyWith<$Res> {
  factory _$CustomLeagueMemberCopyWith(
          _CustomLeagueMember value, $Res Function(_CustomLeagueMember) then) =
      __$CustomLeagueMemberCopyWithImpl<$Res>;
  @override
  $Res call(
      {MemberId memberId,
      MemberTeamName memberTeamName,
      MemberPoints memberPoints});
}

/// @nodoc
class __$CustomLeagueMemberCopyWithImpl<$Res>
    extends _$CustomLeagueMemberCopyWithImpl<$Res>
    implements _$CustomLeagueMemberCopyWith<$Res> {
  __$CustomLeagueMemberCopyWithImpl(
      _CustomLeagueMember _value, $Res Function(_CustomLeagueMember) _then)
      : super(_value, (v) => _then(v as _CustomLeagueMember));

  @override
  _CustomLeagueMember get _value => super._value as _CustomLeagueMember;

  @override
  $Res call({
    Object? memberId = freezed,
    Object? memberTeamName = freezed,
    Object? memberPoints = freezed,
  }) {
    return _then(_CustomLeagueMember(
      memberId: memberId == freezed
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as MemberId,
      memberTeamName: memberTeamName == freezed
          ? _value.memberTeamName
          : memberTeamName // ignore: cast_nullable_to_non_nullable
              as MemberTeamName,
      memberPoints: memberPoints == freezed
          ? _value.memberPoints
          : memberPoints // ignore: cast_nullable_to_non_nullable
              as MemberPoints,
    ));
  }
}

/// @nodoc

class _$_CustomLeagueMember implements _CustomLeagueMember {
  const _$_CustomLeagueMember(
      {required this.memberId,
      required this.memberTeamName,
      required this.memberPoints});

  @override
  final MemberId memberId;
  @override
  final MemberTeamName memberTeamName;
  @override
  final MemberPoints memberPoints;

  @override
  String toString() {
    return 'CustomLeagueMember(memberId: $memberId, memberTeamName: $memberTeamName, memberPoints: $memberPoints)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomLeagueMember &&
            const DeepCollectionEquality().equals(other.memberId, memberId) &&
            const DeepCollectionEquality()
                .equals(other.memberTeamName, memberTeamName) &&
            const DeepCollectionEquality()
                .equals(other.memberPoints, memberPoints));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(memberId),
      const DeepCollectionEquality().hash(memberTeamName),
      const DeepCollectionEquality().hash(memberPoints));

  @JsonKey(ignore: true)
  @override
  _$CustomLeagueMemberCopyWith<_CustomLeagueMember> get copyWith =>
      __$CustomLeagueMemberCopyWithImpl<_CustomLeagueMember>(this, _$identity);
}

abstract class _CustomLeagueMember implements CustomLeagueMember {
  const factory _CustomLeagueMember(
      {required MemberId memberId,
      required MemberTeamName memberTeamName,
      required MemberPoints memberPoints}) = _$_CustomLeagueMember;

  @override
  MemberId get memberId;
  @override
  MemberTeamName get memberTeamName;
  @override
  MemberPoints get memberPoints;
  @override
  @JsonKey(ignore: true)
  _$CustomLeagueMemberCopyWith<_CustomLeagueMember> get copyWith =>
      throw _privateConstructorUsedError;
}
