import 'package:efpl/domain/fixture/fixture.dart';
import 'package:efpl/domain/fixture/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fixture_dto.freezed.dart';

part 'fixture_dto.g.dart';

@freezed
abstract class FixtureDTO implements _$FixtureDTO {
  const FixtureDTO._();

  const factory FixtureDTO({
    required int gameWeekId,
    required String matchId,
    required String schedule,
    required String status,
    //
    required String homeTeam,
    required Map homeTeamLineUp,
    required String homeTeamCity,
    required String homeTeamCoach,
    required String homeTeamLogo,
    required int homeTeamCapacity,
    //
    required String awayTeam,
    required Map awayTeamLineUp,
    required String awayTeamCity,
    required String awayTeamCoach,
    required String awayTeamLogo,
    required int awayTeamCapacity,
    //
    required String score,
    required dynamic matchStat,
  }) = _FixtureDTO;

  factory FixtureDTO.fromDomain({required Fixture fixture}) => FixtureDTO(
        gameWeekId:
            fixture.gameWeekId.isValid() ? fixture.gameWeekId.getOrCrash() : '',
        matchId: fixture.matchId.isValid() ? fixture.matchId.getOrCrash() : '',
        schedule:
            fixture.schedule.isValid() ? fixture.schedule.getOrCrash() : '',
        status: fixture.status.isValid() ? fixture.status.getOrCrash() : '',

        //
        homeTeam:
            fixture.homeTeam.isValid() ? fixture.homeTeam.getOrCrash() : '',
        homeTeamLineUp: fixture.homeTeamLineUp.isValid()
            ? fixture.homeTeamLineUp.getOrCrash()
            : '',
        homeTeamCity: fixture.homeTeamCity.isValid()
            ? fixture.homeTeamCity.getOrCrash()
            : '',
        homeTeamCoach: fixture.homeTeamCoach.isValid()
            ? fixture.homeTeamCoach.getOrCrash()
            : '',
        homeTeamLogo: fixture.homeTeamLogo.isValid()
            ? fixture.homeTeamLogo.getOrCrash()
            : '',
        homeTeamCapacity: fixture.homeTeamCapacity.isValid()
            ? fixture.homeTeamCapacity.getOrCrash()
            : '',

        //
        awayTeam:
            fixture.awayTeam.isValid() ? fixture.awayTeam.getOrCrash() : '',
        awayTeamLineUp: fixture.awayTeamLineUp.isValid()
            ? fixture.awayTeamLineUp.getOrCrash()
            : '',
        awayTeamCity: fixture.awayTeamCity.isValid()
            ? fixture.awayTeamCity.getOrCrash()
            : '',
        awayTeamCoach: fixture.awayTeamCoach.isValid()
            ? fixture.awayTeamCoach.getOrCrash()
            : '',
        awayTeamLogo: fixture.awayTeamLogo.isValid()
            ? fixture.awayTeamLogo.getOrCrash()
            : '',
        awayTeamCapacity: fixture.awayTeamCapacity.isValid()
            ? fixture.awayTeamCapacity.getOrCrash()
            : '',

        //
        score: fixture.score.isValid() ? fixture.score.getOrCrash() : '',
        matchStat:
            fixture.matchStat!.isValid() ? fixture.matchId.getOrCrash() : '',
      );

  Fixture toDomain() => Fixture(
        gameWeekId: GameWeekId(value: gameWeekId),
        matchId: MatchId(value: matchId),
        schedule: Schedule(value: schedule),
        status: Status(value: status),
        homeTeam: Team(value: homeTeam),
        homeTeamLineUp: TeamLineUp(value: homeTeamLineUp),
        homeTeamCity: TeamCity(value: homeTeamCity),
        homeTeamCoach: TeamCoach(value: homeTeamCoach),
        homeTeamLogo: TeamLogo(value: homeTeamLogo),
        homeTeamCapacity: StadiumCapacity(value: homeTeamCapacity),
        //
        awayTeam: Team(value: awayTeam),
        awayTeamLineUp: TeamLineUp(value: awayTeamLineUp),
        awayTeamCity: TeamCity(value: awayTeamCity),
        awayTeamCoach: TeamCoach(value: awayTeamCoach),
        awayTeamLogo: TeamLogo(value: awayTeamLogo),
        awayTeamCapacity: StadiumCapacity(value: awayTeamCapacity),
        //
        score: Score(value: score),
        matchStat: MatchStat(value: matchStat),
      );
  factory FixtureDTO.fromJson(Map<String, dynamic> json) =>
      _$FixtureDTOFromJson(json);
}
