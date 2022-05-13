// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_players_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserPlayerFailureTearOff {
  const _$UserPlayerFailureTearOff();

  Empty<T> empty<T>({required String failedValue}) {
    return Empty<T>(
      failedValue: failedValue,
    );
  }

  ExceededPrice<T> exceededPrice<T>({required String failedValue}) {
    return ExceededPrice<T>(
      failedValue: failedValue,
    );
  }

  ExceededTeamCount<T> exceededTeamCount<T>({required String failedValue}) {
    return ExceededTeamCount<T>(
      failedValue: failedValue,
    );
  }

  IncompleteTeam<T> incompleteTeam<T>({required String failedValue}) {
    return IncompleteTeam<T>(
      failedValue: failedValue,
    );
  }

  DeadlinePassed<T> deadlinePassed<T>({required String failedValue}) {
    return DeadlinePassed<T>(
      failedValue: failedValue,
    );
  }
}

/// @nodoc
const $UserPlayerFailure = _$UserPlayerFailureTearOff();

/// @nodoc
mixin _$UserPlayerFailure<T> {
  String get failedValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) empty,
    required TResult Function(String failedValue) exceededPrice,
    required TResult Function(String failedValue) exceededTeamCount,
    required TResult Function(String failedValue) incompleteTeam,
    required TResult Function(String failedValue) deadlinePassed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? empty,
    TResult Function(String failedValue)? exceededPrice,
    TResult Function(String failedValue)? exceededTeamCount,
    TResult Function(String failedValue)? incompleteTeam,
    TResult Function(String failedValue)? deadlinePassed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? empty,
    TResult Function(String failedValue)? exceededPrice,
    TResult Function(String failedValue)? exceededTeamCount,
    TResult Function(String failedValue)? incompleteTeam,
    TResult Function(String failedValue)? deadlinePassed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty<T> value) empty,
    required TResult Function(ExceededPrice<T> value) exceededPrice,
    required TResult Function(ExceededTeamCount<T> value) exceededTeamCount,
    required TResult Function(IncompleteTeam<T> value) incompleteTeam,
    required TResult Function(DeadlinePassed<T> value) deadlinePassed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceededPrice<T> value)? exceededPrice,
    TResult Function(ExceededTeamCount<T> value)? exceededTeamCount,
    TResult Function(IncompleteTeam<T> value)? incompleteTeam,
    TResult Function(DeadlinePassed<T> value)? deadlinePassed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceededPrice<T> value)? exceededPrice,
    TResult Function(ExceededTeamCount<T> value)? exceededTeamCount,
    TResult Function(IncompleteTeam<T> value)? incompleteTeam,
    TResult Function(DeadlinePassed<T> value)? deadlinePassed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserPlayerFailureCopyWith<T, UserPlayerFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPlayerFailureCopyWith<T, $Res> {
  factory $UserPlayerFailureCopyWith(UserPlayerFailure<T> value,
          $Res Function(UserPlayerFailure<T>) then) =
      _$UserPlayerFailureCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class _$UserPlayerFailureCopyWithImpl<T, $Res>
    implements $UserPlayerFailureCopyWith<T, $Res> {
  _$UserPlayerFailureCopyWithImpl(this._value, this._then);

  final UserPlayerFailure<T> _value;
  // ignore: unused_field
  final $Res Function(UserPlayerFailure<T>) _then;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $EmptyCopyWith<T, $Res>
    implements $UserPlayerFailureCopyWith<T, $Res> {
  factory $EmptyCopyWith(Empty<T> value, $Res Function(Empty<T>) then) =
      _$EmptyCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class _$EmptyCopyWithImpl<T, $Res>
    extends _$UserPlayerFailureCopyWithImpl<T, $Res>
    implements $EmptyCopyWith<T, $Res> {
  _$EmptyCopyWithImpl(Empty<T> _value, $Res Function(Empty<T>) _then)
      : super(_value, (v) => _then(v as Empty<T>));

  @override
  Empty<T> get _value => super._value as Empty<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(Empty<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Empty<T> implements Empty<T> {
  const _$Empty({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'UserPlayerFailure<$T>.empty(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Empty<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $EmptyCopyWith<T, Empty<T>> get copyWith =>
      _$EmptyCopyWithImpl<T, Empty<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) empty,
    required TResult Function(String failedValue) exceededPrice,
    required TResult Function(String failedValue) exceededTeamCount,
    required TResult Function(String failedValue) incompleteTeam,
    required TResult Function(String failedValue) deadlinePassed,
  }) {
    return empty(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? empty,
    TResult Function(String failedValue)? exceededPrice,
    TResult Function(String failedValue)? exceededTeamCount,
    TResult Function(String failedValue)? incompleteTeam,
    TResult Function(String failedValue)? deadlinePassed,
  }) {
    return empty?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? empty,
    TResult Function(String failedValue)? exceededPrice,
    TResult Function(String failedValue)? exceededTeamCount,
    TResult Function(String failedValue)? incompleteTeam,
    TResult Function(String failedValue)? deadlinePassed,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty<T> value) empty,
    required TResult Function(ExceededPrice<T> value) exceededPrice,
    required TResult Function(ExceededTeamCount<T> value) exceededTeamCount,
    required TResult Function(IncompleteTeam<T> value) incompleteTeam,
    required TResult Function(DeadlinePassed<T> value) deadlinePassed,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceededPrice<T> value)? exceededPrice,
    TResult Function(ExceededTeamCount<T> value)? exceededTeamCount,
    TResult Function(IncompleteTeam<T> value)? incompleteTeam,
    TResult Function(DeadlinePassed<T> value)? deadlinePassed,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceededPrice<T> value)? exceededPrice,
    TResult Function(ExceededTeamCount<T> value)? exceededTeamCount,
    TResult Function(IncompleteTeam<T> value)? incompleteTeam,
    TResult Function(DeadlinePassed<T> value)? deadlinePassed,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty<T> implements UserPlayerFailure<T> {
  const factory Empty({required String failedValue}) = _$Empty<T>;

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  $EmptyCopyWith<T, Empty<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExceededPriceCopyWith<T, $Res>
    implements $UserPlayerFailureCopyWith<T, $Res> {
  factory $ExceededPriceCopyWith(
          ExceededPrice<T> value, $Res Function(ExceededPrice<T>) then) =
      _$ExceededPriceCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class _$ExceededPriceCopyWithImpl<T, $Res>
    extends _$UserPlayerFailureCopyWithImpl<T, $Res>
    implements $ExceededPriceCopyWith<T, $Res> {
  _$ExceededPriceCopyWithImpl(
      ExceededPrice<T> _value, $Res Function(ExceededPrice<T>) _then)
      : super(_value, (v) => _then(v as ExceededPrice<T>));

  @override
  ExceededPrice<T> get _value => super._value as ExceededPrice<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(ExceededPrice<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ExceededPrice<T> implements ExceededPrice<T> {
  const _$ExceededPrice({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'UserPlayerFailure<$T>.exceededPrice(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExceededPrice<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $ExceededPriceCopyWith<T, ExceededPrice<T>> get copyWith =>
      _$ExceededPriceCopyWithImpl<T, ExceededPrice<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) empty,
    required TResult Function(String failedValue) exceededPrice,
    required TResult Function(String failedValue) exceededTeamCount,
    required TResult Function(String failedValue) incompleteTeam,
    required TResult Function(String failedValue) deadlinePassed,
  }) {
    return exceededPrice(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? empty,
    TResult Function(String failedValue)? exceededPrice,
    TResult Function(String failedValue)? exceededTeamCount,
    TResult Function(String failedValue)? incompleteTeam,
    TResult Function(String failedValue)? deadlinePassed,
  }) {
    return exceededPrice?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? empty,
    TResult Function(String failedValue)? exceededPrice,
    TResult Function(String failedValue)? exceededTeamCount,
    TResult Function(String failedValue)? incompleteTeam,
    TResult Function(String failedValue)? deadlinePassed,
    required TResult orElse(),
  }) {
    if (exceededPrice != null) {
      return exceededPrice(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty<T> value) empty,
    required TResult Function(ExceededPrice<T> value) exceededPrice,
    required TResult Function(ExceededTeamCount<T> value) exceededTeamCount,
    required TResult Function(IncompleteTeam<T> value) incompleteTeam,
    required TResult Function(DeadlinePassed<T> value) deadlinePassed,
  }) {
    return exceededPrice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceededPrice<T> value)? exceededPrice,
    TResult Function(ExceededTeamCount<T> value)? exceededTeamCount,
    TResult Function(IncompleteTeam<T> value)? incompleteTeam,
    TResult Function(DeadlinePassed<T> value)? deadlinePassed,
  }) {
    return exceededPrice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceededPrice<T> value)? exceededPrice,
    TResult Function(ExceededTeamCount<T> value)? exceededTeamCount,
    TResult Function(IncompleteTeam<T> value)? incompleteTeam,
    TResult Function(DeadlinePassed<T> value)? deadlinePassed,
    required TResult orElse(),
  }) {
    if (exceededPrice != null) {
      return exceededPrice(this);
    }
    return orElse();
  }
}

abstract class ExceededPrice<T> implements UserPlayerFailure<T> {
  const factory ExceededPrice({required String failedValue}) =
      _$ExceededPrice<T>;

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  $ExceededPriceCopyWith<T, ExceededPrice<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExceededTeamCountCopyWith<T, $Res>
    implements $UserPlayerFailureCopyWith<T, $Res> {
  factory $ExceededTeamCountCopyWith(ExceededTeamCount<T> value,
          $Res Function(ExceededTeamCount<T>) then) =
      _$ExceededTeamCountCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class _$ExceededTeamCountCopyWithImpl<T, $Res>
    extends _$UserPlayerFailureCopyWithImpl<T, $Res>
    implements $ExceededTeamCountCopyWith<T, $Res> {
  _$ExceededTeamCountCopyWithImpl(
      ExceededTeamCount<T> _value, $Res Function(ExceededTeamCount<T>) _then)
      : super(_value, (v) => _then(v as ExceededTeamCount<T>));

  @override
  ExceededTeamCount<T> get _value => super._value as ExceededTeamCount<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(ExceededTeamCount<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ExceededTeamCount<T> implements ExceededTeamCount<T> {
  const _$ExceededTeamCount({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'UserPlayerFailure<$T>.exceededTeamCount(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExceededTeamCount<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $ExceededTeamCountCopyWith<T, ExceededTeamCount<T>> get copyWith =>
      _$ExceededTeamCountCopyWithImpl<T, ExceededTeamCount<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) empty,
    required TResult Function(String failedValue) exceededPrice,
    required TResult Function(String failedValue) exceededTeamCount,
    required TResult Function(String failedValue) incompleteTeam,
    required TResult Function(String failedValue) deadlinePassed,
  }) {
    return exceededTeamCount(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? empty,
    TResult Function(String failedValue)? exceededPrice,
    TResult Function(String failedValue)? exceededTeamCount,
    TResult Function(String failedValue)? incompleteTeam,
    TResult Function(String failedValue)? deadlinePassed,
  }) {
    return exceededTeamCount?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? empty,
    TResult Function(String failedValue)? exceededPrice,
    TResult Function(String failedValue)? exceededTeamCount,
    TResult Function(String failedValue)? incompleteTeam,
    TResult Function(String failedValue)? deadlinePassed,
    required TResult orElse(),
  }) {
    if (exceededTeamCount != null) {
      return exceededTeamCount(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty<T> value) empty,
    required TResult Function(ExceededPrice<T> value) exceededPrice,
    required TResult Function(ExceededTeamCount<T> value) exceededTeamCount,
    required TResult Function(IncompleteTeam<T> value) incompleteTeam,
    required TResult Function(DeadlinePassed<T> value) deadlinePassed,
  }) {
    return exceededTeamCount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceededPrice<T> value)? exceededPrice,
    TResult Function(ExceededTeamCount<T> value)? exceededTeamCount,
    TResult Function(IncompleteTeam<T> value)? incompleteTeam,
    TResult Function(DeadlinePassed<T> value)? deadlinePassed,
  }) {
    return exceededTeamCount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceededPrice<T> value)? exceededPrice,
    TResult Function(ExceededTeamCount<T> value)? exceededTeamCount,
    TResult Function(IncompleteTeam<T> value)? incompleteTeam,
    TResult Function(DeadlinePassed<T> value)? deadlinePassed,
    required TResult orElse(),
  }) {
    if (exceededTeamCount != null) {
      return exceededTeamCount(this);
    }
    return orElse();
  }
}

