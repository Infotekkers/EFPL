// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stats_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StatsFailuresTearOff {
  const _$StatsFailuresTearOff();

  Empty<T> empty<T>({required String failedValue}) {
    return Empty<T>(
      failedValue: failedValue,
    );
  }

  NegativeValue<T> negativeValue<T>({required int failedValue}) {
    return NegativeValue<T>(
      failedValue: failedValue,
    );
  }
}

/// @nodoc
const $StatsFailures = _$StatsFailuresTearOff();

/// @nodoc
mixin _$StatsFailures<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) empty,
    required TResult Function(int failedValue) negativeValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? empty,
    TResult Function(int failedValue)? negativeValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? empty,
    TResult Function(int failedValue)? negativeValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty<T> value) empty,
    required TResult Function(NegativeValue<T> value) negativeValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(NegativeValue<T> value)? negativeValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(NegativeValue<T> value)? negativeValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsFailuresCopyWith<T, $Res> {
  factory $StatsFailuresCopyWith(
          StatsFailures<T> value, $Res Function(StatsFailures<T>) then) =
      _$StatsFailuresCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$StatsFailuresCopyWithImpl<T, $Res>
    implements $StatsFailuresCopyWith<T, $Res> {
  _$StatsFailuresCopyWithImpl(this._value, this._then);

  final StatsFailures<T> _value;
  // ignore: unused_field
  final $Res Function(StatsFailures<T>) _then;
}

/// @nodoc
abstract class $EmptyCopyWith<T, $Res> {
  factory $EmptyCopyWith(Empty<T> value, $Res Function(Empty<T>) then) =
      _$EmptyCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class _$EmptyCopyWithImpl<T, $Res> extends _$StatsFailuresCopyWithImpl<T, $Res>
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

class _$Empty<T> with DiagnosticableTreeMixin implements Empty<T> {
  const _$Empty({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StatsFailures<$T>.empty(failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StatsFailures<$T>.empty'))
      ..add(DiagnosticsProperty('failedValue', failedValue));
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
    required TResult Function(int failedValue) negativeValue,
  }) {
    return empty(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? empty,
    TResult Function(int failedValue)? negativeValue,
  }) {
    return empty?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? empty,
    TResult Function(int failedValue)? negativeValue,
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
    required TResult Function(NegativeValue<T> value) negativeValue,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(NegativeValue<T> value)? negativeValue,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(NegativeValue<T> value)? negativeValue,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty<T> implements StatsFailures<T> {
  const factory Empty({required String failedValue}) = _$Empty<T>;

  String get failedValue;
  @JsonKey(ignore: true)
  $EmptyCopyWith<T, Empty<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NegativeValueCopyWith<T, $Res> {
  factory $NegativeValueCopyWith(
          NegativeValue<T> value, $Res Function(NegativeValue<T>) then) =
      _$NegativeValueCopyWithImpl<T, $Res>;
  $Res call({int failedValue});
}

/// @nodoc
class _$NegativeValueCopyWithImpl<T, $Res>
    extends _$StatsFailuresCopyWithImpl<T, $Res>
    implements $NegativeValueCopyWith<T, $Res> {
  _$NegativeValueCopyWithImpl(
      NegativeValue<T> _value, $Res Function(NegativeValue<T>) _then)
      : super(_value, (v) => _then(v as NegativeValue<T>));

  @override
  NegativeValue<T> get _value => super._value as NegativeValue<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(NegativeValue<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NegativeValue<T>
    with DiagnosticableTreeMixin
    implements NegativeValue<T> {
  const _$NegativeValue({required this.failedValue});

  @override
  final int failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StatsFailures<$T>.negativeValue(failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StatsFailures<$T>.negativeValue'))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NegativeValue<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $NegativeValueCopyWith<T, NegativeValue<T>> get copyWith =>
      _$NegativeValueCopyWithImpl<T, NegativeValue<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) empty,
    required TResult Function(int failedValue) negativeValue,
  }) {
    return negativeValue(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? empty,
    TResult Function(int failedValue)? negativeValue,
  }) {
    return negativeValue?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? empty,
    TResult Function(int failedValue)? negativeValue,
    required TResult orElse(),
  }) {
    if (negativeValue != null) {
      return negativeValue(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty<T> value) empty,
    required TResult Function(NegativeValue<T> value) negativeValue,
  }) {
    return negativeValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(NegativeValue<T> value)? negativeValue,
  }) {
    return negativeValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(NegativeValue<T> value)? negativeValue,
    required TResult orElse(),
  }) {
    if (negativeValue != null) {
      return negativeValue(this);
    }
    return orElse();
  }
}

abstract class NegativeValue<T> implements StatsFailures<T> {
  const factory NegativeValue({required int failedValue}) = _$NegativeValue<T>;

  int get failedValue;
  @JsonKey(ignore: true)
  $NegativeValueCopyWith<T, NegativeValue<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
