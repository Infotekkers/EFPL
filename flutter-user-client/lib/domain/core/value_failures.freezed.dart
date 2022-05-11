// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'value_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ValueFailureTearOff {
  const _$ValueFailureTearOff();

  Empty<T> empty<T>({required T failedValue}) {
    return Empty<T>(
      failedValue: failedValue,
    );
  }

  ExceedingLength<T> exceedingLength<T>(
      {required T failedValue, required int max}) {
    return ExceedingLength<T>(
      failedValue: failedValue,
      max: max,
    );
  }

  ExceedingRange<T> exceedingRange<T>(
      {required T failedValue, required List<dynamic> range}) {
    return ExceedingRange<T>(
      failedValue: failedValue,
      range: range,
    );
  }

  Invalid<T> invalid<T>({required T failedValue}) {
    return Invalid<T>(
      failedValue: failedValue,
    );
  }

  InvalidChipUsage<T> invalidChipUsage<T>(
      {required T failedValue, required String activeChip}) {
    return InvalidChipUsage<T>(
      failedValue: failedValue,
      activeChip: activeChip,
    );
  }
}

/// @nodoc
const $ValueFailure = _$ValueFailureTearOff();

/// @nodoc
mixin _$ValueFailure<T> {
  T get failedValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) empty,
    required TResult Function(T failedValue, int max) exceedingLength,
    required TResult Function(T failedValue, List<dynamic> range)
        exceedingRange,
    required TResult Function(T failedValue) invalid,
    required TResult Function(T failedValue, String activeChip)
        invalidChipUsage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue, List<dynamic> range)? exceedingRange,
    TResult Function(T failedValue)? invalid,
    TResult Function(T failedValue, String activeChip)? invalidChipUsage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue, List<dynamic> range)? exceedingRange,
    TResult Function(T failedValue)? invalid,
    TResult Function(T failedValue, String activeChip)? invalidChipUsage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty<T> value) empty,
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(ExceedingRange<T> value) exceedingRange,
    required TResult Function(Invalid<T> value) invalid,
    required TResult Function(InvalidChipUsage<T> value) invalidChipUsage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(ExceedingRange<T> value)? exceedingRange,
    TResult Function(Invalid<T> value)? invalid,
    TResult Function(InvalidChipUsage<T> value)? invalidChipUsage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(ExceedingRange<T> value)? exceedingRange,
    TResult Function(Invalid<T> value)? invalid,
    TResult Function(InvalidChipUsage<T> value)? invalidChipUsage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValueFailureCopyWith<T, ValueFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res>;
  $Res call({T failedValue});
}

/// @nodoc
class _$ValueFailureCopyWithImpl<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  final ValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(ValueFailure<T>) _then;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
abstract class $EmptyCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $EmptyCopyWith(Empty<T> value, $Res Function(Empty<T>) then) =
      _$EmptyCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class _$EmptyCopyWithImpl<T, $Res> extends _$ValueFailureCopyWithImpl<T, $Res>
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
              as T,
    ));
  }
}

/// @nodoc

class _$Empty<T> implements Empty<T> {
  const _$Empty({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.empty(failedValue: $failedValue)';
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
    required TResult Function(T failedValue) empty,
    required TResult Function(T failedValue, int max) exceedingLength,
    required TResult Function(T failedValue, List<dynamic> range)
        exceedingRange,
    required TResult Function(T failedValue) invalid,
    required TResult Function(T failedValue, String activeChip)
        invalidChipUsage,
  }) {
    return empty(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue, List<dynamic> range)? exceedingRange,
    TResult Function(T failedValue)? invalid,
    TResult Function(T failedValue, String activeChip)? invalidChipUsage,
  }) {
    return empty?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue, List<dynamic> range)? exceedingRange,
    TResult Function(T failedValue)? invalid,
    TResult Function(T failedValue, String activeChip)? invalidChipUsage,
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
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(ExceedingRange<T> value) exceedingRange,
    required TResult Function(Invalid<T> value) invalid,
    required TResult Function(InvalidChipUsage<T> value) invalidChipUsage,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(ExceedingRange<T> value)? exceedingRange,
    TResult Function(Invalid<T> value)? invalid,
    TResult Function(InvalidChipUsage<T> value)? invalidChipUsage,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(ExceedingRange<T> value)? exceedingRange,
    TResult Function(Invalid<T> value)? invalid,
    TResult Function(InvalidChipUsage<T> value)? invalidChipUsage,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty<T> implements ValueFailure<T> {
  const factory Empty({required T failedValue}) = _$Empty<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  $EmptyCopyWith<T, Empty<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExceedingLengthCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $ExceedingLengthCopyWith(
          ExceedingLength<T> value, $Res Function(ExceedingLength<T>) then) =
      _$ExceedingLengthCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue, int max});
}