abstract class ExceededTeamCount<T> implements UserPlayerFailure<T> {
  const factory ExceededTeamCount({required String failedValue}) =
      _$ExceededTeamCount<T>;

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  $ExceededTeamCountCopyWith<T, ExceededTeamCount<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncompleteTeamCopyWith<T, $Res>
    implements $UserPlayerFailureCopyWith<T, $Res> {
  factory $IncompleteTeamCopyWith(
          IncompleteTeam<T> value, $Res Function(IncompleteTeam<T>) then) =
      _$IncompleteTeamCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class _$IncompleteTeamCopyWithImpl<T, $Res>
    extends _$UserPlayerFailureCopyWithImpl<T, $Res>
    implements $IncompleteTeamCopyWith<T, $Res> {
  _$IncompleteTeamCopyWithImpl(
      IncompleteTeam<T> _value, $Res Function(IncompleteTeam<T>) _then)
      : super(_value, (v) => _then(v as IncompleteTeam<T>));

  @override
  IncompleteTeam<T> get _value => super._value as IncompleteTeam<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(IncompleteTeam<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$IncompleteTeam<T> implements IncompleteTeam<T> {
  const _$IncompleteTeam({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'UserPlayerFailure<$T>.incompleteTeam(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IncompleteTeam<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $IncompleteTeamCopyWith<T, IncompleteTeam<T>> get copyWith =>
      _$IncompleteTeamCopyWithImpl<T, IncompleteTeam<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) empty,
    required TResult Function(String failedValue) exceededPrice,
    required TResult Function(String failedValue) exceededTeamCount,
    required TResult Function(String failedValue) incompleteTeam,
    required TResult Function(String failedValue) deadlinePassed,
  }) {
    return incompleteTeam(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? empty,
    TResult Function(String failedValue)? exceededPrice,
    TResult Function(String failedValue)? exceededTeamCount,
    TResult Function(String failedValue)? incompleteTeam,
    TResult Function(String failedValue)? deadlinePassed,
  }) {
    return incompleteTeam?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? empty,
    TResult Function(String failedValue)? exceededPrice,
    TResult Function(String failedValue)? exceededTeamCount,
    TResult Function(String failedValue)? incompleteTeam,
    TResult Function(String failedValue)? deadlinePassed,
    required TResult orElse(),
  }) {
    if (incompleteTeam != null) {
      return incompleteTeam(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty<T> value) empty,
    required TResult Function(ExceededPrice<T> value) exceededPrice,
    required TResult Function(ExceededTeamCount<T> value) exceededTeamCount,
    required TResult Function(IncompleteTeam<T> value) incompleteTeam,
    required TResult Function(DeadlinePassed<T> value) deadlinePassed,
  }) {
    return incompleteTeam(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceededPrice<T> value)? exceededPrice,
    TResult Function(ExceededTeamCount<T> value)? exceededTeamCount,
    TResult Function(IncompleteTeam<T> value)? incompleteTeam,
    TResult Function(DeadlinePassed<T> value)? deadlinePassed,
  }) {
    return incompleteTeam?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceededPrice<T> value)? exceededPrice,
    TResult Function(ExceededTeamCount<T> value)? exceededTeamCount,
    TResult Function(IncompleteTeam<T> value)? incompleteTeam,
    TResult Function(DeadlinePassed<T> value)? deadlinePassed,
    required TResult orElse(),
  }) {
    if (incompleteTeam != null) {
      return incompleteTeam(this);
    }
    return orElse();
  }
}

