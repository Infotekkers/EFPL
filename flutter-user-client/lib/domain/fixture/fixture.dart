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
    required Team homeTeam,
    required Team awayTeam,
    required TeamLineUp homeTeamLineUp,
    required TeamLineUp awayTeamLineUp,
    required Score score,
    required MatchStat matchStat,
  }) = _Fixture;

  factory Fixture.initial() => Fixture(
        gameWeekId: GameWeekId(value: 0),
        matchId: MatchId(value: ""),
        schedule: Schedule(value: ""),
        status: Status(value: ""),
        homeTeam: Team(value: ""),
        awayTeam: Team(value: ""),
        homeTeamLineUp: TeamLineUp(value: const []),
        awayTeamLineUp: TeamLineUp(value: const []),
        score: Score(value: ''),
        matchStat: MatchStat(value: const []),
      );
}
