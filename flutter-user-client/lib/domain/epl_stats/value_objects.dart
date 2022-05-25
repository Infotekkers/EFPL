import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/core_value_objects.dart';
import 'package:efpl/domain/core/value_failures.dart';
import 'package:efpl/domain/epl_stats/value_validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerName extends ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PlayerName({required String value}) {
    return PlayerName._(value: validatePlayerName(playerName: value));
  }

  const PlayerName._({required this.value});
}

class StatCount extends ValueObject {
  @override
  final Either<ValueFailure<String>, int> value;

  factory StatCount({required int value}) {
    return StatCount._(value: validateStatCount(statCount: value));
  }

  const StatCount._({required this.value});
}
