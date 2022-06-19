// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'efpl_stats_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EfplStatsEventTearOff {
  const _$EfplStatsEventTearOff();

  _GetEfplStats getEfplStats({required int gameWeekId}) {
    return _GetEfplStats(
      gameWeekId: gameWeekId,
    );
  }

  _IncreaseGameWeek increaseGameWeek() {
    return const _IncreaseGameWeek();
  }

  _DecreaseGameWeek decreaseGameWeek() {
    return const _DecreaseGameWeek();
  }
}

/// @nodoc
const $EfplStatsEvent = _$EfplStatsEventTearOff();

/// @nodoc
mixin _$EfplStatsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int gameWeekId) getEfplStats,
    required TResult Function() increaseGameWeek,
    required TResult Function() decreaseGameWeek,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int gameWeekId)? getEfplStats,
    TResult Function()? increaseGameWeek,
    TResult Function()? decreaseGameWeek,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int gameWeekId)? getEfplStats,
    TResult Function()? increaseGameWeek,
    TResult Function()? decreaseGameWeek,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetEfplStats value) getEfplStats,
    required TResult Function(_IncreaseGameWeek value) increaseGameWeek,
    required TResult Function(_DecreaseGameWeek value) decreaseGameWeek,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetEfplStats value)? getEfplStats,
    TResult Function(_IncreaseGameWeek value)? increaseGameWeek,
    TResult Function(_DecreaseGameWeek value)? decreaseGameWeek,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetEfplStats value)? getEfplStats,
    TResult Function(_IncreaseGameWeek value)? increaseGameWeek,
    TResult Function(_DecreaseGameWeek value)? decreaseGameWeek,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EfplStatsEventCopyWith<$Res> {
  factory $EfplStatsEventCopyWith(
          EfplStatsEvent value, $Res Function(EfplStatsEvent) then) =
      _$EfplStatsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$EfplStatsEventCopyWithImpl<$Res>
    implements $EfplStatsEventCopyWith<$Res> {
  _$EfplStatsEventCopyWithImpl(this._value, this._then);

  final EfplStatsEvent _value;
  // ignore: unused_field
  final $Res Function(EfplStatsEvent) _then;
}

/// @nodoc
abstract class _$GetEfplStatsCopyWith<$Res> {
  factory _$GetEfplStatsCopyWith(
          _GetEfplStats value, $Res Function(_GetEfplStats) then) =
      __$GetEfplStatsCopyWithImpl<$Res>;
  $Res call({int gameWeekId});
}

/// @nodoc
class __$GetEfplStatsCopyWithImpl<$Res>
    extends _$EfplStatsEventCopyWithImpl<$Res>
    implements _$GetEfplStatsCopyWith<$Res> {
  __$GetEfplStatsCopyWithImpl(
      _GetEfplStats _value, $Res Function(_GetEfplStats) _then)
      : super(_value, (v) => _then(v as _GetEfplStats));

  @override
  _GetEfplStats get _value => super._value as _GetEfplStats;

  @override
  $Res call({
    Object? gameWeekId = freezed,
  }) {
    return _then(_GetEfplStats(
      gameWeekId: gameWeekId == freezed
          ? _value.gameWeekId
          : gameWeekId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetEfplStats implements _GetEfplStats {
  const _$_GetEfplStats({required this.gameWeekId});

  @override
  final int gameWeekId;

  @override
  String toString() {
    return 'EfplStatsEvent.getEfplStats(gameWeekId: $gameWeekId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetEfplStats &&
            const DeepCollectionEquality()
                .equals(other.gameWeekId, gameWeekId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(gameWeekId));

  @JsonKey(ignore: true)
  @override
  _$GetEfplStatsCopyWith<_GetEfplStats> get copyWith =>
      __$GetEfplStatsCopyWithImpl<_GetEfplStats>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int gameWeekId) getEfplStats,
    required TResult Function() increaseGameWeek,
    required TResult Function() decreaseGameWeek,
  }) {
    return getEfplStats(gameWeekId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int gameWeekId)? getEfplStats,
    TResult Function()? increaseGameWeek,
    TResult Function()? decreaseGameWeek,
  }) {
    return getEfplStats?.call(gameWeekId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int gameWeekId)? getEfplStats,
    TResult Function()? increaseGameWeek,
    TResult Function()? decreaseGameWeek,
    required TResult orElse(),
  }) {
    if (getEfplStats != null) {
      return getEfplStats(gameWeekId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetEfplStats value) getEfplStats,
    required TResult Function(_IncreaseGameWeek value) increaseGameWeek,
    required TResult Function(_DecreaseGameWeek value) decreaseGameWeek,
  }) {
    return getEfplStats(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetEfplStats value)? getEfplStats,
    TResult Function(_IncreaseGameWeek value)? increaseGameWeek,
    TResult Function(_DecreaseGameWeek value)? decreaseGameWeek,
  }) {
    return getEfplStats?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetEfplStats value)? getEfplStats,
    TResult Function(_IncreaseGameWeek value)? increaseGameWeek,
    TResult Function(_DecreaseGameWeek value)? decreaseGameWeek,
    required TResult orElse(),
  }) {
    if (getEfplStats != null) {
      return getEfplStats(this);
    }
    return orElse();
  }
}

