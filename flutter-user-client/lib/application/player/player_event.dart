part of 'player_bloc.dart';

@freezed
abstract class PlayerEvent with _$PlayerEvent {
  const factory PlayerEvent.getPlayer(String playerId) = _GetPlayer;
}
