import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import 'package:efpl/domain/transfer/i_user_players_facade.dart';
import 'package:efpl/domain/transfer/transfer_failures.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/user_team.dart';
import 'package:efpl/domain/transfer/value_objects.dart';
import 'package:efpl/infrastructure/transfer/transfer_local_data_provider.dart';
import 'package:efpl/injectable.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'transfer_event.dart';
part 'transfer_state.dart';
part 'transfer_bloc.freezed.dart';

@lazySingleton
class TransferBloc extends Bloc<TransferEvent, TransferState> {
  final ITransferRepository _iTransferRepository;

  TransferBloc(this._iTransferRepository)
      : super(
          TransferState.initial(),
        ) {
    on<_getUserPlayers>((event, emit) async {
      // Start spinner
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );

      // get team from api
      final Either<dynamic, UserTeam> failureOrSuccess =
          await _iTransferRepository.getUserPlayers();

      // get team from response
      final UserTeam userTeam = failureOrSuccess.fold(
        (l) => l[0],
        (r) => r,
      );

      // sum cost of all user players
      double playerCostSum = 0.0;

      for (var element in userTeam.allUserPlayers) {
        double currentPlayerPrice =
            element.currentPrice.value.fold((l) => 0, (r) => r);

        playerCostSum = playerCostSum + currentPlayerPrice;
      }

      // emit final state
      emit(
        state.copyWith(
          userTeam: userTeam,
          isLoading: false,
          valueFailureOrSuccess: some(failureOrSuccess),
          remainingInBank: userTeam.maxBudget - playerCostSum,
        ),
      );
    });

