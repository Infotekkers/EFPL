import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/value_failures.dart';
import 'package:efpl/domain/fixture/value_objects.dart';
import 'package:efpl/domain/transfer/i_user_players_facade.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/user_team.dart';
import 'package:efpl/domain/transfer/value_objects.dart';
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
    // Complete
    on<_getUserPlayers>((event, emit) async {
      // Start spinner
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );

      // get team from api
      final Either<dynamic, UserTeam> failureOrSuccess =
          await _iTransferRepository.getUserPlayers(
        gameWeekId: event.gameWeekId.value.fold(
          (l) => 1,
          (r) => r,
        ),
      );

      // get team from response
      final UserTeam userTeam = failureOrSuccess.fold(
          (l) => UserTeam(
                gameWeekId: GameWeekId(value: 1),
                allUserPlayers: [],
                freeTransfers: 0,
                deduction: 0,
                activeChip: '',
                availableChips: [],
                maxBudget: 0,
                teamName: "",
              ),
          (r) => r);

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
          userTeamFailureOrSuccess: some(failureOrSuccess),
          remainingInBank: userTeam.maxBudget - playerCostSum,
        ),
      );
    });

    // Complete
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
        (l) => [],
        (r) => r,
      );

      // emit final state
      emit(
        state.copyWith(
          isLoading: false,
          selectedPlayerReplacements: allSelectedPlayerReplacements,
        ),
      );
    });

    // Complete
    on<_setTransferOutPlayer>((event, emit) {
      emit(
        state.copyWith(
          transferOutPlayerId: event.transferOutPlayerId,
          selectedPlayerPosition: event.playerPosition,
        ),
      );
    });

    // Complete
    on<_transferUserPlayer>(
      (event, emit) {
        // start spinner
        emit(state.copyWith(
          isLoading: true,
        ));

        // find player to move out
        List<UserPlayer> allUserPlayers = state.userTeam.allUserPlayers;
        UserPlayer playerToTransferOut = allUserPlayers
            .where(
              (player) => player.playerId == state.transferOutPlayerId,
            )
            .toList()[0];

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
        UserPlayer playerToTransferIn = state.selectedPlayerReplacements
            .where(
              (player) => player.playerId == event.transferInPlayerId,
            )
            .toList()[0];
        // move in player at index
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
          allUserPlayers: allUserPlayers,
          freeTransfers: state.userTeam.freeTransfers == 1 ? 0 : 0,
          deduction: state.userTeam.freeTransfers == 1
              ? state.userTeam.deduction
              : state.userTeam.deduction - 4,
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
            transfersMadeCount: state.transfersMadeCount - 1,
            remainingInBank: state.userTeam.maxBudget - playerCostSum,
            transferredInPlayerIdList: newTransferredInPlayerIdList,
            swappedPlayerIdsList: newSwapperPlayersIdsList,
          ),
        );
      },
    );

    on<_cancelTransfer>((event, emit) {
      // start spinner
      emit(state.copyWith(
        isLoading: true,
      ));

      // reverse user team from map
      List<UserPlayer> allUserPlayers = state.userTeam.allUserPlayers;
      List<UserPlayer> allPlayers = state.selectedPlayerReplacements;
      List swappedPlayerIdsList = state.swappedPlayerIdsList;
      int transferCount = state.transfersMadeCount;

      // reverse price
      for (var swappedPair in swappedPlayerIdsList) {
        String playerToMoveInId = (swappedPair.keys.toList())[0].toString();
        String playerToCancelId = swappedPair[playerToMoveInId].toString();

        int indexOfPlayerToCancel = 0;
        // find index of player to cancel
        for (var i = 0; i < allUserPlayers.length; i++) {
          if (allUserPlayers[i].playerId == playerToCancelId) {
            indexOfPlayerToCancel = i;
          }
        }

        // remove player
        allUserPlayers
            .removeWhere((player) => player.playerId == playerToCancelId);

        // find player to add
        UserPlayer playerToMoveIn = allPlayers
            .where((player) => player.playerId == playerToMoveInId)
            .toList()[0];

        // add player
        allUserPlayers.insert(indexOfPlayerToCancel, playerToMoveIn);

        // reduce transfer count
        transferCount = transferCount - 1;
      }

      // update team
      UserTeam newUserTeam = UserTeam(
        gameWeekId: state.userTeam.gameWeekId,
        allUserPlayers: allUserPlayers,
        freeTransfers: 1,
        deduction:
            state.userTeam.deduction == 0 ? 0 : state.userTeam.deduction + 4,
        activeChip: state.userTeam.activeChip,
        availableChips: state.userTeam.availableChips,
        maxBudget: state.userTeam.maxBudget,
        teamName: state.userTeam.teamName,
      );

      // calculate player cost
      double newPlayerCostSum = 0.0;
      for (var player in allUserPlayers) {
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
      (event, emit) {
        List swappedPlayerIdList = state.swappedPlayerIdsList;
        List transferredInPlayerIdList = state.transferredInPlayerIdList;
        List<UserPlayer> allPlayers = state.selectedPlayerReplacements;
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

        // remove player
        allUserPlayers.removeWhere(
          (player) => player.playerId == event.playerToCancelId,
        );

        print("************************************" + " " + playerToAddId);

        for (var element in state.selectedPlayerReplacements) {
          if (element.playerId == playerToAddId) {
            print(element);
          }
        }

        // get player to add
        UserPlayer playerToAdd = state.selectedPlayerReplacements
            .where(
              (player) =>
                  player.playerId.toString() == playerToAddId.toString(),
            )
            .toList()[0];

        // add player
        allUserPlayers.insert(indexOfPlayerToCancel, playerToAdd);

        // create new team
        UserTeam newUserTeam = UserTeam(
          gameWeekId: state.userTeam.gameWeekId,
          allUserPlayers: allUserPlayers,
          freeTransfers: state.transfersMadeCount == 0 ? 1 : 0,
          deduction:
              state.userTeam.deduction == 0 ? 0 : state.userTeam.deduction + 4,
          activeChip: state.userTeam.activeChip,
          availableChips: state.userTeam.availableChips,
          maxBudget: state.userTeam.maxBudget,
          teamName: state.userTeam.teamName,
        );

        // calculate price
        double newPlayersCostSum = 0.0;
        for (var player in allUserPlayers) {
          double currentPlayerCost = player.currentPrice.value.fold(
            (l) => 0,
            (r) => r,
          );

          newPlayersCostSum = newPlayersCostSum + currentPlayerCost;
        }

        swappedPlayerIdList.removeWhere(
            (swapped) => swapped.keys.toList()[0].toString() == playerToAddId);

        transferredInPlayerIdList
            .removeWhere((element) => element == event.playerToCancelId);

        // emit final state
        emit(
          state.copyWith(
            userTeam: newUserTeam,
            isLoading: false,
            transfersMade: state.transfersMadeCount == 0 ? false : true,
            transfersMadeCount:
                state.transfersMadeCount > 0 ? state.transfersMadeCount - 1 : 0,
            remainingInBank: state.userTeam.maxBudget - newPlayersCostSum,
            transferredInPlayerIdList: transferredInPlayerIdList,
            swappedPlayerIdsList: swappedPlayerIdList,
          ),
        );
      },
    );

    on<_saveUserPlayers>((event, emit) {
      // TODO: implement event handler
    });
  }
}
