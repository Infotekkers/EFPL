import 'package:efpl/domain/transfer/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_player.freezed.dart';

@freezed
abstract class UserPlayer with _$UserPlayer {
  const factory UserPlayer({
    required String playerId,
    required PlayerName playerName,
    required PlayerPrice currentPrice,
    required PlayerPosition playerPosition,
    required PlayerEplTeam eplTeamId,
    required String eplTeamLogo,
    required int multiplier,
    required bool isCaptain,
    required bool isViceCaptain,
    required PlayerAvailability availability,
    required int score,
    required List upComingFixtures,
  }) = _UserPlayer;

  factory UserPlayer.initial() => UserPlayer(
        playerId: "0",
        playerName: PlayerName(value: ""),
        currentPrice: PlayerPrice(value: 0),
        playerPosition: PlayerPosition(value: ""),
        eplTeamId: PlayerEplTeam(value: ""),
        multiplier: 1,
        isCaptain: false,
        isViceCaptain: false,
        availability: PlayerAvailability(
          value: const {"injuryStatus": "", "injuryMessage": ""},
        ),
        eplTeamLogo: "",
        score: 0,
        upComingFixtures: [],
      );
}