    on<_getPlayersInSelectedPosition>((event, emit) async {
      // start spinner
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );

      // get all players in position from api
      final Either<dynamic, List<UserPlayer>> failureOrSuccess =
          await _iTransferRepository.getAllPositionPlayers(
        playerPosition:
            state.selectedPlayerPosition.value.fold((l) => "", (r) => r),
      );

      // get list of all players from response
      List<UserPlayer> allSelectedPlayerReplacements = failureOrSuccess.fold(
        (l) => l[0],
        (r) => r,
      );

      // emit final state
      emit(
        state.copyWith(
          isLoading: false,
          valueFailureOrSuccess: some(failureOrSuccess),
          selectedPlayerReplacements: allSelectedPlayerReplacements,
          filteredSelectedPlayerReplacements: allSelectedPlayerReplacements,
          selectedDropDownTeamValue: "Select a Team",
        ),
      );
    });

    on<_setTransferOutPlayer>((event, emit) {
      emit(
        state.copyWith(
          transferOutPlayerId: event.transferOutPlayerId,
          selectedPlayerPosition: event.playerPosition,
        ),
      );
    });

    on<_transferUserPlayerInitial>((event, emit) {
      // Loading
      emit(state.copyWith(
        isLoading: true,
      ));

      // get current user player list
      List<UserPlayer> allUserPlayers = state.userTeam.allUserPlayers;

      // find player to add
      List<UserPlayer> allPlayers = state.selectedPlayerReplacements;
      UserPlayer playerToTransferIn = allPlayers
          .where(
            (player) => player.playerId == event.transferInPlayerId,
          )
          .toList()[0];

      // move in player
      allUserPlayers.add(playerToTransferIn);

      // update user team
      UserTeam newUserTeam = UserTeam(
        gameWeekId: state.userTeam.gameWeekId,
        gameWeekDeadline: state.userTeam.gameWeekDeadline,
        allUserPlayers: allUserPlayers,
        freeTransfers: state.userTeam.freeTransfers,
        deduction: 0,
        activeChip: state.userTeam.activeChip,
        availableChips: state.userTeam.availableChips,
        maxBudget: state.userTeam.maxBudget,
        teamName: state.userTeam.teamName,
      );

      // calculate new price sum of players
      double playerCostSum = 0.0;
      for (var player in allUserPlayers) {
        double currentPlayerCost = player.currentPrice.value.fold(
          (l) => 0,
          (r) => r,
        );

        playerCostSum = playerCostSum + currentPlayerCost;
      }

      // emit final state
      emit(
        state.copyWith(
          userTeam: newUserTeam,
          isLoading: false,
          transfersMade: true,
          transfersMadeCount: state.transfersMadeCount + 1,
          remainingInBank: state.userTeam.maxBudget - playerCostSum,
        ),
      );
    });

    on<_transferOutUserPlayerInitial>((event, emit) async {
      //  remove player
      List<UserPlayer> allUserPlayers = state.userTeam.allUserPlayers;

      allUserPlayers.removeWhere(
        (player) => player.playerId == event.transferOutPlayerId,
      );

      // emit state
      emit(state.copyWith(
        transfersMadeCount: state.transfersMadeCount - 1,
        transfersMade: state.transfersMadeCount - 1 == 0 ? false : true,
      ));
    });

    on<_transferUserPlayer>(
      (event, emit) {
        // start spinner
        emit(state.copyWith(
          isLoading: true,
        ));

        // find player to move out
        List<UserPlayer> allUserPlayers = state.userTeam.allUserPlayers;
        UserPlayer playerToMoveOut = allUserPlayers
            .where(
              (player) => player.playerId == state.transferOutPlayerId,
            )
            .toList()[0];

        int playerToMoveOutMultiplier = playerToMoveOut.multiplier;
        bool playerToMoveOutCaptainStatus = playerToMoveOut.isCaptain;
        bool playerToMoveOutViceCaptainStatus = playerToMoveOut.isViceCaptain;

        // find index of player to move out
        int indexOfPlayerToTransferOut = 0;
        for (var i = 0; i < allUserPlayers.length; i++) {
          if (allUserPlayers[i].playerId == state.transferOutPlayerId) {
            indexOfPlayerToTransferOut = i;
          }
        }

        // move out player
        allUserPlayers.removeWhere(
            (player) => player.playerId == state.transferOutPlayerId);

        // find player to move in
        List<UserPlayer> allPlayers = state.selectedPlayerReplacements;
        UserPlayer playerToTransferIn = allPlayers
            .where(
              (player) => player.playerId == event.transferInPlayerId,
            )
            .toList()[0];

        // move in player at index
        playerToTransferIn = playerToTransferIn.copyWith(
          multiplier: playerToMoveOutMultiplier,
          isCaptain: playerToMoveOutCaptainStatus,
          isViceCaptain: playerToMoveOutViceCaptainStatus,
        );
        allUserPlayers.insert(indexOfPlayerToTransferOut, playerToTransferIn);

        // create a map of swaps
        Map newSwapInfo = {};
        newSwapInfo[state.transferOutPlayerId] = event.transferInPlayerId;

        List newSwapperPlayersIdsList = state.swappedPlayerIdsList;
        newSwapperPlayersIdsList.add(newSwapInfo);

        // update list of transferred in players
        List newTransferredInPlayerIdList = state.transferredInPlayerIdList;
        newTransferredInPlayerIdList.add(event.transferInPlayerId);

        // update user team
        UserTeam newUserTeam = UserTeam(
          gameWeekId: state.userTeam.gameWeekId,
          gameWeekDeadline: state.userTeam.gameWeekDeadline,
          allUserPlayers: allUserPlayers,
          freeTransfers: state.userTeam.freeTransfers > 0
              ? state.userTeam.freeTransfers - 1
              : 0,
          deduction: state.userTeam.freeTransfers >= 1
              ? state.userTeam.deduction
              : state.userTeam.deduction + 4,
          activeChip: state.userTeam.activeChip,
          availableChips: state.userTeam.availableChips,
          maxBudget: state.userTeam.maxBudget,
          teamName: state.userTeam.teamName,
        );

        // calculate new price sum of players
        double playerCostSum = 0.0;
        for (var player in allUserPlayers) {
          double currentPlayerCost = player.currentPrice.value.fold(
            (l) => 0,
            (r) => r,
          );

          playerCostSum = playerCostSum + currentPlayerCost;
        }

        // emit final state
        emit(
          state.copyWith(
            userTeam: newUserTeam,
            isLoading: false,
            transfersMade: true,
            transfersMadeCount: state.transfersMadeCount + 1,
            remainingInBank: state.userTeam.maxBudget - playerCostSum,
            transferredInPlayerIdList: newTransferredInPlayerIdList,
            swappedPlayerIdsList: newSwapperPlayersIdsList,
          ),
        );
      },
    );

    on<_cancelTransfer>((event, emit) async {
      Either<dynamic, List<dynamic>> cacheCall =
          await TransferLocalDataProvider().getAllPlayers();

      List allPlayers = cacheCall.fold(
        (l) => [],
        (r) => r,
      );

      // all user players
      List<UserPlayer> allNewUserPlayers = state.userTeam.allUserPlayers;

      // all swapped info
      List<dynamic> allSwappedPlayersIdsList = state.swappedPlayerIdsList;

      // transfer count
      int transferCount = state.transfersMadeCount;

      for (var i = 0; i < allSwappedPlayersIdsList.length; i++) {
        String playerToTransferInId =
            allSwappedPlayersIdsList[i].keys.toList()[0].toString();

        String playerToTransferOutId =
            allSwappedPlayersIdsList[i].values.toList()[0].toString();

        // // find index of player to transfer out
        int indexOfPlayerToTransferOut = 0;
        for (var i = 0; i < allNewUserPlayers.length; i++) {
          if (allNewUserPlayers[i].playerId.toString() ==
              playerToTransferOutId.toString()) {
            indexOfPlayerToTransferOut = i;
          }
        }

        // remove player to transfer out from user team
        allNewUserPlayers.removeAt(indexOfPlayerToTransferOut);
        // find new player to add
        dynamic playerToTransferInJson = allPlayers
            .where(
              (player) =>
                  player['playerId'].toString() ==
                  playerToTransferInId.toString(),
            )
            .toList()[0];

        Map availability = {"injuryStatus": "", "injuryMessage": ""};

        if (playerToTransferInJson['availability'] != null) {
          availability['injuryStatus'] =
              playerToTransferInJson['availability']['injuryStatus'];

          availability['injuryMessage'] =
              playerToTransferInJson['availability']['injuryMessage'];
        }

        // change json to user team
        UserPlayer playerToTransferIn = UserPlayer(
          playerId: (playerToTransferInJson['playerId']).toString(),
          playerName: PlayerName(
            value: playerToTransferInJson['playerName'],
          ),
          currentPrice: PlayerPrice(
            value: playerToTransferInJson['currentPrice'].toDouble(),
          ),
          playerPosition: PlayerPosition(
            value: playerToTransferInJson['position'],
          ),
          eplTeamId: PlayerEplTeam(
            value: playerToTransferInJson['eplTeamId'],
          ),
          multiplier: 0,
          isCaptain: false,
          isViceCaptain: false,
          availability:
              PlayerAvailability(value: playerToTransferInJson['availability']),
          eplTeamLogo: playerToTransferInJson['eplTeamLogo'],
          score: playerToTransferInJson['score'],
          upComingFixtures: playerToTransferInJson['upComingFixtures'],
        );

        // add player to user team
        allNewUserPlayers.insert(
          indexOfPlayerToTransferOut,
          playerToTransferIn,
        );

        // reduce transfer count
        transferCount = transferCount - 1;
      }

      // update team players
      UserTeam newUserTeam = UserTeam(
        gameWeekId: state.userTeam.gameWeekId,
        gameWeekDeadline: state.userTeam.gameWeekDeadline,
        allUserPlayers: allNewUserPlayers,
        freeTransfers:
            transferCount == 0 ? state.userTeam.freeTransfers - 1 : 0,
        deduction:
            state.userTeam.deduction == 0 ? 0 : state.userTeam.deduction - 4,
        activeChip: state.userTeam.activeChip,
        availableChips: state.userTeam.availableChips,
        maxBudget: state.userTeam.maxBudget,
        teamName: state.userTeam.teamName,
      );

      // calculate player cost
      double newPlayerCostSum = 0.0;
      for (var player in allNewUserPlayers) {
        double currentPlayerCost = player.currentPrice.value.fold(
          (l) => 0,
          (r) => r,
        );

        newPlayerCostSum = newPlayerCostSum + currentPlayerCost;
      }

      emit(state.copyWith(
        userTeam: newUserTeam,
        isLoading: false,
        transfersMade: false,
        transfersMadeCount: transferCount,
        remainingInBank: state.userTeam.maxBudget - newPlayerCostSum,
        transferredInPlayerIdList: [],
        swappedPlayerIdsList: [],
      ));
    });

    on<_cancelOneTransfer>(
      (event, emit) async {
        Either<dynamic, List<dynamic>> cacheCall =
            await TransferLocalDataProvider().getAllPlayers();

        List allPlayers = cacheCall.fold(
          (l) => [],
          (r) => r,
        );

        List swappedPlayerIdList = state.swappedPlayerIdsList;

        List transferredInPlayerIdList = state.transferredInPlayerIdList;

        List<UserPlayer> allUserPlayers = state.userTeam.allUserPlayers;

        // get swapped info for player to cancel
        Map swappedPair = swappedPlayerIdList
            .where((swapped) =>
                swapped.values.toList()[0].toString() == event.playerToCancelId)
            .toList()[0];

        String playerToAddId = swappedPair.keys.toList()[0].toString();

        // get index of player to cancel
        int indexOfPlayerToCancel = 0;
        for (var i = 0; i < allUserPlayers.length; i++) {
          if (allUserPlayers[i].playerId == event.playerToCancelId) {
            indexOfPlayerToCancel = i;
          }
        }

        //  remove player
        allUserPlayers.removeAt(indexOfPlayerToCancel);

        // find new player to add
        dynamic playerToTransferInJson = allPlayers
            .where(
              (player) => player['playerId'].toString() == playerToAddId,
            )
            .toList()[0];

        Map availability = {"injuryStatus": "", "injuryMessage": ""};

        if (playerToTransferInJson['availability'] != null) {
          availability['injuryStatus'] =
              playerToTransferInJson['availability']['injuryStatus'];

          availability['injuryMessage'] =
              playerToTransferInJson['availability']['injuryMessage'];
        }

        // change json to user team
        UserPlayer playerToTransferIn = UserPlayer(
            playerId: (playerToTransferInJson['playerId']).toString(),
            playerName: PlayerName(
              value: playerToTransferInJson['playerName'],
            ),
            currentPrice: PlayerPrice(
              value: playerToTransferInJson['currentPrice'].toDouble(),
            ),
            playerPosition: PlayerPosition(
              value: playerToTransferInJson['position'],
            ),
            eplTeamId: PlayerEplTeam(
              value: playerToTransferInJson['eplTeamId'],
            ),
            multiplier: 0,
            isCaptain: false,
            isViceCaptain: false,
            availability: PlayerAvailability(
                value: playerToTransferInJson['availability']),
            eplTeamLogo: playerToTransferInJson['eplTeamLogo'],
            score: playerToTransferInJson['score'],
            upComingFixtures: playerToTransferInJson['upComingFixtures']);

        // add player to user team
        allUserPlayers.insert(
          indexOfPlayerToCancel,
          playerToTransferIn,
        );

        // create new team
        UserTeam newUserTeam = UserTeam(
          gameWeekId: state.userTeam.gameWeekId,
          gameWeekDeadline: state.userTeam.gameWeekDeadline,
          allUserPlayers: allUserPlayers,
          freeTransfers: state.transfersMadeCount - 1 == 0 ? 1 : 0,
          deduction:
              state.userTeam.deduction == 0 ? 0 : state.userTeam.deduction + 4,
          activeChip: state.userTeam.activeChip,
          availableChips: state.userTeam.availableChips,
          maxBudget: state.userTeam.maxBudget,
          teamName: state.userTeam.teamName,
        );

        // calculate cost
        double newPlayersCostSum = 0.0;
        for (var player in allUserPlayers) {
          double currentPlayerCost = player.currentPrice.value.fold(
            (l) => 0,
            (r) => r,
          );

          newPlayersCostSum = newPlayersCostSum + currentPlayerCost;
        }

        swappedPlayerIdList.removeWhere(
          (swapped) => swapped.keys.toList()[0].toString() == playerToAddId,
        );

        transferredInPlayerIdList.removeWhere(
          (element) => element == event.playerToCancelId,
        );

        emit(
          state.copyWith(
            userTeam: newUserTeam,
            isLoading: false,
            transfersMade: state.transfersMadeCount == 0 ? false : true,
            transfersMadeCount: state.transfersMadeCount <= 0
                ? 0
                : state.transfersMadeCount - 1,
            remainingInBank: state.userTeam.maxBudget - newPlayersCostSum,
            transferredInPlayerIdList: transferredInPlayerIdList,
            swappedPlayerIdsList: swappedPlayerIdList,
          ),
        );
      },
    );

    on<_saveUserPlayers>(
      (event, emit) async {
        // get team to save
        UserTeam teamToSave = state.userTeam;
        List<UserPlayer> allUserPlayers = teamToSave.allUserPlayers;

        // check price
        double allPlayersCostSum = 0.0;
        List listOfTeamsFound = [];
        for (var player in allUserPlayers) {
          double currentPlayerPrice = player.currentPrice.value.fold(
            (l) => 0.0,
            (r) => r,
          );

          String currentPlayerTeam = player.eplTeamId.value.fold(
            (l) => '',
            (r) => r,
          );

          allPlayersCostSum = allPlayersCostSum + currentPlayerPrice;

          if (!listOfTeamsFound.contains(currentPlayerTeam)) {
            listOfTeamsFound.add(currentPlayerTeam);
          }
        }

        // check team count
        bool teamCountExceeded = false;
        String exceededTeamName = "";
        for (var team in listOfTeamsFound) {
          List teamCount = allUserPlayers
              .where(
                (player) =>
                    player.eplTeamId.value.fold(
                      (l) => '',
                      (r) => r,
                    ) ==
                    team,
              )
              .toList();

          if (teamCount.length > 3) {
            teamCountExceeded = true;
            exceededTeamName = team;
          }
        }

        // check team length
        if (allUserPlayers.length != 15) {
          Either<dynamic, dynamic> valueFailureOrSuccess = left(
            [
              [],
              const TransferFailure.incompleteTeam(failedValue: "Incomplete"),
            ],
          );

          emit(state.copyWith(
            valueFailureOrSuccess: some(valueFailureOrSuccess),
            countExceededTeam: exceededTeamName,
          ));
        } else if (allPlayersCostSum > state.userTeam.maxBudget) {
          Either<dynamic, dynamic> valueFailureOrSuccess = left(
            [
              [],
              const TransferFailure.exceededPrice(failedValue: "Price"),
            ],
          );

          emit(state.copyWith(
            valueFailureOrSuccess: some(valueFailureOrSuccess),
          ));
        } else if (teamCountExceeded) {
          Either<dynamic, dynamic> valueFailureOrSuccess = left(
            [
              [],
              const TransferFailure.exceededTeamCount(
                  failedValue: "Team Count"),
            ],
          );

          emit(state.copyWith(
            valueFailureOrSuccess: some(valueFailureOrSuccess),
          ));
        } else {
          // if transfer made
          if (state.transfersMade) {
            //save team to api from api
            await _iTransferRepository.saveUserPlayers(
              userTeam: state.userTeam,
              gameWeekId: event.gameWeekId,
              isInitial: event.isSetTeam,
            );

            if (state.isInitialSelection == true) {
              getIt<TransferBloc>().add(
                const TransferEvent.setInitialSelection(valueToSet: false),
              );
            }

            emit(
              state.copyWith(
                isLoading: false,
                transfersMade: false,
                transfersMadeCount: 0,
                transferredInPlayerIdList: [],
                swappedPlayerIdsList: [],
              ),
            );
          }
        }
      },
    );

    on<_setFilter>((event, emit) async {
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
      List<UserPlayer> allPlayers = state.selectedPlayerReplacements;

      // check filter by
      if (filterBy == "team") {
        if (filterValue == "Select a Team" || filterValue == "") {
          emit(
            state.copyWith(
              isLoading: false,
              filteredSelectedPlayerReplacements:
                  state.selectedPlayerReplacements,
              selectedDropDownTeamValue: "Select a Team",
            ),
          );
        } else {
          List<UserPlayer> newFilteredPlayers = allPlayers
              .where(
                (player) =>
                    player.eplTeamId.value.fold((l) => '', (r) => r) ==
                    filterValue,
              )
              .toList();

          emit(
            state.copyWith(
              isLoading: false,
              filteredSelectedPlayerReplacements: newFilteredPlayers,
              selectedDropDownTeamValue: event.filterValue,
            ),
          );
        }
      } else if (filterBy == "injury status") {
        if (filterValue == "All" || filterValue == "") {
          emit(
            state.copyWith(
              isLoading: false,
              filteredSelectedPlayerReplacements:
                  state.selectedPlayerReplacements,
              selectedDropDownInjuryStatusValue: "All",
            ),
          );
        }
        //
        else if (filterValue == "Available") {
          List<UserPlayer> allFilteredPlayers = state.selectedPlayerReplacements
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
              filteredSelectedPlayerReplacements: allFilteredPlayers,
              selectedDropDownInjuryStatusValue: event.filterValue,
            ),
          );
        }
        //
        else if (filterValue == "Unavailable") {
          List<UserPlayer> allFilteredPlayers = state.selectedPlayerReplacements
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
              filteredSelectedPlayerReplacements: allFilteredPlayers,
              selectedDropDownInjuryStatusValue: event.filterValue,
            ),
          );
        }
      }
    });

    on<_setSortFilter>((event, emit) async {
      // set loading
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );

      List<UserPlayer> allPlayersFiltered =
          state.filteredSelectedPlayerReplacements;

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
            filteredSelectedPlayerReplacements: allPlayersFiltered,
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
            filteredSelectedPlayerReplacements: allPlayersFiltered,
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
            filteredSelectedPlayerReplacements: allPlayersFiltered,
            playerScoreCurrentSortOrder:
                currentSort == "d" || currentSort == "" ? "a" : "d",
            playerPriceCurrentSortOrder: "",
            playerNameCurrentSortOrder: "",
          ),
        );
      }
    });

    on<_setPriceFilter>((event, emit) async {
      emit(
        state.copyWith(
          // isLoading: true,
          minPriceSet: event.minValue,
          maxPriceSet: event.maxValue,
        ),
      );
    });

    on<_filterByPrice>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );
      List<UserPlayer> allPriceFilteredPlayers =
          state.selectedPlayerReplacements
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
          filteredSelectedPlayerReplacements: allPriceFilteredPlayers,
        ),
      );
    });

    on<_setChip>(
      (event, emit) async {
        emit(
          state.copyWith(isLoading: true),
        );
        UserTeam currentUserTeam = state.userTeam;

        UserTeam newUserTeam = UserTeam(
          gameWeekId: currentUserTeam.gameWeekId,
          gameWeekDeadline: currentUserTeam.gameWeekDeadline,
          allUserPlayers: currentUserTeam.allUserPlayers,
          freeTransfers: currentUserTeam.freeTransfers,
          deduction: 0,
          activeChip: event.chipName,
          availableChips: currentUserTeam.availableChips,
          maxBudget: currentUserTeam.maxBudget,
          teamName: currentUserTeam.teamName,
        );
        emit(state.copyWith(
          isLoading: false,
          userTeam: newUserTeam,
        ));
      },
    );

    on<_validateTeam>((event, emit) async {
      emit(
        state.copyWith(isLoading: true),
      );

      // check price
      List<UserPlayer> allUserPlayers = state.userTeam.allUserPlayers;

      double allPlayersSum = 0.0;
      for (var player in allUserPlayers) {
        {
          allPlayersSum = allPlayersSum +
              player.currentPrice.value.fold(
                (l) => 0.0,
                (r) => r,
              );
        }
      }

      // check team count
      Either<dynamic, List> allTeamsCall =
          await TransferLocalDataProvider().getAllTeams();
      List allTeams = allTeamsCall.fold(
        (l) => [],
        (r) => r,
      );

      bool teamCountExceeded = false;
      String exceededTeam = '';
      for (var team in allTeams) {
        List teamCount = allUserPlayers
            .where((player) =>
                player.eplTeamId.value.fold((l) => '', (r) => r) ==
                team['teamName'])
            .toList();

        if (teamCount.length > 3) {
          teamCountExceeded = true;
          exceededTeam = team['teamName'];
        }
      }

      // check price
      if (allPlayersSum > state.userTeam.maxBudget) {
        Either<dynamic, dynamic> valueFailureOrSuccess = left(
          [
            [],
            const TransferFailure.exceededPrice(failedValue: "Price"),
          ],
        );

        emit(state.copyWith(
          valueFailureOrSuccess: some(valueFailureOrSuccess),
          priceExceededBy: allPlayersSum - state.userTeam.maxBudget,
        ));
      }
      // team count
      else if (teamCountExceeded == true) {
        Either<dynamic, dynamic> valueFailureOrSuccess = left(
          [
            [],
            const TransferFailure.exceededTeamCount(failedValue: "Team Count"),
          ],
        );

        emit(state.copyWith(
          valueFailureOrSuccess: some(valueFailureOrSuccess),
          countExceededTeam: exceededTeam,
        ));
      }

      // player count
      else if (allUserPlayers.length != 15) {
        Either<dynamic, dynamic> valueFailureOrSuccess = left(
          [
            [],
            const TransferFailure.incompleteTeam(failedValue: "Incomplete"),
          ],
        );

        emit(state.copyWith(
          valueFailureOrSuccess: some(valueFailureOrSuccess),
        ));
      }
      // validated
      else {
        // get all players
        Either<dynamic, List> allPlayersCall =
            await TransferLocalDataProvider().getAllPlayers();
        List allPlayersList = allPlayersCall.fold((l) => [], (r) => r);

        //   // navigate
        Navigator.pushNamed(
          event.context,
          "/transfer/confirm",
          arguments: {
            "allPlayers": allPlayersList,
          },
        );
      }
      emit(
        state.copyWith(isLoading: false),
      );
    });

    on<_setInitialSelection>((event, emit) async {
      emit(state.copyWith(
        isInitialSelection: event.valueToSet,
      ));
    });

    on<_cancelTransferFromConfirm>((event, emit) async {
      emit(
        state.copyWith(
          transfersMade: false,
          transfersMadeCount: 0,
          transferOutPlayerId: "",
          transferredInPlayerIdList: [],
          swappedPlayerIdsList: [],
        ),
      );
    });

    on<_setSearchQuery>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      List<UserPlayer> allFilteredPlayers =
          state.filteredSelectedPlayerReplacements;

      if (event.query == "") {
        emit(
          state.copyWith(
            isLoading: false,
            filteredSelectedPlayerReplacements:
                state.selectedPlayerReplacements,
          ),
        );
      } else {
        List<UserPlayer> searchQueryFiltered = allFilteredPlayers
            .where((player) => player.playerName.value
                .fold((l) => "", (r) => r.toUpperCase())
                .contains(event.query.toUpperCase()))
            .toList();
        emit(
          state.copyWith(
            isLoading: false,
            filteredSelectedPlayerReplacements: searchQueryFiltered,
          ),
        );
      }
    });
  }
}
