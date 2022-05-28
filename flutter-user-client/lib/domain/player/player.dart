import 'package:efpl/domain/player/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player.freezed.dart';

@freezed
abstract class Player with _$Player {
  const factory Player({
    required Name name,
    required Id playerId,
    required EplTeamId eplTeamId,
    required Position position,
    required Price currentPrice,
    required Availability availability,
    required Image image,
    @Default([]) List<Score> score,
    @Default([]) List<History> history,
  }) = _Player;
}

class Availability {
  InjuryStatus injuryStatus;
  InjuryMessage injuryMessage;

  Availability({required this.injuryStatus, required this.injuryMessage});
}

class Score {
  Gameweek gameweek;
  Price? price;
  FantasyScore? fantasyScore;
  MinutesPlayed? minutesPlayed;
  Goals? goals;
  Assists? assists;
  Cleansheet? cleansheet;
  Yellows? yellows;
  Reds? reds;
  PenalitiesMissed? penalitiesMissed;
  PenalitiesSaved? penalitiesSaved;
  Saves? saves;
  OwnGoal? ownGoal;
  TransfersIn? transfersIn;
  TransfersOut? transfersOut;
  Form? form;

  Score({
    required this.gameweek,
    this.price,
    this.fantasyScore,
    this.minutesPlayed,
    this.goals,
    this.assists,
    this.cleansheet,
    this.yellows,
    this.reds,
    this.penalitiesMissed,
    this.penalitiesSaved,
    this.saves,
    this.ownGoal,
    this.transfersIn,
    this.transfersOut,
    this.form,
  });
}

class History {
  Price? startingPrice;
  Price? endingPrice;
  FantasyScore? totalFantasyScore;
  MinutesPlayed? totalMinutesPlayed;
  Goals? totalGoals;
  Assists? totalAssists;
  Cleansheet? totalCleansheet;
  Yellows? totalYellows;
  Reds? totalReds;
  PenalitiesMissed? totalPenalitiesMissed;
  PenalitiesSaved? totalPenalitiesSaved;
  Saves? totalSaves;
  OwnGoal? totalOwnGoal;
  TransfersIn? totalTransfersIn;
  TransfersOut? totalTransfersOut;
  Form? totalForm;

  History({
    this.startingPrice,
    this.endingPrice,
    this.totalFantasyScore,
    this.totalMinutesPlayed,
    this.totalGoals,
    this.totalAssists,
    this.totalCleansheet,
    this.totalYellows,
    this.totalReds,
    this.totalPenalitiesMissed,
    this.totalPenalitiesSaved,
    this.totalSaves,
    this.totalOwnGoal,
    this.totalTransfersIn,
    this.totalTransfersOut,
    this.totalForm,
  });
}
