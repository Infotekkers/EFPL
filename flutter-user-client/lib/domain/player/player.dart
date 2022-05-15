import 'package:efpl/domain/player/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player.freezed.dart';

@freezed
abstract class Player with _$Player {
  const factory Player({
    required Name name,
    required Id playerId,
    required EplTeamId eplTeamId,
    required Position position,
    required Price currentPrice,
    required Availability availability,
    @Default(null) Score? score,
    @Default(null) History? history,
  }) = _Player;
}
