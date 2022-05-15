import 'package:efpl/domain/player/player.dart';
import 'package:efpl/domain/player/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_dto.freezed.dart';
part 'player_dto.g.dart';

@freezed
abstract class PlayerDto implements _$PlayerDto {
  const PlayerDto._();

  const factory PlayerDto({
    required String name,
    required String playerId,
    required String eplTeamId,
    required String position,
    required String price,
    required Map<String, String> availability,
    @Default([]) List<dynamic> score,
    @Default([]) List<dynamic> history,
  }) = _PlayerDto;

  factory PlayerDto.fromDomain(Player player) => PlayerDto(
        name: player.name.isValid() ? player.name.getOrCrash() : '',
        playerId: player.playerId.isValid() ? player.playerId.getOrCrash() : '',
        eplTeamId:
            player.eplTeamId.isValid() ? player.eplTeamId.getOrCrash() : ' ',
        position:
            player.position.isValid() ? player.position.getOrCrash() : ' ',
        price: player.position.isValid() ? player.position.getOrCrash() : ' ',
        availability: {},
        score: [],
        history: [],
      );

  Player toDomain() {
    Availability availabilityVO = Availability(
      injuryStatus: InjuryStatus(availability['injuryStatus'] ?? '0'),
    );

    List<Score> scoresVO = [];
    if (score.isNotEmpty) {
      for (var element in score) {
        scoresVO.add(Score(
          gameweek: element.gameweek,
          price: element.price,
          fantasyScore: element.fantasyScore,
          minutesPlayed: element.minutesPlayed,
          goals: element.goals,
          assists: element.assists,
          cleansheet: element.cleansheet,
          yellows: element.yellows,
          reds: element.reds,
          penalitiesMissed: element.penalitiesMissed,
          penalitiesSaved: element.penalitiesSaved,
          saves: element.saves,
          ownGoal: element.ownGoal,
          form: element.form,
        ));
      }
    }

    List<History> historyVO = [];
    if (history.isNotEmpty) {
      for (var element in history) {
        historyVO.add(History(
          startingPrice: element.startingPrice,
          endingPrice: element.endingPrice,
          totalFantasyScore: element.totalFantasyScore,
          totalMinutesPlayed: element.totalMinutesPlayed,
          totalGoals: element.totalGoals,
          totalAssists: element.totalAssists,
          totalCleansheet: element.totalCleansheet,
          totalYellows: element.totalYellows,
          totalReds: element.totalReds,
          totalPenalitiesMissed: element.totalPenalitiesMissed,
          totalPenalitiesSaved: element.totalPenalitiesSaved,
          totalSaves: element.totalSaves,
          totalOwnGoal: element.totalOwnGoal,
          totalForm: element.totalForm,
        ));
      }
    }

    return Player(
      name: Name(name),
      playerId: Id(playerId),
      eplTeamId: EplTeamId(eplTeamId),
      position: Position(position),
      availability: availabilityVO,
      currentPrice: Price(price),
      score: scoresVO,
      history: historyVO,
    );
  }

  factory PlayerDto.fromJson(Map<String, dynamic> json) =>
      _$PlayerDtoFromJson(json);
}
