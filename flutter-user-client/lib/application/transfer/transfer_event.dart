part of 'transfer_bloc.dart';

@freezed
class TransferEvent with _$TransferEvent {
  const factory TransferEvent.getUserPlayers({required GameWeekId gameWeekId}) =
      _getUserPlayers;

  const factory TransferEvent.setTransferPlayerId(
      {required String transferPlayerId}) = _setTransferPlayerId;

  const factory TransferEvent.getPlayersInSelectedPosition(
      {required PlayerPosition playerPosition}) = _getPlayersInSelectedPosition;

  const factory TransferEvent.transferUserPlayer(
      {required String transferPlayerId}) = _transferUserPlayer;
  const factory TransferEvent.saveUserPlayers() = _saveUserPlayers;
}
