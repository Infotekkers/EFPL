import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/core_value_objects.dart';
import 'package:efpl/domain/core/value_failures.dart';

import 'value_validators.dart';

class LeagueId extends ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  factory LeagueId({required String value}) {
    return LeagueId._(value: validateLeagueId(leagueId: value));
  }

  const LeagueId._({required this.value});
}

class LeagueName extends ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  factory LeagueName({required String value}) {
    return LeagueName._(value: validateLeagueName(leagueName: value));
  }

  const LeagueName._({required this.value});
}

class PreviousRank extends ValueObject {
  @override
  final Either<ValueFailure<String>, int> value;

  factory PreviousRank({required int value}) {
    return PreviousRank._(value: validatePreviousRank(previousRank: value));
  }

  const PreviousRank._({required this.value});
}