abstract class _GetEfplStats implements EfplStatsEvent {
  const factory _GetEfplStats({required int gameWeekId}) = _$_GetEfplStats;

  int get gameWeekId;
  @JsonKey(ignore: true)
  _$GetEfplStatsCopyWith<_GetEfplStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$IncreaseGameWeekCopyWith<$Res> {
  factory _$IncreaseGameWeekCopyWith(
          _IncreaseGameWeek value, $Res Function(_IncreaseGameWeek) then) =
      __$IncreaseGameWeekCopyWithImpl<$Res>;
}

/// @nodoc
class __$IncreaseGameWeekCopyWithImpl<$Res>
    extends _$EfplStatsEventCopyWithImpl<$Res>
    implements _$IncreaseGameWeekCopyWith<$Res> {
  __$IncreaseGameWeekCopyWithImpl(
      _IncreaseGameWeek _value, $Res Function(_IncreaseGameWeek) _then)
      : super(_value, (v) => _then(v as _IncreaseGameWeek));

  @override
  _IncreaseGameWeek get _value => super._value as _IncreaseGameWeek;
}

/// @nodoc

class _$_IncreaseGameWeek implements _IncreaseGameWeek {
  const _$_IncreaseGameWeek();

  @override
  String toString() {
    return 'EfplStatsEvent.increaseGameWeek()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _IncreaseGameWeek);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int gameWeekId) getEfplStats,
    required TResult Function() increaseGameWeek,
    required TResult Function() decreaseGameWeek,
  }) {
    return increaseGameWeek();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int gameWeekId)? getEfplStats,
    TResult Function()? increaseGameWeek,
    TResult Function()? decreaseGameWeek,
  }) {
    return increaseGameWeek?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int gameWeekId)? getEfplStats,
    TResult Function()? increaseGameWeek,
    TResult Function()? decreaseGameWeek,
    required TResult orElse(),
  }) {
    if (increaseGameWeek != null) {
      return increaseGameWeek();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetEfplStats value) getEfplStats,
    required TResult Function(_IncreaseGameWeek value) increaseGameWeek,
    required TResult Function(_DecreaseGameWeek value) decreaseGameWeek,
  }) {
    return increaseGameWeek(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetEfplStats value)? getEfplStats,
    TResult Function(_IncreaseGameWeek value)? increaseGameWeek,
    TResult Function(_DecreaseGameWeek value)? decreaseGameWeek,
  }) {
    return increaseGameWeek?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetEfplStats value)? getEfplStats,
    TResult Function(_IncreaseGameWeek value)? increaseGameWeek,
    TResult Function(_DecreaseGameWeek value)? decreaseGameWeek,
    required TResult orElse(),
  }) {
    if (increaseGameWeek != null) {
      return increaseGameWeek(this);
    }
    return orElse();
  }
}

abstract class _IncreaseGameWeek implements EfplStatsEvent {
  const factory _IncreaseGameWeek() = _$_IncreaseGameWeek;
}

