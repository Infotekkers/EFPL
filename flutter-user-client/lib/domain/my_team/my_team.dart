import 'package:efpl/domain/my_team/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_team.freezed.dart';

@freezed
abstract class MyTeam with _$MyTeam {
  const factory MyTeam({
    required TeamName teamName,
    required Gameweek activeGameweek,
    required AvailableChips availableChips,
    required Chip activeChip,
    @Default({'gk': [], 'def': [], 'mid': [], 'att': [], 'sub': []})
        Map<String, dynamic> players,
  }) = _MyTeam;
}

@freezed
abstract class MyTeamPlayer with _$MyTeamPlayer {
  const factory MyTeamPlayer({
    required PlayerName playerName,
    required PlayerId playerId,
    required EplTeamId eplTeamId,
    required Position position,
    required Multiplier multiplier,
    required IsCaptain isCaptain,
    required IsViceCaptain isViceCaptain,
  }) = _MyTeamPlayer;
}
