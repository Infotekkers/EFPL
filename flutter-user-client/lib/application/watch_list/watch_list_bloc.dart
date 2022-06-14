import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/watch_list/i_watch_list_facade.dart';
import 'package:efpl/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'watch_list_event.dart';
part 'watch_list_state.dart';
part 'watch_list_bloc.freezed.dart';

@lazySingleton
class WatchListBloc extends Bloc<WatchListEvent, WatchListState> {
  final IWatchListRepository _iWatchListRepository;

  WatchListBloc(this._iWatchListRepository) : super(WatchListState.initial()) {
    // get user watchList
    on<_getUserWatchList>((event, emit) async {
      // Loader
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );

      // repo call
      final Either<dynamic, List<List<dynamic>>> failureOrSuccess =
          await _iWatchListRepository.getUserWatchListPlayers();

      // get team from response
      final List<dynamic> watchListPlayer = failureOrSuccess.fold(
        (l) => l[0],
        (r) => r[0],
      );

      final List<dynamic> allTeams = failureOrSuccess.fold(
        (l) => l[1],
        (r) => r[1],
      );

      emit(
        state.copyWith(
          isLoading: false,
          allWatchListPlayers: watchListPlayer,
          filteredWatchListPlayers: watchListPlayer,
          failureOrSuccess: some(failureOrSuccess),
          allTeams: allTeams,
        ),
      );
    });

    // add to user watch list
    on<_addToUserWatchList>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      // add to save
      final Either<dynamic, bool> failureOrSuccess =
          await _iWatchListRepository.addPlayerToWatchList(
        playerId: event.playerId,
      );

      final bool isAddValue = failureOrSuccess.fold((l) => false, (r) => r);

      getIt<WatchListBloc>().add(const WatchListEvent.getUserWatchList());

