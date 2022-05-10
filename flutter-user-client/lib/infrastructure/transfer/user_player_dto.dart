import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_player_dto.freezed.dart';

part 'user_player_dto.g.dart';

@freezed
abstract class UserPlayerDTO implements _$UserPlayerDTO {
  const UserPlayerDTO._();

  const factory UserPlayerDTO({
    required String playerId,
    required String playerName,
    required double currentPrice,
    required String position,
    required String eplTeamId,
    required int multiplier,
    required bool isCaptain,
    required bool isViceCaptain,
  }) = _UserPlayerDTO;

  factory UserPlayerDTO.fromDomain({required UserPlayer userPlayer}) =>
      UserPlayerDTO(
        playerId: userPlayer.playerId,
        playerName: userPlayer.playerName.isValid()
            ? userPlayer.playerName.getOrCrash()
            : '',
        position: userPlayer.playerPosition.isValid()
            ? userPlayer.playerPosition.getOrCrash()
            : '',
        currentPrice: userPlayer.currentPrice.isValid()
            ? userPlayer.currentPrice.getOrCrash()
            : '',
        eplTeamId: userPlayer.eplTeamId.isValid()
            ? userPlayer.eplTeamId.getOrCrash()
            : '',
        multiplier: userPlayer.multiplier,
        isCaptain: userPlayer.isCaptain,
        isViceCaptain: userPlayer.isViceCaptain,
      );

  UserPlayer toDomain() => UserPlayer(
        playerId: playerId,
        playerName: PlayerName(value: playerName),
        currentPrice: PlayerPrice(value: currentPrice),
        eplTeamId: PlayerEplTeam(value: eplTeamId),
        playerPosition: PlayerPosition(value: position),
        multiplier: multiplier,
        isCaptain: isCaptain,
        isViceCaptain: isViceCaptain,
      );
  factory UserPlayerDTO.fromJson(Map<String, dynamic> json) =>
      _$UserPlayerDTOFromJson(json);
}
