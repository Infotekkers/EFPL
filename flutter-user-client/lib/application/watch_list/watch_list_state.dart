part of 'watch_list_bloc.dart';

@freezed
class WatchListState with _$WatchListState {
  const factory WatchListState({
    required List<dynamic> allWatchListPlayers,
    required List<dynamic> filteredWatchListPlayers,
    required String selectedDropDownTeamValue,
    required String selectedDropDownInjuryStatusValue,
    required bool isLoading,
    required Option<Either<dynamic, List<dynamic>>> failureOrSuccess,
    // sort values
    required String playerNameCurrentSortOrder,
    required String playerPriceCurrentSortOrder,
    required String playerScoreCurrentSortOrder,
    required List<dynamic> allTeams,

    // price range values
    required double minPriceSet,
    required double maxPriceSet,
    required bool isAddedSuccessfully,
    required bool isRemovedSuccessfully,
    required bool isClearedSuccessfully,
  }) = _WatchListState;

  factory WatchListState.initial() => WatchListState(
        allWatchListPlayers: [],
        isLoading: false,
        failureOrSuccess: none(),
        filteredWatchListPlayers: [],
        selectedDropDownInjuryStatusValue: "All",
        selectedDropDownTeamValue: "Select a Team",
        playerNameCurrentSortOrder: "",
        playerPriceCurrentSortOrder: "",
        playerScoreCurrentSortOrder: "",
        minPriceSet: 3.5,
        maxPriceSet: 15.0,
        allTeams: [],
        isAddedSuccessfully: false,
        isClearedSuccessfully: false,
        isRemovedSuccessfully: false,
      );
}
