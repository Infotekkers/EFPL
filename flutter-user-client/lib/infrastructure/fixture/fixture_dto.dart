import 'package:efpl/domain/fixture/fixture.dart';
import 'package:efpl/domain/fixture/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fixture_dto.freezed.dart';

part 'fixture_dto.g.dart';

@freezed
abstract class FixtureDTO implements _$FixtureDTO {
  const FixtureDTO._();

  const factory FixtureDTO({
    required int gameweekId,
    required String matchId,
    required String schedule,
    required String status,
    required String homeTeam,
    required String awayTeam,
    required List homeTeamLineUp,
    required List awayTeamLineUp,
    required String score,
    required List matchStat,
  }) = _FixtureDTO;

  factory FixtureDTO.fromDomain({required Fixture fixture}) => FixtureDTO(
        gameweekId:
            fixture.gameWeekId.isValid() ? fixture.gameWeekId.getOrCrash() : '',
        matchId: fixture.matchId.isValid() ? fixture.matchId.getOrCrash() : '',
        schedule:
            fixture.schedule.isValid() ? fixture.schedule.getOrCrash() : '',
        status: fixture.status.isValid() ? fixture.status.getOrCrash() : '',
        homeTeam:
            fixture.homeTeam.isValid() ? fixture.homeTeam.getOrCrash() : '',
        awayTeam:
            fixture.awayTeam.isValid() ? fixture.awayTeam.getOrCrash() : '',
        homeTeamLineUp: fixture.homeTeamLineUp.isValid()
            ? fixture.homeTeamLineUp.getOrCrash()
            : '',
        awayTeamLineUp: fixture.awayTeamLineUp.isValid()
            ? fixture.awayTeamLineUp.getOrCrash()
            : '',
        score: fixture.score.isValid() ? fixture.score.getOrCrash() : '',
        matchStat:
            fixture.matchStat.isValid() ? fixture.matchId.getOrCrash() : '',
      );

  Fixture toDomain() => Fixture(
        gameWeekId: GameWeekId(value: gameweekId),
        matchId: MatchId(value: matchId),
        schedule: Schedule(value: schedule),
        status: Status(value: status),
        homeTeam: Team(value: homeTeam),
        awayTeam: Team(value: awayTeam),
        homeTeamLineUp: TeamLineUp(value: homeTeamLineUp),
        awayTeamLineUp: TeamLineUp(value: awayTeamLineUp),
        score: Score(value: score),
        matchStat: MatchStat(value: matchStat),
      );
  factory FixtureDTO.fromJson(Map<String, dynamic> json) =>
      _$FixtureDTOFromJson(json);
}
