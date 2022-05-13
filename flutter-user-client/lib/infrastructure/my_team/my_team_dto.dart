import 'package:efpl/domain/my_team/my_team.dart';
import 'package:efpl/domain/my_team/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_team_dto.freezed.dart';
part 'my_team_dto.g.dart';

@freezed
abstract class MyTeamDto implements _$MyTeamDto {
  const MyTeamDto._();

  const factory MyTeamDto({
    required String teamName,
    required String gameweek,
    required List<String> availableChips,
    required String activeChip,
    required Map players,
  }) = _MyTeamDto;

  factory MyTeamDto.fromDomain(MyTeam myTeam) {
    List<String> availableChipsStr = [];

    for (Chip chip in myTeam.availableChips.getOrCrash()) {
      availableChipsStr.add(chip.getOrCrash());
    }

    return MyTeamDto(
      teamName: myTeam.teamName.isValid() ? myTeam.teamName.getOrCrash() : '',
      gameweek: myTeam.gameweek.isValid() ? myTeam.gameweek.getOrCrash() : '',
      availableChips: availableChipsStr,
      activeChip:
          myTeam.activeChip.isValid() ? myTeam.activeChip.getOrCrash() : '',
      players: myTeam.players,
    );
  }

  MyTeam toDomain() {
    return MyTeam(
      activeChip: Chip(activeChip),
      availableChips: AvailableChips(availableChips, activeChip),
      gameweek: Gameweek(gameweek),
      teamName: TeamName(teamName),
    );
  }

  factory MyTeamDto.fromJson(Map<String, dynamic> json) =>
      _$MyTeamDtoFromJson(json);
}
