import 'package:efpl/domain/core/value_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/value_objects.dart';
import 'package:efpl/domain/player/value_validators.dart';

class Name extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 60;

  const Name._(this.value);

  factory Name(String nameStr) {
    return Name._(validateMaxStringLength(nameStr, maxLength)
        .flatMap(validateStringNotEmpty));
  }
}

class Id extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const Id._(this.value);

  factory Id(String idStr) {
    return Id._(validateStringNotEmpty(idStr));
  }
}

class EplTeamId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const EplTeamId._(this.value);

  factory EplTeamId(String eplTeamIdStr) {
    return EplTeamId._(validateStringNotEmpty(eplTeamIdStr));
  }
}

class Position extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const validPositions = ['gk', 'def', 'mid', 'att', 'sub'];

  const Position._(this.value);

  factory Position(String positionStr) {
    return Position._(validatePosition(positionStr, validPositions)
        .flatMap(validateStringNotEmpty));
  }
}

class Multiplier extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  static const range = [0, 3];

  const Multiplier._(this.value);

  factory Multiplier(String multiplierValue) {
    return Multiplier._(validateRange(multiplierValue, range));
  }
}

class IsCaptain extends ValueObject<bool> {
  @override
  final Either<ValueFailure<bool>, bool> value;

  const IsCaptain._(this.value);

  factory IsCaptain(bool isCaptainValue) {
    return IsCaptain._(right(isCaptainValue));
  }
}

class IsViceCaptain extends ValueObject<bool> {
  @override
  final Either<ValueFailure<bool>, bool> value;

  const IsViceCaptain._(this.value);

  factory IsViceCaptain(bool isViceCaptainValue) {
    return IsViceCaptain._(right(isViceCaptainValue));
  }
}