      //
      emit(
        state.copyWith(
          isLoading: false,
          isAddedSuccessfully: isAddValue,
        ),
      );
    });

    // removing user watch list
    on<_removeFromUserWatchList>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      // add to save
      await _iWatchListRepository.removePlayerFromWatchList(
        playerId: event.playerId,
      );

      getIt<WatchListBloc>().add(const WatchListEvent.getUserWatchList());

      //
      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
    });

    // clear user watch list
    on<_clearUserWatchList>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      // add to save
      await _iWatchListRepository.clearWatchList();

      getIt<WatchListBloc>().add(const WatchListEvent.getUserWatchList());

      //
      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
    });

    on<_setFilter>(
      (event, emit) async {
        // set loading
        emit(
          state.copyWith(
            isLoading: true,
          ),
        );

        // get filter info
        String filterBy = event.filterBy;
        String filterValue = event.filterValue;

        // get all players
        List<dynamic> allWatchListPlayers = state.allWatchListPlayers;

        // check filter by
        if (filterBy == "team") {
          if (filterValue == "Select a Team" || filterValue == "") {
            emit(
              state.copyWith(
                isLoading: false,
                filteredWatchListPlayers: state.allTeams,
                selectedDropDownTeamValue: "Select a Team",
              ),
            );
          } else {
            List<dynamic> newFilteredPlayers = allWatchListPlayers
                .where(
                  (player) =>
                      player.eplTeamId.value.fold((l) => '', (r) => r) ==
                      filterValue,
                )
                .toList();

            emit(
              state.copyWith(
                isLoading: false,
                filteredWatchListPlayers: newFilteredPlayers,
                selectedDropDownTeamValue: event.filterValue,
              ),
            );
          }
        } else if (filterBy == "injury status") {
          if (filterValue == "All" || filterValue == "") {
            emit(
              state.copyWith(
                isLoading: false,
                filteredWatchListPlayers: state.allWatchListPlayers,
                selectedDropDownInjuryStatusValue: "All",
              ),
            );
          }
          //
          else if (filterValue == "Available") {
            List<dynamic> allFilteredPlayers = state.allWatchListPlayers
                .where(
                  (player) =>
                      player.availability.value.fold(
                        (l) => '',
                        (r) => r['injuryStatus'],
                      ) ==
                      '',
                )
                .toList();

            emit(
              state.copyWith(
                isLoading: false,
                filteredWatchListPlayers: allFilteredPlayers,
                selectedDropDownInjuryStatusValue: event.filterValue,
              ),
            );
          }
          //
          else if (filterValue == "Unavailable") {
            List<dynamic> allFilteredPlayers = state.allWatchListPlayers
                .where(
                  (player) =>
                      player.availability.value.fold(
                        (l) => '',
                        (r) => r['injuryStatus'],
                      ) !=
                      '',
                )
                .toList();

            emit(
              state.copyWith(
                isLoading: false,
                filteredWatchListPlayers: allFilteredPlayers,
                selectedDropDownInjuryStatusValue: event.filterValue,
              ),
            );
          }
        }
      },
    );

    on<_setSortFilter>(
      (event, emit) async {
        // set loading
        emit(
          state.copyWith(
            isLoading: true,
          ),
        );

        List<dynamic> allPlayersFiltered = state.filteredWatchListPlayers;

        // check sort value
        if (event.sortBy == "name") {
          // get state
          String currentSort = state.playerNameCurrentSortOrder;

          if (currentSort == "" || currentSort == 'd') {
            allPlayersFiltered.sort(
              (a, b) => a.playerName.value
                  .fold(
                    (l) => '',
                    (r) => r,
                  )
                  .compareTo(
                    b.playerName.value.fold(
                      (l) => '',
                      (r) => r,
                    ),
                  ),
            );
          } else {
            allPlayersFiltered.sort(
              (a, b) => b.playerName.value
                  .fold(
                    (l) => '',
                    (r) => r,
                  )
                  .compareTo(
                    a.playerName.value.fold(
                      (l) => '',
                      (r) => r,
                    ),
                  ),
            );
          }

          emit(
            state.copyWith(
              isLoading: false,
              filteredWatchListPlayers: allPlayersFiltered,
              playerNameCurrentSortOrder:
                  currentSort == "d" || currentSort == "" ? "a" : "d",
              playerPriceCurrentSortOrder: "",
              playerScoreCurrentSortOrder: "",
            ),
          );
        }
        //
        else if (event.sortBy == "price") {
          String currentSort = state.playerPriceCurrentSortOrder;

          if (currentSort == "" || currentSort == 'd') {
            allPlayersFiltered.sort(
              (a, b) => a.currentPrice.value
                  .fold(
                    (l) => 0.0,
                    (r) => r,
                  )
                  .compareTo(
                    b.currentPrice.value.fold(
                      (l) => 0.0,
                      (r) => r,
                    ),
                  ),
            );
          }
          //
          else {
            allPlayersFiltered.sort(
              (a, b) => b.currentPrice.value
                  .fold(
                    (l) => 0.0,
                    (r) => r,
                  )
                  .compareTo(
                    a.currentPrice.value.fold(
                      (l) => 0.0,
                      (r) => r,
                    ),
                  ),
            );
          }

          emit(
            state.copyWith(
              isLoading: false,
              filteredWatchListPlayers: allPlayersFiltered,
              playerPriceCurrentSortOrder:
                  currentSort == "d" || currentSort == "" ? "a" : "d",
              playerNameCurrentSortOrder: "",
              playerScoreCurrentSortOrder: "",
            ),
          );
        }
        //
        else if (event.sortBy == "point") {
          // get state
          String currentSort = state.playerScoreCurrentSortOrder;

          if (currentSort == "" || currentSort == 'd') {
            allPlayersFiltered.sort(
              (a, b) => a.score.compareTo(b.score),
            );
          } else {
            allPlayersFiltered.sort(
              (a, b) => b.score.compareTo(a.score),
            );
          }

          emit(
            state.copyWith(
              isLoading: false,
              filteredWatchListPlayers: allPlayersFiltered,
              playerScoreCurrentSortOrder:
                  currentSort == "d" || currentSort == "" ? "a" : "d",
              playerPriceCurrentSortOrder: "",
              playerNameCurrentSortOrder: "",
            ),
          );
        }
      },
    );

    on<_setPriceFilter>(
      (event, emit) async {
        emit(
          state.copyWith(
            // isLoading: true,
            minPriceSet: event.minValue,
            maxPriceSet: event.maxValue,
          ),
        );
      },
    );

    on<_filterByPrice>(
      (event, emit) async {
        emit(
          state.copyWith(
            isLoading: true,
          ),
        );
        List<dynamic> allPriceFilteredPlayers = state.allWatchListPlayers
            .where(
              (player) =>
                  player.currentPrice.value.fold(
                        (l) => 0.0,
                        (r) => r,
                      ) <
                      state.maxPriceSet &&
                  player.currentPrice.value.fold(
                        (l) => 0.0,
                        (r) => r,
                      ) >
                      state.minPriceSet,
            )
            .toList();

        emit(
          state.copyWith(
            isLoading: false,
            filteredWatchListPlayers: allPriceFilteredPlayers,
          ),
        );
      },
    );
  }
}