/// @nodoc
class _$ExceedingLengthCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $ExceedingLengthCopyWith<T, $Res> {
  _$ExceedingLengthCopyWithImpl(
      ExceedingLength<T> _value, $Res Function(ExceedingLength<T>) _then)
      : super(_value, (v) => _then(v as ExceedingLength<T>));

  @override
  ExceedingLength<T> get _value => super._value as ExceedingLength<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
    Object? max = freezed,
  }) {
    return _then(ExceedingLength<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
      max: max == freezed
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ExceedingLength<T> implements ExceedingLength<T> {
  const _$ExceedingLength({required this.failedValue, required this.max});

  @override
  final T failedValue;
  @override
  final int max;

  @override
  String toString() {
    return 'ValueFailure<$T>.exceedingLength(failedValue: $failedValue, max: $max)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExceedingLength<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue) &&
            const DeepCollectionEquality().equals(other.max, max));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(failedValue),
      const DeepCollectionEquality().hash(max));

  @JsonKey(ignore: true)
  @override
  $ExceedingLengthCopyWith<T, ExceedingLength<T>> get copyWith =>
      _$ExceedingLengthCopyWithImpl<T, ExceedingLength<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) empty,
    required TResult Function(T failedValue, int max) exceedingLength,
    required TResult Function(T failedValue, List<dynamic> range)
        exceedingRange,
    required TResult Function(T failedValue) invalid,
    required TResult Function(T failedValue, String activeChip)
        invalidChipUsage,
  }) {
    return exceedingLength(failedValue, max);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue, List<dynamic> range)? exceedingRange,
    TResult Function(T failedValue)? invalid,
    TResult Function(T failedValue, String activeChip)? invalidChipUsage,
  }) {
    return exceedingLength?.call(failedValue, max);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue, List<dynamic> range)? exceedingRange,
    TResult Function(T failedValue)? invalid,
    TResult Function(T failedValue, String activeChip)? invalidChipUsage,
    required TResult orElse(),
  }) {
    if (exceedingLength != null) {
      return exceedingLength(failedValue, max);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty<T> value) empty,
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(ExceedingRange<T> value) exceedingRange,
    required TResult Function(Invalid<T> value) invalid,
    required TResult Function(InvalidChipUsage<T> value) invalidChipUsage,
  }) {
    return exceedingLength(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(ExceedingRange<T> value)? exceedingRange,
    TResult Function(Invalid<T> value)? invalid,
    TResult Function(InvalidChipUsage<T> value)? invalidChipUsage,
  }) {
    return exceedingLength?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(ExceedingRange<T> value)? exceedingRange,
    TResult Function(Invalid<T> value)? invalid,
    TResult Function(InvalidChipUsage<T> value)? invalidChipUsage,
    required TResult orElse(),
  }) {
    if (exceedingLength != null) {
      return exceedingLength(this);
    }
    return orElse();
  }
}

abstract class ExceedingLength<T> implements ValueFailure<T> {
  const factory ExceedingLength({required T failedValue, required int max}) =
      _$ExceedingLength<T>;

  @override
  T get failedValue;
  int get max;
  @override
  @JsonKey(ignore: true)
  $ExceedingLengthCopyWith<T, ExceedingLength<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExceedingRangeCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $ExceedingRangeCopyWith(
          ExceedingRange<T> value, $Res Function(ExceedingRange<T>) then) =
      _$ExceedingRangeCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue, List<dynamic> range});
}

/// @nodoc
class _$ExceedingRangeCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $ExceedingRangeCopyWith<T, $Res> {
  _$ExceedingRangeCopyWithImpl(
      ExceedingRange<T> _value, $Res Function(ExceedingRange<T>) _then)
      : super(_value, (v) => _then(v as ExceedingRange<T>));

