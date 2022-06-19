import 'package:dartz/dartz.dart';

import 'package:efpl/domain/core/value_failures.dart';
import 'package:efpl/domain/core/core_value_objects.dart';
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

class Price extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const Price._(this.value);

  factory Price(String priceStr) {
    return Price._(validateStringNotEmpty(priceStr));
  }
}

class Image extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const Image._(this.value);

  factory Image(String imageStr) {
    return Image._(validateStringNotEmpty(imageStr));
  }
}

// * Availabilty VOs
class InjuryStatus extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const InjuryStatus._(this.value);

  factory InjuryStatus(String injuryStatusStr) {
    return InjuryStatus._(validateStringNotEmpty(injuryStatusStr));
  }
}

class InjuryMessage extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const InjuryMessage._(this.value);

  factory InjuryMessage(String injuryMessageStr) {
    return InjuryMessage._(right(injuryMessageStr));
  }
}

// * SCORE VOs
class Gameweek extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static final range = [1, 30];

  const Gameweek._(this.value);

  factory Gameweek(String gameweekStr) {
    return Gameweek._(
        validateRange(gameweekStr, range).flatMap(validateStringNotEmpty));
  }
}

class Goals extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const Goals._(this.value);

  factory Goals(String goalsStr) {
    return Goals._(validateStringNotEmpty(goalsStr));
  }
}

class Assists extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const Assists._(this.value);

  factory Assists(String assists) {
    return Assists._(validateStringNotEmpty(assists));
  }
}

class Yellows extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const Yellows._(this.value);

  factory Yellows(String yellowsStr) {
    return Yellows._(validateStringNotEmpty(yellowsStr));
  }
}

class Reds extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const Reds._(this.value);

  factory Reds(String redsStr) {
    return Reds._(validateStringNotEmpty(redsStr));
  }
}

class Cleansheet extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const Cleansheet._(this.value);

  factory Cleansheet(String cleansheetStr) {
    return Cleansheet._(validateStringNotEmpty(cleansheetStr));
  }
}

class MinutesPlayed extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const MinutesPlayed._(this.value);

  factory MinutesPlayed(String minutesPlayed) {
    return MinutesPlayed._(validateStringNotEmpty(minutesPlayed));
  }
}

class FantasyScore extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const FantasyScore._(this.value);

  factory FantasyScore(String fantasyScoreStr) {
    return FantasyScore._(validateStringNotEmpty(fantasyScoreStr));
  }
}

class PenalitiesSaved extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const PenalitiesSaved._(this.value);

  factory PenalitiesSaved(String penalitiesSavedStr) {
    return PenalitiesSaved._(validateStringNotEmpty(penalitiesSavedStr));
  }
}

class PenalitiesMissed extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const PenalitiesMissed._(this.value);

  factory PenalitiesMissed(String penalitiesMissed) {
    return PenalitiesMissed._(validateStringNotEmpty(penalitiesMissed));
  }
}

class Saves extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const Saves._(this.value);

  factory Saves(String savesStr) {
    return Saves._(validateStringNotEmpty(savesStr));
  }
}

class OwnGoal extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const OwnGoal._(this.value);

  factory OwnGoal(String ownGoalStr) {
    return OwnGoal._(validateStringNotEmpty(ownGoalStr));
  }
}

class TransfersIn extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const TransfersIn._(this.value);

  factory TransfersIn(String transfersInStr) {
    return TransfersIn._(validateStringNotEmpty(transfersInStr));
  }
}

class TransfersOut extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const TransfersOut._(this.value);

  factory TransfersOut(String transferOutStr) {
    return TransfersOut._(validateStringNotEmpty(transferOutStr));
  }
}

class Form extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const Form._(this.value);

  factory Form(String formStr) {
    return Form._(validateStringNotEmpty(formStr));
  }
}
