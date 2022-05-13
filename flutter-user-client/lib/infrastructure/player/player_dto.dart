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
    required String id,
    required String eplTeamId,
    required String position,
    required String multiplier,
    required bool isCaptain,
    required bool isViceCaptain,
  }) = _PlayerDto;

  factory PlayerDto.fromDomain(Player player) => PlayerDto(
        name: player.name.isValid() ? player.name.getOrCrash() : '',
        id: player.id.isValid() ? player.id.getOrCrash() : '',
        eplTeamId:
            player.eplTeamId.isValid() ? player.eplTeamId.getOrCrash() : ' ',
        position:
            player.position.isValid() ? player.position.getOrCrash() : ' ',
        multiplier: player.multiplier.getOrCrash().toString(),
        isCaptain: player.isCaptain.getOrCrash(),
        isViceCaptain: player.isViceCaptain.getOrCrash(),
      );

  Player toDomain() => Player(
      name: Name(name),
      id: Id(id),
      eplTeamId: EplTeamId(eplTeamId),
      position: Position(position),
      multiplier: Multiplier(multiplier),
      isCaptain: IsCaptain(isCaptain),
      isViceCaptain: IsViceCaptain(isViceCaptain));

  factory PlayerDto.fromJson(Map<String, dynamic> json) =>
      _$PlayerDtoFromJson(json);
}
