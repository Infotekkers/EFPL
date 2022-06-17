import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/core_value_objects.dart';
import 'package:efpl/domain/core/value_failures.dart';
import 'package:efpl/domain/epl_stats/value_validators.dart';

class TopScorers extends ValueObject {
  @override
  final Either<ValueFailure<String>, List> value;

  factory TopScorers({required List value}) {
    return TopScorers._(
      value: validateTopScorers(topScorers: value),
    );
  }

  const TopScorers._({required this.value});
}

class MostAssists extends ValueObject {
  @override
  final Either<ValueFailure<String>, List> value;

  factory MostAssists({required List value}) {
    return MostAssists._(
      value: validateMostAssists(mostAssists: value),
    );
  }

  const MostAssists._({required this.value});
}

class MostCleanSheets extends ValueObject {
  @override
  final Either<ValueFailure<String>, List> value;

  factory MostCleanSheets({required List value}) {
    return MostCleanSheets._(
      value: validateMostCleanSheets(mostCleanSheets: value),
    );
  }

  const MostCleanSheets._({required this.value});
}

class MostReds extends ValueObject {
  @override
  final Either<ValueFailure<String>, List> value;

  factory MostReds({required List value}) {
    return MostReds._(
      value: validateMostReds(mostReds: value),
    );
  }

  const MostReds._({required this.value});
}

class MostYellows extends ValueObject {
  @override
  final Either<ValueFailure<String>, List> value;

  factory MostYellows({required List value}) {
    return MostYellows._(
      value: validateMostYellows(mostYellows: value),
    );
  }

  const MostYellows._({required this.value});
}

class MostSaves extends ValueObject {
  @override
  final Either<ValueFailure<String>, List> value;

  factory MostSaves({required List value}) {
    return MostSaves._(
      value: validateMostSaves(mostSaves: value),
    );
  }

  const MostSaves._({required this.value});
}

class MostMinutesPlayed extends ValueObject {
  @override
  final Either<ValueFailure<String>, List> value;

  factory MostMinutesPlayed({required List value}) {
    return MostMinutesPlayed._(
      value: validateMostMinutesPlayed(mostMinutesPlayed: value),
    );
  }

  const MostMinutesPlayed._({required this.value});
}
