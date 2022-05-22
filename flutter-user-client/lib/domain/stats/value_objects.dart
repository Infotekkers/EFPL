import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/core_value_objects.dart';
import 'package:efpl/domain/core/value_failures.dart';
import 'package:efpl/domain/stats/value_validators.dart';

class PlayerName extends ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PlayerName({required String value}) {
    return PlayerName._(value: validatePlayerName(playerName: value));
  }

  const PlayerName._({required this.value});
}
