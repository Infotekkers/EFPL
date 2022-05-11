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
    on<_getUserPlayers>((event, emit) async {
      // Start Loading
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );

      // get team
      final Either<dynamic, UserTeam> failureOrSuccess =
          await _iTransferRepository.getUserPlayers(
        gameWeekId: event.gameWeekId.value.fold((l) => 1, (r) => r),
      );

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

      double playerCostSum = 0.0;
      for (var element in userTeam.allUserPlayers) {
        double currentPlayerPrice =
            element.currentPrice.value.fold((l) => 0, (r) => r);

        playerCostSum = playerCostSum + currentPlayerPrice;
      }

      print(userTeam.maxBudget);

      emit(
        state.copyWith(
          userTeam: userTeam,
          isLoading: false,
          userTeamFailureOrSuccess: some(failureOrSuccess),
          remainingInBank: userTeam.maxBudget - playerCostSum,
        ),
      );
    });

    on<_getPlayersInSelectedPosition>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));

      final Either<dynamic, List<UserPlayer>> failureOrSuccess =
          await _iTransferRepository.getAllPositionPlayers(
        playerPosition:
            state.selectedPlayerPosition.value.fold((l) => "", (r) => r),
      );

      List<UserPlayer> allSelectedPlayerReplacements =
          failureOrSuccess.fold((l) => [], (r) => r);

      emit(
        state.copyWith(
          isLoading: false,
          selectedPlayerReplacements: allSelectedPlayerReplacements,
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

    on<_transferUserPlayer>((event, emit) {
      // start spinner
      emit(state.copyWith(
        isLoading: true,
      ));
      // copy user team
      List<UserPlayer> allPlayers = state.selectedPlayerReplacements;
      List<UserPlayer> allUserPlayers = state.userTeam.allUserPlayers;
      UserTeam userTeam = state.userTeam;

      // remove player from user team
      allUserPlayers.removeWhere(
        (item) => item.playerId == state.transferOutPlayerId,
      );

      // no deduction if a temporary player is transferred
      int deductionValue = state.userTeam.deduction;
      if (state.userTeam.freeTransfers != 1) {
        if (!state.transferredInPlayerIds.contains(state.transferOutPlayerId)) {
          deductionValue = deductionValue - 4;
        }
      }

      // add new player to user team
      List playerToAdd = allPlayers
          .where(
            (element) => element.playerId == event.transferInPlayerId,
          )
          .toList();
      allUserPlayers.add(playerToAdd[0]);

      // calculate max budget
      double playerCostSum = 0.0;
      for (var element in allUserPlayers) {
        double currentPlayerPrice =
            element.currentPrice.value.fold((l) => 0, (r) => r);

        playerCostSum = playerCostSum + currentPlayerPrice;
      }

      UserTeam newUserTeam = UserTeam(
        gameWeekId: state.userTeam.gameWeekId,
        allUserPlayers: allUserPlayers,
        freeTransfers: state.userTeam.freeTransfers == 0
            ? 0
            : state.userTeam.freeTransfers - 1,
        deduction: deductionValue,
        activeChip: state.userTeam.activeChip,
        availableChips: state.userTeam.availableChips,
        maxBudget: state.userTeam.maxBudget,
        teamName: state.userTeam.teamName,
      );

      List newTransferredInPlayersId = state.transferredInPlayerIds;
      newTransferredInPlayersId.add(event.transferInPlayerId);

      emit(
        state.copyWith(
          userTeam: newUserTeam,
          userTeamCopy: state.userTeamCopy.allUserPlayers.isNotEmpty
              ? state.userTeamCopy
              : userTeam,
          isLoading: false,
          transfersMade: true,
          transfersMadeCount: state.transfersMadeCount + 1,
          transferredInPlayerIds: newTransferredInPlayersId,
          remainingInBank: state.userTeam.maxBudget - playerCostSum,
        ),
      );

      // backup player
    });

    on<_cancelTransfer>((event, emit) {
      emit(state.copyWith(
        userTeam: state.userTeamCopy,
        transfersMade: false,
        transfersMadeCount: 0,
        isLoading: false,
        transferredInPlayerIds: [],
      ));
    });

    on<_saveUserPlayers>((event, emit) {
      // TODO: implement event handler
    });
  }
}