/// @nodoc
abstract class _$DecreaseGameWeekCopyWith<$Res> {
  factory _$DecreaseGameWeekCopyWith(
          _DecreaseGameWeek value, $Res Function(_DecreaseGameWeek) then) =
      __$DecreaseGameWeekCopyWithImpl<$Res>;
}

/// @nodoc
class __$DecreaseGameWeekCopyWithImpl<$Res>
    extends _$EfplStatsEventCopyWithImpl<$Res>
    implements _$DecreaseGameWeekCopyWith<$Res> {
  __$DecreaseGameWeekCopyWithImpl(
      _DecreaseGameWeek _value, $Res Function(_DecreaseGameWeek) _then)
      : super(_value, (v) => _then(v as _DecreaseGameWeek));

  @override
  _DecreaseGameWeek get _value => super._value as _DecreaseGameWeek;
}

/// @nodoc

class _$_DecreaseGameWeek implements _DecreaseGameWeek {
  const _$_DecreaseGameWeek();

  @override
  String toString() {
    return 'EfplStatsEvent.decreaseGameWeek()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _DecreaseGameWeek);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int gameWeekId) getEfplStats,
    required TResult Function() increaseGameWeek,
    required TResult Function() decreaseGameWeek,
  }) {
    return decreaseGameWeek();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int gameWeekId)? getEfplStats,
    TResult Function()? increaseGameWeek,
    TResult Function()? decreaseGameWeek,
  }) {
    return decreaseGameWeek?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int gameWeekId)? getEfplStats,
    TResult Function()? increaseGameWeek,
    TResult Function()? decreaseGameWeek,
    required TResult orElse(),
  }) {
    if (decreaseGameWeek != null) {
      return decreaseGameWeek();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetEfplStats value) getEfplStats,
    required TResult Function(_IncreaseGameWeek value) increaseGameWeek,
    required TResult Function(_DecreaseGameWeek value) decreaseGameWeek,
  }) {
    return decreaseGameWeek(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetEfplStats value)? getEfplStats,
    TResult Function(_IncreaseGameWeek value)? increaseGameWeek,
    TResult Function(_DecreaseGameWeek value)? decreaseGameWeek,
  }) {
    return decreaseGameWeek?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetEfplStats value)? getEfplStats,
    TResult Function(_IncreaseGameWeek value)? increaseGameWeek,
    TResult Function(_DecreaseGameWeek value)? decreaseGameWeek,
    required TResult orElse(),
  }) {
    if (decreaseGameWeek != null) {
      return decreaseGameWeek(this);
    }
    return orElse();
  }
}

abstract class _DecreaseGameWeek implements EfplStatsEvent {
  const factory _DecreaseGameWeek() = _$_DecreaseGameWeek;
}

/// @nodoc
class _$EfplStatsStateTearOff {
  const _$EfplStatsStateTearOff();

  _EfplState call(
      {required int highestPoint,
      required int averagePoint,
      required String mostSelectedPlayer,
      required String mostTransferredOutPlayer,
      required int transfersMadeCount,
      required String mostCaptainedPlayer,
      required String mostViceCaptainedPlayer,
      required int benchBoostCount,
      required int freeHitCount,
      required int wildCardCount,
      required int tripleCaptainCount,
      required Map<dynamic, dynamic> dreamTeam,
      required bool isLoading,
      required int gameWeekId,
      required int maxActiveCount,
      required Option<Either<dynamic, dynamic>> valueFailureOrSuccess}) {
    return _EfplState(
      highestPoint: highestPoint,
      averagePoint: averagePoint,
      mostSelectedPlayer: mostSelectedPlayer,
      mostTransferredOutPlayer: mostTransferredOutPlayer,
      transfersMadeCount: transfersMadeCount,
      mostCaptainedPlayer: mostCaptainedPlayer,
      mostViceCaptainedPlayer: mostViceCaptainedPlayer,
      benchBoostCount: benchBoostCount,
      freeHitCount: freeHitCount,
      wildCardCount: wildCardCount,
      tripleCaptainCount: tripleCaptainCount,
      dreamTeam: dreamTeam,
      isLoading: isLoading,
      gameWeekId: gameWeekId,
      maxActiveCount: maxActiveCount,
      valueFailureOrSuccess: valueFailureOrSuccess,
    );
  }
}

