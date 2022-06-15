import 'package:efpl/domain/transfer/value_objects.dart';
import 'package:efpl/domain/watch_list/watch_list_player.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'watch_list_dto.freezed.dart';

part 'watch_list_dto.g.dart';

@freezed
abstract class WatchPlayerListDTO implements _$WatchPlayerListDTO {
  const WatchPlayerListDTO._();

  const factory WatchPlayerListDTO({
    required String playerId,
    required String playerName,
    required double currentPrice,
    required String position,
    required String eplTeamId,
    required Map availability,
    required String eplTeamLogo,
    required int score,
    required List upComingFixtures,
  }) = _WatchPlayerListDTO;

  factory WatchPlayerListDTO.fromDomain(
          {required WatchListPlayer watchListPlayer}) =>
      WatchPlayerListDTO(
        playerId: watchListPlayer.playerId,
        playerName: watchListPlayer.playerName.isValid()
            ? watchListPlayer.playerName.getOrCrash()
            : '',
        position: watchListPlayer.playerPosition.isValid()
            ? watchListPlayer.playerPosition.getOrCrash()
            : '',
        currentPrice: watchListPlayer.currentPrice.isValid()
            ? watchListPlayer.currentPrice.getOrCrash()
            : '',
        eplTeamId: watchListPlayer.eplTeamId.isValid()
            ? watchListPlayer.eplTeamId.getOrCrash()
            : '',
        availability: watchListPlayer.availability.isValid()
            ? watchListPlayer.availability.getOrCrash()
            : {"injuryStatus": "", "injuryMessage": ""},
        score: watchListPlayer.score,
        eplTeamLogo: watchListPlayer.eplTeamLogo,
        upComingFixtures: watchListPlayer.upComingFixtures,
      );

  WatchListPlayer toDomain() => WatchListPlayer(
        playerId: playerId.toString(),
        playerName: PlayerName(value: playerName),
        currentPrice: PlayerPrice(value: currentPrice),
        eplTeamId: PlayerEplTeam(value: eplTeamId),
        playerPosition: PlayerPosition(value: position),
        availability: PlayerAvailability(value: availability),
        score: int.parse(
          score.toString(),
        ),
        eplTeamLogo: eplTeamLogo,
        upComingFixtures: upComingFixtures,
      );
  factory WatchPlayerListDTO.fromJson(Map<String, dynamic> json) =>
      _$WatchPlayerListDTOFromJson(json);
}
