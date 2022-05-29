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
    required Map availability,
    required String eplTeamLogo,
    required int score,
    required List upComingFixtures,
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
        availability: userPlayer.availability.isValid()
            ? userPlayer.availability.getOrCrash()
            : {"injuryStatus": "", "injuryMessage": ""},
        score: userPlayer.score,
        eplTeamLogo: userPlayer.eplTeamLogo,
        upComingFixtures: userPlayer.upComingFixtures,
      );

  UserPlayer toDomain() => UserPlayer(
        playerId: playerId.toString(),
        playerName: PlayerName(value: playerName),
        currentPrice: PlayerPrice(value: currentPrice),
        eplTeamId: PlayerEplTeam(value: eplTeamId),
        playerPosition: PlayerPosition(value: position),
        multiplier: int.parse(
          multiplier.toString(),
        ),
        isCaptain: isCaptain,
        isViceCaptain: isViceCaptain,
        availability: PlayerAvailability(value: availability),
        score: int.parse(
          score.toString(),
        ),
        eplTeamLogo: eplTeamLogo,
        upComingFixtures: upComingFixtures,
      );
  factory UserPlayerDTO.fromJson(Map<String, dynamic> json) =>
      _$UserPlayerDTOFromJson(json);
}
