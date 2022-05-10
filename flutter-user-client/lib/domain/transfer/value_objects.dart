import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/core_value_objects.dart';
import 'package:efpl/domain/core/value_failures.dart';
import 'package:efpl/domain/transfer/value_validators.dart';

class PlayerName extends ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PlayerName({required String value}) {
    return PlayerName._(
      value: validatePlayerName(playerName: value),
    );
  }

  const PlayerName._({required this.value});
}

class PlayerPrice extends ValueObject {
  @override
  final Either<ValueFailure<String>, double> value;

  factory PlayerPrice({required double value}) {
    return PlayerPrice._(
      value: validatePlayerPrice(playerPrice: value),
    );
  }

  const PlayerPrice._({required this.value});
}

class PlayerPosition extends ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PlayerPosition({required String value}) {
    return PlayerPosition._(
      value: validatePlayerPosition(playerPosition: value),
    );
  }

  const PlayerPosition._({required this.value});
}

class PlayerEplTeam extends ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PlayerEplTeam({required String value}) {
    return PlayerEplTeam._(
      value: validatePlayerEplTeam(playerEplTeam: value),
    );
  }

  const PlayerEplTeam._({required this.value});
}
