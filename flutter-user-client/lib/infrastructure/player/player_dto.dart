import 'package:efpl/domain/player/player.dart';
import 'package:efpl/domain/player/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_dto.freezed.dart';
part 'player_dto.g.dart';

@freezed
abstract class PlayerDto implements _$PlayerDto {
  const PlayerDto._();

  const factory PlayerDto({
    required String playerName,
    required int playerId,
    required String eplTeamId,
    required String position,
    required double currentPrice,
    @Default("")
        String teamLogoUrl,
    @Default({
      "injuryStatus": "100",
      "injuryMessage": "fit to play",
    })
        Map<String, String> availability,
    @Default([])
        List<dynamic> score,
    @Default([])
        List<dynamic> history,
  }) = _PlayerDto;

  factory PlayerDto.fromDomain(Player player) => PlayerDto(
        playerName: player.name.isValid() ? player.name.getOrCrash() : '',
        playerId: player.playerId.isValid()
            ? int.parse(player.playerId.getOrCrash())
            : 0,
        eplTeamId:
            player.eplTeamId.isValid() ? player.eplTeamId.getOrCrash() : ' ',
        position:
            player.position.isValid() ? player.position.getOrCrash() : ' ',
        currentPrice: player.position.isValid()
            ? double.parse(player.position.getOrCrash())
            : 0,
        availability: {},
        score: [],
        history: [],
      );

  Player toDomain() {
    Availability availabilityVO = Availability(
        injuryStatus: InjuryStatus(availability['injuryStatus'] ?? '100'),
        injuryMessage:
            InjuryMessage(availability['injuryMessage'] ?? 'Fit to play'));

    List<Score> scoresVO = [];
    if (score.isNotEmpty) {
      for (var element in score) {
        scoresVO.add(Score(
          gameweek: Gameweek(element['gameweekId'].toString()),
          price: Price(element['price'].toString()),
          fantasyScore: FantasyScore(element['fantasyScore'].toString()),
          minutesPlayed: MinutesPlayed(element['minutesPlayed'].toString()),
          goals: Goals(element['goals'].toString()),
          assists: Assists(element['assists'].toString()),
          cleansheet: Cleansheet(element['cleanSheet'].toString()),
          yellows: Yellows(element['yellows'].toString()),
          reds: Reds(element['reds'].toString()),
          penalitiesMissed:
              PenalitiesMissed(element['penalitiesMissed'].toString()),
          penalitiesSaved:
              PenalitiesSaved(element['penalitiesSaved'].toString()),
          saves: Saves(element['saves'].toString()),
          ownGoal: OwnGoal(element['ownGoal'].toString()),
          form: Form(element['form'].toString()),
        ));
      }
    }

    List<History> historyVO = [];
    if (history.isNotEmpty) {
      for (var element in history) {
        historyVO.add(History(
          startingPrice: Price(element['startingPrice'].toString()),
          endingPrice: Price(element['endingPrice'].toString()),
          totalFantasyScore:
              FantasyScore(element['totalFantasyScore'].toString()),
          totalMinutesPlayed:
              MinutesPlayed(element['totalMinutesPlayed'].toString()),
          totalGoals: Goals(element['totalGoals'].toString()),
          totalAssists: Assists(element['totalAssists'].toString()),
          totalCleansheet: Cleansheet(element['totalCleansheet'].toString()),
          totalYellows: Yellows(element['totalYellows'].toString()),
          totalReds: Reds(element['totalReds'].toString()),
          totalPenalitiesMissed:
              PenalitiesMissed(element['totalPenalitiesMissed'].toString()),
          totalPenalitiesSaved:
              PenalitiesSaved(element['totalPenalitiesSaved'].toString()),
          totalSaves: Saves(element['totalSaves'].toString()),
          totalOwnGoal: OwnGoal(element['totalOwnGoal'].toString()),
          totalForm: Form(element['totalForm'].toString()),
        ));
      }
    }

    return Player(
      name: Name(playerName),
      playerId: Id(playerId.toString()),
      eplTeamId: EplTeamId(eplTeamId),
      position: Position(position),
      image: Image(teamLogoUrl),
      availability: availabilityVO,
      currentPrice: Price(currentPrice.toString()),
      score: scoresVO,
      history: historyVO,
    );
  }

  factory PlayerDto.fromJson(Map<String, dynamic> json) =>
      _$PlayerDtoFromJson(json);
}
