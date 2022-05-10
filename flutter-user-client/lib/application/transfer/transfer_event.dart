part of 'transfer_bloc.dart';

@freezed
class TransferEvent with _$TransferEvent {
  const factory TransferEvent.getUserPlayers({required GameWeekId gameWeekId}) =
      _getUserPlayers;

  const factory TransferEvent.setSelectedPosition(
      {required PlayerPosition selectedPlayerPosition}) = _setSelectedPosition;

  const factory TransferEvent.getPlayersInSelectedPosition() =
      _getPlayersInSelectedPosition;

  const factory TransferEvent.transferUserPlayer(
      {required String transferPlayerId}) = _transferUserPlayer;
  const factory TransferEvent.saveUserPlayers() = _saveUserPlayers;
}
