import 'package:efpl/domain/fixture/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fixture.freezed.dart';

@freezed
abstract class Fixture with _$Fixture {
  const factory Fixture({
    required GameWeekId gameWeekId,
    required MatchId matchId,
    required Schedule schedule,
    required Status status,
    //
    required Team homeTeam,
    required Team homeTeamAmh,
    required TeamLineUp homeTeamLineUp,
    required TeamCity homeTeamCity,
    required TeamCoach homeTeamCoach,
    required TeamLogo homeTeamLogo,
    required Stadium homeTeamStadium,
    required StadiumCapacity homeTeamCapacity,
    required int fdr,
    //
    required Team awayTeam,
    required Team awayTeamAmh,
    required TeamLineUp awayTeamLineUp,
    required TeamCity awayTeamCity,
    required TeamCoach awayTeamCoach,
    required TeamLogo awayTeamLogo,
    required Stadium awayTeamStadium,
    required StadiumCapacity awayTeamCapacity,
    //

    required Score score,
  }) = _Fixture;

  factory Fixture.initial() => Fixture(
        gameWeekId: GameWeekId(value: 0),
        matchId: MatchId(value: ""),
        schedule: Schedule(value: ""),
        status: Status(value: ""),
        homeTeam: Team(value: ""),
        homeTeamAmh: Team(value: ""),
        homeTeamLineUp: TeamLineUp(value: const {}),
        homeTeamCity: TeamCity(value: ""),
        homeTeamCoach: TeamCoach(value: ""),
        homeTeamLogo: TeamLogo(value: ""),
        homeTeamStadium: Stadium(value: ""),
        homeTeamCapacity: StadiumCapacity(value: 0),

        //
        awayTeam: Team(value: ""),
        awayTeamAmh: Team(value: ""),
        awayTeamLineUp: TeamLineUp(value: const {}),
        awayTeamCity: TeamCity(value: ""),
        awayTeamCoach: TeamCoach(value: ""),
        awayTeamLogo: TeamLogo(value: ""),
        awayTeamStadium: Stadium(value: ""),
        awayTeamCapacity: StadiumCapacity(value: 0),
        score: Score(value: ''),
        fdr: 1,
      );
}
