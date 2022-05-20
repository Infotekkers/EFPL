import 'package:efpl/domain/transfer/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'point_user_player.freezed.dart';

@freezed
abstract class PointUserPlayer with _$PointUserPlayer {
  const factory PointUserPlayer({
    required String playerId,
    required PlayerName playerName,
    required PlayerPosition playerPosition,
    required PlayerEplTeam eplTeamId,
    required int multiplier,
    required bool isCaptain,
    required bool isViceCaptain,
    required List score,
    // required PlayerAvailability availability,
    required String fixtureStatus,
    required String fixtureScore,
    required String fixtureTeams,
  }) = _PointUserPlayer;

  factory PointUserPlayer.initial() => PointUserPlayer(
        playerId: "",
        playerName: PlayerName(value: ""),
        playerPosition: PlayerPosition(value: ""),
        eplTeamId: PlayerEplTeam(value: ""),
        multiplier: 0,
        isCaptain: false,
        isViceCaptain: false,
        // availability: PlayerAvailability(
        //   value: const {"injuryStatus": "", "injuryMessage": ""},
        // ),
        score: [],
        fixtureStatus: "",
        fixtureScore: "",
        fixtureTeams: "",
      );
}
