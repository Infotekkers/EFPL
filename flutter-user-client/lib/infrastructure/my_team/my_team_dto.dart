import 'package:efpl/domain/my_team/my_team.dart';
import 'package:efpl/domain/my_team/value_objects.dart';
import 'package:efpl/domain/player/player.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_team_dto.freezed.dart';
part 'my_team_dto.g.dart';

@freezed
abstract class MyTeamDto implements _$MyTeamDto {
  const MyTeamDto._();

  const factory MyTeamDto({
    required String teamName,
    required String activeGameweek,
    required List<String> availableChips,
    required String activeChip,
    required Map<String, dynamic> players,
  }) = _MyTeamDto;

  factory MyTeamDto.fromDomain(MyTeam myTeam) {
    List<String> availableChipsStr = [];

    for (Chip chip in myTeam.availableChips.getOrCrash()) {
      availableChipsStr.add(chip.getOrCrash());
    }

    return MyTeamDto(
      teamName: myTeam.teamName.isValid() ? myTeam.teamName.getOrCrash() : '',
      activeGameweek: myTeam.activeGameweek.isValid()
          ? myTeam.activeGameweek.getOrCrash()
          : '',
      availableChips: availableChipsStr,
      activeChip:
          myTeam.activeChip.isValid() ? myTeam.activeChip.getOrCrash() : '',
      players: myTeam.players,
    );
  }

  MyTeam toDomain() {
    final Map<String, dynamic> organizedPlayers = {
      'gk': [],
      'def': [],
      'mid': [],
      'att': [],
      'sub': [],
    };

    players.forEach((position, players) {
      organizedPlayers[position] = PositionalContainer(players, position);
    });

    return MyTeam(
      activeChip: Chip(activeChip),
      availableChips: AvailableChips(availableChips, activeChip),
      activeGameweek: Gameweek(activeGameweek),
      teamName: TeamName(teamName),
      players: organizedPlayers,
    );
  }

  factory MyTeamDto.fromJson(Map<String, dynamic> json) =>
      _$MyTeamDtoFromJson(json);
}
