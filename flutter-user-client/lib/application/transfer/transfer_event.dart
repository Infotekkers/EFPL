part of 'transfer_bloc.dart';

@freezed
class TransferEvent with _$TransferEvent {
  // gets users players
  const factory TransferEvent.getUserPlayers({required GameWeekId gameWeekId}) =
      _getUserPlayers;

// sets transfer player when clicked on a user player to transfer
  const factory TransferEvent.setTransferOutPlayer({
    required String transferOutPlayerId,
    required PlayerPosition playerPosition,
  }) = _setTransferOutPlayer;

// get list of players in position
  const factory TransferEvent.getPlayersInSelectedPosition() =
      _getPlayersInSelectedPosition;

// temporary transfer
  const factory TransferEvent.transferUserPlayer(
      {required String transferInPlayerId}) = _transferUserPlayer;

// Cancel Transfer
  const factory TransferEvent.cancelTransfer() = _cancelTransfer;

  const factory TransferEvent.saveUserPlayers() = _saveUserPlayers;
}
