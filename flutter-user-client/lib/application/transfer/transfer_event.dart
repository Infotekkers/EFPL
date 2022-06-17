part of 'transfer_bloc.dart';

@freezed
class TransferEvent with _$TransferEvent {
  // gets users players
  const factory TransferEvent.getUserPlayers() = _getUserPlayers;

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

  const factory TransferEvent.transferUserPlayerInitial(
      {required String transferInPlayerId}) = _transferUserPlayerInitial;

  const factory TransferEvent.transferOutUserPlayerInitial(
      {required String transferOutPlayerId}) = _transferOutUserPlayerInitial;

// Cancel Transfer
  const factory TransferEvent.cancelTransfer() = _cancelTransfer;

  const factory TransferEvent.cancelOneTransfer(
      {required String playerToCancelId}) = _cancelOneTransfer;

  const factory TransferEvent.saveUserPlayers(
      {required int gameWeekId, required bool isSetTeam}) = _saveUserPlayers;

  const factory TransferEvent.setFilter(
      {required String filterBy, required String filterValue}) = _setFilter;

  const factory TransferEvent.setSortFilter({required String sortBy}) =
      _setSortFilter;

  const factory TransferEvent.setPriceFilter(
      {required double minValue, required double maxValue}) = _setPriceFilter;

  const factory TransferEvent.filterByPrice() = _filterByPrice;

  const factory TransferEvent.setChip({required String chipName}) = _setChip;

  const factory TransferEvent.validateTeam({required BuildContext context}) =
      _validateTeam;

  const factory TransferEvent.setInitialSelection({required bool valueToSet}) =
      _setInitialSelection;

  const factory TransferEvent.cancelTransferFromConfirm() =
      _cancelTransferFromConfirm;

  const factory TransferEvent.setSearchQuery({required String query}) =
      _setSearchQuery;
}
