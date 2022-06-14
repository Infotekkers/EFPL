import 'package:efpl/domain/transfer/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'watch_list_player.freezed.dart';

@freezed
abstract class WatchListPlayer with _$WatchListPlayer {
  const factory WatchListPlayer({
    required String playerId,
    required PlayerName playerName,
    required PlayerPrice currentPrice,
    required PlayerPosition playerPosition,
    required PlayerEplTeam eplTeamId,
    required String eplTeamLogo,
    required PlayerAvailability availability,
    required int score,
    required List upComingFixtures,
  }) = _WatchListPlayer;

  factory WatchListPlayer.initial() => WatchListPlayer(
        playerId: "0",
        playerName: PlayerName(value: ""),
        currentPrice: PlayerPrice(value: 0),
        playerPosition: PlayerPosition(value: ""),
        eplTeamId: PlayerEplTeam(value: ""),
        availability: PlayerAvailability(
          value: const {"injuryStatus": "", "injuryMessage": ""},
        ),
        eplTeamLogo: "",
        score: 0,
        upComingFixtures: [],
      );
}