/// @nodoc
const $EfplStatsState = _$EfplStatsStateTearOff();

/// @nodoc
mixin _$EfplStatsState {
  int get highestPoint => throw _privateConstructorUsedError;
  int get averagePoint => throw _privateConstructorUsedError;
  String get mostSelectedPlayer => throw _privateConstructorUsedError;
  String get mostTransferredOutPlayer => throw _privateConstructorUsedError;
  int get transfersMadeCount => throw _privateConstructorUsedError;
  String get mostCaptainedPlayer => throw _privateConstructorUsedError;
  String get mostViceCaptainedPlayer => throw _privateConstructorUsedError;
  int get benchBoostCount => throw _privateConstructorUsedError;
  int get freeHitCount => throw _privateConstructorUsedError;
  int get wildCardCount => throw _privateConstructorUsedError;
  int get tripleCaptainCount => throw _privateConstructorUsedError;
  Map<dynamic, dynamic> get dreamTeam => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  int get gameWeekId => throw _privateConstructorUsedError;
  int get maxActiveCount => throw _privateConstructorUsedError;
  Option<Either<dynamic, dynamic>> get valueFailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EfplStatsStateCopyWith<EfplStatsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EfplStatsStateCopyWith<$Res> {
  factory $EfplStatsStateCopyWith(
          EfplStatsState value, $Res Function(EfplStatsState) then) =
      _$EfplStatsStateCopyWithImpl<$Res>;
  $Res call(
      {int highestPoint,
      int averagePoint,
      String mostSelectedPlayer,
      String mostTransferredOutPlayer,
      int transfersMadeCount,
      String mostCaptainedPlayer,
      String mostViceCaptainedPlayer,
      int benchBoostCount,
      int freeHitCount,
      int wildCardCount,
      int tripleCaptainCount,
      Map<dynamic, dynamic> dreamTeam,
      bool isLoading,
      int gameWeekId,
      int maxActiveCount,
      Option<Either<dynamic, dynamic>> valueFailureOrSuccess});
}

/// @nodoc
class _$EfplStatsStateCopyWithImpl<$Res>
    implements $EfplStatsStateCopyWith<$Res> {
  _$EfplStatsStateCopyWithImpl(this._value, this._then);

  final EfplStatsState _value;
  // ignore: unused_field
  final $Res Function(EfplStatsState) _then;

  @override
  $Res call({
    Object? highestPoint = freezed,
    Object? averagePoint = freezed,
    Object? mostSelectedPlayer = freezed,
    Object? mostTransferredOutPlayer = freezed,
    Object? transfersMadeCount = freezed,
    Object? mostCaptainedPlayer = freezed,
    Object? mostViceCaptainedPlayer = freezed,
    Object? benchBoostCount = freezed,
    Object? freeHitCount = freezed,
    Object? wildCardCount = freezed,
    Object? tripleCaptainCount = freezed,
    Object? dreamTeam = freezed,
    Object? isLoading = freezed,
    Object? gameWeekId = freezed,
    Object? maxActiveCount = freezed,
    Object? valueFailureOrSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      highestPoint: highestPoint == freezed
          ? _value.highestPoint
          : highestPoint // ignore: cast_nullable_to_non_nullable
              as int,
      averagePoint: averagePoint == freezed
          ? _value.averagePoint
          : averagePoint // ignore: cast_nullable_to_non_nullable
              as int,
      mostSelectedPlayer: mostSelectedPlayer == freezed
          ? _value.mostSelectedPlayer
          : mostSelectedPlayer // ignore: cast_nullable_to_non_nullable
              as String,
      mostTransferredOutPlayer: mostTransferredOutPlayer == freezed
          ? _value.mostTransferredOutPlayer
          : mostTransferredOutPlayer // ignore: cast_nullable_to_non_nullable
              as String,
      transfersMadeCount: transfersMadeCount == freezed
          ? _value.transfersMadeCount
          : transfersMadeCount // ignore: cast_nullable_to_non_nullable
              as int,
      mostCaptainedPlayer: mostCaptainedPlayer == freezed
          ? _value.mostCaptainedPlayer
          : mostCaptainedPlayer // ignore: cast_nullable_to_non_nullable
              as String,
      mostViceCaptainedPlayer: mostViceCaptainedPlayer == freezed
          ? _value.mostViceCaptainedPlayer
          : mostViceCaptainedPlayer // ignore: cast_nullable_to_non_nullable
              as String,
      benchBoostCount: benchBoostCount == freezed
          ? _value.benchBoostCount
          : benchBoostCount // ignore: cast_nullable_to_non_nullable
              as int,
      freeHitCount: freeHitCount == freezed
          ? _value.freeHitCount
          : freeHitCount // ignore: cast_nullable_to_non_nullable
              as int,
      wildCardCount: wildCardCount == freezed
          ? _value.wildCardCount
          : wildCardCount // ignore: cast_nullable_to_non_nullable
              as int,
      tripleCaptainCount: tripleCaptainCount == freezed
          ? _value.tripleCaptainCount
          : tripleCaptainCount // ignore: cast_nullable_to_non_nullable
              as int,
      dreamTeam: dreamTeam == freezed
          ? _value.dreamTeam
          : dreamTeam // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      gameWeekId: gameWeekId == freezed
          ? _value.gameWeekId
          : gameWeekId // ignore: cast_nullable_to_non_nullable
              as int,
      maxActiveCount: maxActiveCount == freezed
          ? _value.maxActiveCount
          : maxActiveCount // ignore: cast_nullable_to_non_nullable
              as int,
      valueFailureOrSuccess: valueFailureOrSuccess == freezed
          ? _value.valueFailureOrSuccess
          : valueFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<dynamic, dynamic>>,
    ));
  }
}