  @override
  ExceedingRange<T> get _value => super._value as ExceedingRange<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
    Object? range = freezed,
  }) {
    return _then(ExceedingRange<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
      range: range == freezed
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$ExceedingRange<T> implements ExceedingRange<T> {
  const _$ExceedingRange({required this.failedValue, required this.range});

  @override
  final T failedValue;
  @override
  final List<dynamic> range;

  @override
  String toString() {
    return 'ValueFailure<$T>.exceedingRange(failedValue: $failedValue, range: $range)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExceedingRange<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue) &&
            const DeepCollectionEquality().equals(other.range, range));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(failedValue),
      const DeepCollectionEquality().hash(range));

  @JsonKey(ignore: true)
  @override
  $ExceedingRangeCopyWith<T, ExceedingRange<T>> get copyWith =>
      _$ExceedingRangeCopyWithImpl<T, ExceedingRange<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) empty,
    required TResult Function(T failedValue, int max) exceedingLength,
    required TResult Function(T failedValue, List<dynamic> range)
        exceedingRange,
    required TResult Function(T failedValue) invalid,
    required TResult Function(T failedValue, String activeChip)
        invalidChipUsage,
  }) {
    return exceedingRange(failedValue, range);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue, List<dynamic> range)? exceedingRange,
    TResult Function(T failedValue)? invalid,
    TResult Function(T failedValue, String activeChip)? invalidChipUsage,
  }) {
    return exceedingRange?.call(failedValue, range);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue, List<dynamic> range)? exceedingRange,
    TResult Function(T failedValue)? invalid,
    TResult Function(T failedValue, String activeChip)? invalidChipUsage,
    required TResult orElse(),
  }) {
    if (exceedingRange != null) {
      return exceedingRange(failedValue, range);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty<T> value) empty,
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(ExceedingRange<T> value) exceedingRange,
    required TResult Function(Invalid<T> value) invalid,
    required TResult Function(InvalidChipUsage<T> value) invalidChipUsage,
  }) {
    return exceedingRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(ExceedingRange<T> value)? exceedingRange,
    TResult Function(Invalid<T> value)? invalid,
    TResult Function(InvalidChipUsage<T> value)? invalidChipUsage,
  }) {
    return exceedingRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(ExceedingRange<T> value)? exceedingRange,
    TResult Function(Invalid<T> value)? invalid,
    TResult Function(InvalidChipUsage<T> value)? invalidChipUsage,
    required TResult orElse(),
  }) {
    if (exceedingRange != null) {
      return exceedingRange(this);
    }
    return orElse();
  }
}

abstract class ExceedingRange<T> implements ValueFailure<T> {
  const factory ExceedingRange(
      {required T failedValue,
      required List<dynamic> range}) = _$ExceedingRange<T>;

  @override
  T get failedValue;
  List<dynamic> get range;
  @override
  @JsonKey(ignore: true)
  $ExceedingRangeCopyWith<T, ExceedingRange<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvalidCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidCopyWith(Invalid<T> value, $Res Function(Invalid<T>) then) =
      _$InvalidCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class _$InvalidCopyWithImpl<T, $Res> extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $InvalidCopyWith<T, $Res> {
  _$InvalidCopyWithImpl(Invalid<T> _value, $Res Function(Invalid<T>) _then)
      : super(_value, (v) => _then(v as Invalid<T>));

  @override
  Invalid<T> get _value => super._value as Invalid<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(Invalid<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$Invalid<T> implements Invalid<T> {
  const _$Invalid({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalid(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Invalid<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $InvalidCopyWith<T, Invalid<T>> get copyWith =>
      _$InvalidCopyWithImpl<T, Invalid<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) empty,
    required TResult Function(T failedValue, int max) exceedingLength,
    required TResult Function(T failedValue, List<dynamic> range)
        exceedingRange,
    required TResult Function(T failedValue) invalid,
    required TResult Function(T failedValue, String activeChip)
        invalidChipUsage,
  }) {
    return invalid(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue, List<dynamic> range)? exceedingRange,
    TResult Function(T failedValue)? invalid,
    TResult Function(T failedValue, String activeChip)? invalidChipUsage,
  }) {
    return invalid?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue, List<dynamic> range)? exceedingRange,
    TResult Function(T failedValue)? invalid,
    TResult Function(T failedValue, String activeChip)? invalidChipUsage,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty<T> value) empty,
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(ExceedingRange<T> value) exceedingRange,
    required TResult Function(Invalid<T> value) invalid,
    required TResult Function(InvalidChipUsage<T> value) invalidChipUsage,
  }) {
    return invalid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(ExceedingRange<T> value)? exceedingRange,
    TResult Function(Invalid<T> value)? invalid,
    TResult Function(InvalidChipUsage<T> value)? invalidChipUsage,
  }) {
    return invalid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(ExceedingRange<T> value)? exceedingRange,
    TResult Function(Invalid<T> value)? invalid,
    TResult Function(InvalidChipUsage<T> value)? invalidChipUsage,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(this);
    }
    return orElse();
  }
}

