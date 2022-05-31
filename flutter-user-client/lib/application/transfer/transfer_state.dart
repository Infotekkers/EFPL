part of 'transfer_bloc.dart';

@freezed
class TransferState with _$TransferState {
  const factory TransferState({
    // list of user players and chips...
    required UserTeam userTeam,
    // enable disable loading animation
    required bool isLoading,
    // if transfer is made or not to show buttons
    required bool transfersMade,
    // number of transfers made
    required int transfersMadeCount,
    // amount of money left
    required double remainingInBank,
    // id of player to transfer out
    required String transferOutPlayerId,
    // position of player to transfer - helps fetch from api
    required PlayerPosition selectedPlayerPosition,
    // ids of all players transferred in
    required List transferredInPlayerIdList,
    // keep track of what player is transferred for what player {transferredOut:transferredIn}
    required List swappedPlayerIdsList,
    // list of all players in selected position
    required List<UserPlayer> selectedPlayerReplacements,
    required List<UserPlayer> filteredSelectedPlayerReplacements,
    required String selectedDropDownTeamValue,
    required String selectedDropDownInjuryStatusValue,

    // sort values
    required String playerNameCurrentSortOrder,
    required String playerPriceCurrentSortOrder,
    required String playerScoreCurrentSortOrder,

    // price range values
    required double minPriceSet,
    required double maxPriceSet,
    required Option<Either<dynamic, dynamic>> valueFailureOrSuccess,
    required double priceExceededBy,
    required String countExceededTeam,
    required bool isInitialSelection,
  }) = _TransferState;

  factory TransferState.initial() => TransferState(
        userTeam: UserTeam(
          gameWeekId: GameWeekId(value: 1),
          gameWeekDeadline: "",
          allUserPlayers: [],
          freeTransfers: 0,
          deduction: 0,
          activeChip: "",
          availableChips: [],
          maxBudget: 0,
          teamName: "",
        ),
        isLoading: false,
        remainingInBank: 0.0,
        transferOutPlayerId: "",
        selectedPlayerPosition: PlayerPosition(value: ""),
        transfersMade: false,
        transfersMadeCount: 0,
        transferredInPlayerIdList: [],
        selectedPlayerReplacements: [],
        filteredSelectedPlayerReplacements: [],
        swappedPlayerIdsList: [],
        valueFailureOrSuccess: none(),
        selectedDropDownTeamValue: "Select a Team",
        selectedDropDownInjuryStatusValue: "All",
        playerNameCurrentSortOrder: "",
        playerPriceCurrentSortOrder: "",
        playerScoreCurrentSortOrder: "",
        minPriceSet: 3.5,
        maxPriceSet: 15.0,
        priceExceededBy: 0.0,
        countExceededTeam: "",
        isInitialSelection: false,
      );
}