/// @nodoc
abstract class _$EfplStateCopyWith<$Res>
    implements $EfplStatsStateCopyWith<$Res> {
  factory _$EfplStateCopyWith(
          _EfplState value, $Res Function(_EfplState) then) =
      __$EfplStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int highestPoint,
      int averagePoint,
      String mostSelectedPlayer,
      String mostTransferredOutPlayer,
      int transfersMadeCount,
      String mostCaptainedPlayer,
      String mostViceCaptainedPlayer,
      int benchBoostCount,
      int freeHitCount,
      int wildCardCount,
      int tripleCaptainCount,
      Map<dynamic, dynamic> dreamTeam,
      bool isLoading,
      int gameWeekId,
      int maxActiveCount,
      Option<Either<dynamic, dynamic>> valueFailureOrSuccess});
}

/// @nodoc
class __$EfplStateCopyWithImpl<$Res> extends _$EfplStatsStateCopyWithImpl<$Res>
    implements _$EfplStateCopyWith<$Res> {
  __$EfplStateCopyWithImpl(_EfplState _value, $Res Function(_EfplState) _then)
      : super(_value, (v) => _then(v as _EfplState));

  @override
  _EfplState get _value => super._value as _EfplState;

  @override
  $Res call({
    Object? highestPoint = freezed,
    Object? averagePoint = freezed,
    Object? mostSelectedPlayer = freezed,
    Object? mostTransferredOutPlayer = freezed,
    Object? transfersMadeCount = freezed,
    Object? mostCaptainedPlayer = freezed,
    Object? mostViceCaptainedPlayer = freezed,
    Object? benchBoostCount = freezed,
    Object? freeHitCount = freezed,
    Object? wildCardCount = freezed,
    Object? tripleCaptainCount = freezed,
    Object? dreamTeam = freezed,
    Object? isLoading = freezed,
    Object? gameWeekId = freezed,
    Object? maxActiveCount = freezed,
    Object? valueFailureOrSuccess = freezed,
  }) {
    return _then(_EfplState(
      highestPoint: highestPoint == freezed
          ? _value.highestPoint
          : highestPoint // ignore: cast_nullable_to_non_nullable
              as int,
      averagePoint: averagePoint == freezed
          ? _value.averagePoint
          : averagePoint // ignore: cast_nullable_to_non_nullable
              as int,
      mostSelectedPlayer: mostSelectedPlayer == freezed
          ? _value.mostSelectedPlayer
          : mostSelectedPlayer // ignore: cast_nullable_to_non_nullable
              as String,
      mostTransferredOutPlayer: mostTransferredOutPlayer == freezed
          ? _value.mostTransferredOutPlayer
          : mostTransferredOutPlayer // ignore: cast_nullable_to_non_nullable
              as String,
      transfersMadeCount: transfersMadeCount == freezed
          ? _value.transfersMadeCount
          : transfersMadeCount // ignore: cast_nullable_to_non_nullable
              as int,
      mostCaptainedPlayer: mostCaptainedPlayer == freezed
          ? _value.mostCaptainedPlayer
          : mostCaptainedPlayer // ignore: cast_nullable_to_non_nullable
              as String,
      mostViceCaptainedPlayer: mostViceCaptainedPlayer == freezed
          ? _value.mostViceCaptainedPlayer
          : mostViceCaptainedPlayer // ignore: cast_nullable_to_non_nullable
              as String,
      benchBoostCount: benchBoostCount == freezed
          ? _value.benchBoostCount
          : benchBoostCount // ignore: cast_nullable_to_non_nullable
              as int,
      freeHitCount: freeHitCount == freezed
          ? _value.freeHitCount
          : freeHitCount // ignore: cast_nullable_to_non_nullable
              as int,
      wildCardCount: wildCardCount == freezed
          ? _value.wildCardCount
          : wildCardCount // ignore: cast_nullable_to_non_nullable
              as int,
      tripleCaptainCount: tripleCaptainCount == freezed
          ? _value.tripleCaptainCount
          : tripleCaptainCount // ignore: cast_nullable_to_non_nullable
              as int,
      dreamTeam: dreamTeam == freezed
          ? _value.dreamTeam
          : dreamTeam // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      gameWeekId: gameWeekId == freezed
          ? _value.gameWeekId
          : gameWeekId // ignore: cast_nullable_to_non_nullable
              as int,
      maxActiveCount: maxActiveCount == freezed
          ? _value.maxActiveCount
          : maxActiveCount // ignore: cast_nullable_to_non_nullable
              as int,
      valueFailureOrSuccess: valueFailureOrSuccess == freezed
          ? _value.valueFailureOrSuccess
          : valueFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<dynamic, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_EfplState implements _EfplState {
  const _$_EfplState(
      {required this.highestPoint,
      required this.averagePoint,
      required this.mostSelectedPlayer,
      required this.mostTransferredOutPlayer,
      required this.transfersMadeCount,
      required this.mostCaptainedPlayer,
      required this.mostViceCaptainedPlayer,
      required this.benchBoostCount,
      required this.freeHitCount,
      required this.wildCardCount,
      required this.tripleCaptainCount,
      required this.dreamTeam,
      required this.isLoading,
      required this.gameWeekId,
      required this.maxActiveCount,
      required this.valueFailureOrSuccess});

  @override
  final int highestPoint;
  @override
  final int averagePoint;
  @override
  final String mostSelectedPlayer;
  @override
  final String mostTransferredOutPlayer;
  @override
  final int transfersMadeCount;
  @override
  final String mostCaptainedPlayer;
  @override
  final String mostViceCaptainedPlayer;
  @override
  final int benchBoostCount;
  @override
  final int freeHitCount;
  @override
  final int wildCardCount;
  @override
  final int tripleCaptainCount;
  @override
  final Map<dynamic, dynamic> dreamTeam;
  @override
  final bool isLoading;
  @override
  final int gameWeekId;
  @override
  final int maxActiveCount;
  @override
  final Option<Either<dynamic, dynamic>> valueFailureOrSuccess;

  @override
  String toString() {
    return 'EfplStatsState(highestPoint: $highestPoint, averagePoint: $averagePoint, mostSelectedPlayer: $mostSelectedPlayer, mostTransferredOutPlayer: $mostTransferredOutPlayer, transfersMadeCount: $transfersMadeCount, mostCaptainedPlayer: $mostCaptainedPlayer, mostViceCaptainedPlayer: $mostViceCaptainedPlayer, benchBoostCount: $benchBoostCount, freeHitCount: $freeHitCount, wildCardCount: $wildCardCount, tripleCaptainCount: $tripleCaptainCount, dreamTeam: $dreamTeam, isLoading: $isLoading, gameWeekId: $gameWeekId, maxActiveCount: $maxActiveCount, valueFailureOrSuccess: $valueFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EfplState &&
            const DeepCollectionEquality()
                .equals(other.highestPoint, highestPoint) &&
            const DeepCollectionEquality()
                .equals(other.averagePoint, averagePoint) &&
            const DeepCollectionEquality()
                .equals(other.mostSelectedPlayer, mostSelectedPlayer) &&
            const DeepCollectionEquality().equals(
                other.mostTransferredOutPlayer, mostTransferredOutPlayer) &&
            const DeepCollectionEquality()
                .equals(other.transfersMadeCount, transfersMadeCount) &&
            const DeepCollectionEquality()
                .equals(other.mostCaptainedPlayer, mostCaptainedPlayer) &&
            const DeepCollectionEquality().equals(
                other.mostViceCaptainedPlayer, mostViceCaptainedPlayer) &&
            const DeepCollectionEquality()
                .equals(other.benchBoostCount, benchBoostCount) &&
            const DeepCollectionEquality()
                .equals(other.freeHitCount, freeHitCount) &&
            const DeepCollectionEquality()
                .equals(other.wildCardCount, wildCardCount) &&
            const DeepCollectionEquality()
                .equals(other.tripleCaptainCount, tripleCaptainCount) &&
            const DeepCollectionEquality().equals(other.dreamTeam, dreamTeam) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.gameWeekId, gameWeekId) &&
            const DeepCollectionEquality()
                .equals(other.maxActiveCount, maxActiveCount) &&
            const DeepCollectionEquality()
                .equals(other.valueFailureOrSuccess, valueFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(highestPoint),
      const DeepCollectionEquality().hash(averagePoint),
      const DeepCollectionEquality().hash(mostSelectedPlayer),
      const DeepCollectionEquality().hash(mostTransferredOutPlayer),
      const DeepCollectionEquality().hash(transfersMadeCount),
      const DeepCollectionEquality().hash(mostCaptainedPlayer),
      const DeepCollectionEquality().hash(mostViceCaptainedPlayer),
      const DeepCollectionEquality().hash(benchBoostCount),
      const DeepCollectionEquality().hash(freeHitCount),
      const DeepCollectionEquality().hash(wildCardCount),
      const DeepCollectionEquality().hash(tripleCaptainCount),
      const DeepCollectionEquality().hash(dreamTeam),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(gameWeekId),
      const DeepCollectionEquality().hash(maxActiveCount),
      const DeepCollectionEquality().hash(valueFailureOrSuccess));

  @JsonKey(ignore: true)
  @override
  _$EfplStateCopyWith<_EfplState> get copyWith =>
      __$EfplStateCopyWithImpl<_EfplState>(this, _$identity);
}

abstract class _EfplState implements EfplStatsState {
  const factory _EfplState(
          {required int highestPoint,
          required int averagePoint,
          required String mostSelectedPlayer,
          required String mostTransferredOutPlayer,
          required int transfersMadeCount,
          required String mostCaptainedPlayer,
          required String mostViceCaptainedPlayer,
          required int benchBoostCount,
          required int freeHitCount,
          required int wildCardCount,
          required int tripleCaptainCount,
          required Map<dynamic, dynamic> dreamTeam,
          required bool isLoading,
          required int gameWeekId,
          required int maxActiveCount,
          required Option<Either<dynamic, dynamic>> valueFailureOrSuccess}) =
      _$_EfplState;

  @override
  int get highestPoint;
  @override
  int get averagePoint;
  @override
  String get mostSelectedPlayer;
  @override
  String get mostTransferredOutPlayer;
  @override
  int get transfersMadeCount;
  @override
  String get mostCaptainedPlayer;
  @override
  String get mostViceCaptainedPlayer;
  @override
  int get benchBoostCount;
  @override
  int get freeHitCount;
  @override
  int get wildCardCount;
  @override
  int get tripleCaptainCount;
  @override
  Map<dynamic, dynamic> get dreamTeam;
  @override
  bool get isLoading;
  @override
  int get gameWeekId;
  @override
  int get maxActiveCount;
  @override
  Option<Either<dynamic, dynamic>> get valueFailureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$EfplStateCopyWith<_EfplState> get copyWith =>
      throw _privateConstructorUsedError;
}