abstract class Invalid<T> implements ValueFailure<T> {
  const factory Invalid({required T failedValue}) = _$Invalid<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  $InvalidCopyWith<T, Invalid<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvalidChipUsageCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidChipUsageCopyWith(
          InvalidChipUsage<T> value, $Res Function(InvalidChipUsage<T>) then) =
      _$InvalidChipUsageCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue, String activeChip});
}

/// @nodoc
class _$InvalidChipUsageCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $InvalidChipUsageCopyWith<T, $Res> {
  _$InvalidChipUsageCopyWithImpl(
      InvalidChipUsage<T> _value, $Res Function(InvalidChipUsage<T>) _then)
      : super(_value, (v) => _then(v as InvalidChipUsage<T>));

  @override
  InvalidChipUsage<T> get _value => super._value as InvalidChipUsage<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
    Object? activeChip = freezed,
  }) {
    return _then(InvalidChipUsage<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
      activeChip: activeChip == freezed
          ? _value.activeChip
          : activeChip // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidChipUsage<T> implements InvalidChipUsage<T> {
  const _$InvalidChipUsage(
      {required this.failedValue, required this.activeChip});

  @override
  final T failedValue;
  @override
  final String activeChip;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidChipUsage(failedValue: $failedValue, activeChip: $activeChip)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvalidChipUsage<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue) &&
            const DeepCollectionEquality()
                .equals(other.activeChip, activeChip));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(failedValue),
      const DeepCollectionEquality().hash(activeChip));

  @JsonKey(ignore: true)
  @override
  $InvalidChipUsageCopyWith<T, InvalidChipUsage<T>> get copyWith =>
      _$InvalidChipUsageCopyWithImpl<T, InvalidChipUsage<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) empty,
    required TResult Function(T failedValue, int max) exceedingLength,
    required TResult Function(T failedValue, List<dynamic> range)
        exceedingRange,
    required TResult Function(T failedValue) invalid,
    required TResult Function(T failedValue, String activeChip)
        invalidChipUsage,
  }) {
    return invalidChipUsage(failedValue, activeChip);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue, List<dynamic> range)? exceedingRange,
    TResult Function(T failedValue)? invalid,
    TResult Function(T failedValue, String activeChip)? invalidChipUsage,
  }) {
    return invalidChipUsage?.call(failedValue, activeChip);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue, List<dynamic> range)? exceedingRange,
    TResult Function(T failedValue)? invalid,
    TResult Function(T failedValue, String activeChip)? invalidChipUsage,
    required TResult orElse(),
  }) {
    if (invalidChipUsage != null) {
      return invalidChipUsage(failedValue, activeChip);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty<T> value) empty,
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(ExceedingRange<T> value) exceedingRange,
    required TResult Function(Invalid<T> value) invalid,
    required TResult Function(InvalidChipUsage<T> value) invalidChipUsage,
  }) {
    return invalidChipUsage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(ExceedingRange<T> value)? exceedingRange,
    TResult Function(Invalid<T> value)? invalid,
    TResult Function(InvalidChipUsage<T> value)? invalidChipUsage,
  }) {
    return invalidChipUsage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty<T> value)? empty,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(ExceedingRange<T> value)? exceedingRange,
    TResult Function(Invalid<T> value)? invalid,
    TResult Function(InvalidChipUsage<T> value)? invalidChipUsage,
    required TResult orElse(),
  }) {
    if (invalidChipUsage != null) {
      return invalidChipUsage(this);
    }
    return orElse();
  }
}

abstract class InvalidChipUsage<T> implements ValueFailure<T> {
  const factory InvalidChipUsage(
      {required T failedValue,
      required String activeChip}) = _$InvalidChipUsage<T>;

  @override
  T get failedValue;
  String get activeChip;
  @override
  @JsonKey(ignore: true)
  $InvalidChipUsageCopyWith<T, InvalidChipUsage<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
