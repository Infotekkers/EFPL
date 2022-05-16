// ignore_for_file: avoid_renaming_method_parameters

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/errors.dart';
import 'package:efpl/domain/core/value_failures.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  T getOrCrash() {
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

// // Uniquee Id
// class UniqueId extends ValueObject<String> {
//   @override
//   final Either<ValueFailure<String>, String> value;
//   factory UniqueId() {
//     return UniqueId._(
//       right(const Uuid().v1()),
//     );
//   }
//   factory UniqueId.fromUniqueString(String uniqueId) {
//     assert(uniqueId != null);
//     return UniqueId._(
//       right(uniqueId),
//     );
//   }
//   const UniqueId._(this.value);
// }
