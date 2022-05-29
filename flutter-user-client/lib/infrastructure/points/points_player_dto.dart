import 'package:efpl/domain/points/point_user_player.dart';
import 'package:efpl/domain/transfer/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'points_player_dto.freezed.dart';
part 'points_player_dto.g.dart';

@freezed
abstract class PointUserPlayerDTO implements _$PointUserPlayerDTO {
  const PointUserPlayerDTO._();

  const factory PointUserPlayerDTO(
      {required String playerId,
      required String playerName,
      required String playerPosition,
      required String eplTeamId,
      required int multiplier,
      required bool isCaptain,
      required bool isViceCaptain,
      required List score,
      // required PlayerAvailability availability,
      required String fixtureStatus,
      required String fixtureScore,
      required String fixtureTeams}) = _PointUserPlayerDTO;

  factory PointUserPlayerDTO.fromDomain(PointUserPlayer pointUserPlayer) {
    return PointUserPlayerDTO(
      playerId: '',
      playerName: pointUserPlayer.playerName.isValid()
          ? pointUserPlayer.playerName.getOrCrash()
          : '',
      playerPosition: pointUserPlayer.playerPosition.isValid()
          ? pointUserPlayer.playerPosition.getOrCrash()
          : "",
      eplTeamId: pointUserPlayer.eplTeamId.isValid()
          ? pointUserPlayer.eplTeamId.getOrCrash()
          : '',
      multiplier: pointUserPlayer.multiplier,
      isCaptain: pointUserPlayer.isCaptain,
      isViceCaptain: pointUserPlayer.isViceCaptain,
      score: pointUserPlayer.score,
      // availability: pointUserPlayer.availability,
      fixtureStatus: pointUserPlayer.fixtureStatus,
      fixtureScore: pointUserPlayer.fixtureScore,
      fixtureTeams: pointUserPlayer.fixtureTeams,
    );
  }

  PointUserPlayer toDomain() {
    return PointUserPlayer(
      playerId: playerId,
      playerName: PlayerName(value: playerName),
      playerPosition: PlayerPosition(value: playerPosition),
      eplTeamId: PlayerEplTeam(value: eplTeamId),
      multiplier: multiplier,
      isCaptain: isCaptain,
      isViceCaptain: isViceCaptain,
      score: score,
      // availability: availability,
      fixtureStatus: fixtureStatus,
      fixtureScore: fixtureScore,
      fixtureTeams: fixtureTeams,
    );
  }

  factory PointUserPlayerDTO.fromJson(Map<String, dynamic> json) =>
      _$PointUserPlayerDTOFromJson(json);
}