abstract class IncompleteTeam<T> implements UserPlayerFailure<T> {
  const factory IncompleteTeam({required String failedValue}) =
      _$IncompleteTeam<T>;

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  $IncompleteTeamCopyWith<T, IncompleteTeam<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeadlinePassedCopyWith<T, $Res>
    implements $UserPlayerFailureCopyWith<T, $Res> {
  factory $DeadlinePassedCopyWith(
          DeadlinePassed<T> value, $Res Function(DeadlinePassed<T>) then) =
      _$DeadlinePassedCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class _$DeadlinePassedCopyWithImpl<T, $Res>
    extends _$UserPlayerFailureCopyWithImpl<T, $Res>
    implements $DeadlinePassedCopyWith<T, $Res> {
  _$DeadlinePassedCopyWithImpl(
      DeadlinePassed<T> _value, $Res Function(DeadlinePassed<T>) _then)
      : super(_value, (v) => _then(v as DeadlinePassed<T>));

  @override
  DeadlinePassed<T> get _value => super._value as DeadlinePassed<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(DeadlinePassed<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeadlinePassed<T> implements DeadlinePassed<T> {
  const _$DeadlinePassed({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'UserPlayerFailure<$T>.deadlinePassed(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeadlinePassed<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $DeadlinePassedCopyWith<T, DeadlinePassed<T>> get copyWith =>
      _$DeadlinePassedCopyWithImpl<T, DeadlinePassed<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) empty,
    required TResult Function(String failedValue) exceededPrice,
    required TResult Function(String failedValue) exceededTeamCount,
    required TResult Function(String failedValue) incompleteTeam,
    required TResult Function(String failedValue) deadlinePassed,
  }) {
    return deadlinePassed(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? empty,
    TResult Function(String failedValue)? exceededPrice,
    TResult Function(String failedValue)? exceededTeamCount,
    TResult Function(String failedValue)? incompleteTeam,
    TResult Function(String failedValue)? deadlinePassed,
  }) {
    return deadlinePassed?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? empty,
    TResult Function(String failedValue)? exceededPrice,
    TResult Function(String failedValue)? exceededTeamCount,
    TResult Function(String failedValue)? incompleteTeam,
    TResult Function(String failedValue)? deadlinePassed,
    required TResult orElse(),
  }) {
    if (deadlinePassed != null) {
      return deadlinePassed(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty<T> value) empty,
    required TResult Function(ExceededPrice<T> value) exceededPrice,
    required TResult Function(ExceededTeamCount<T> value) exceededTeamCount,
    required TResult Function(IncompleteTeam<T> value) incompleteTeam,
    required TResult Function(DeadlinePassed<T> value) deadlinePassed,
  }) {
    return deadlinePassed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceededPrice<T> value)? exceededPrice,
    TResult Function(ExceededTeamCount<T> value)? exceededTeamCount,
    TResult Function(IncompleteTeam<T> value)? incompleteTeam,
    TResult Function(DeadlinePassed<T> value)? deadlinePassed,
  }) {
    return deadlinePassed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceededPrice<T> value)? exceededPrice,
    TResult Function(ExceededTeamCount<T> value)? exceededTeamCount,
    TResult Function(IncompleteTeam<T> value)? incompleteTeam,
    TResult Function(DeadlinePassed<T> value)? deadlinePassed,
    required TResult orElse(),
  }) {
    if (deadlinePassed != null) {
      return deadlinePassed(this);
    }
    return orElse();
  }
}

abstract class DeadlinePassed<T> implements UserPlayerFailure<T> {
  const factory DeadlinePassed({required String failedValue}) =
      _$DeadlinePassed<T>;

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  $DeadlinePassedCopyWith<T, DeadlinePassed<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
