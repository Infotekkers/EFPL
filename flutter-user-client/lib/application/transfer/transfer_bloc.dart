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
              activeChip: ''),
          (r) => r);

      emit(
        state.copyWith(
          userTeam: userTeam,
          isLoading: false,
          userTeamFailureOrSuccess: some(failureOrSuccess),
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

      // add new player to user team
      List playerToAdd = allPlayers
          .where(
            (element) => element.playerId == event.transferInPlayerId,
          )
          .toList();
      allUserPlayers.add(playerToAdd[0]);

      UserTeam newUserTeam = UserTeam(
        gameWeekId: state.userTeam.gameWeekId,
        allUserPlayers: allUserPlayers,
        freeTransfers: state.userTeam.freeTransfers == 0
            ? 0
            : state.userTeam.freeTransfers - 1,
        deduction: state.userTeam.freeTransfers == 1
            ? state.userTeam.freeTransfers
            : state.userTeam.freeTransfers - 4,
        activeChip: state.userTeam.activeChip,
      );

      List newTransferredInPlayersId = state.transferredInPlayerIds;
      newTransferredInPlayersId.add(event.transferInPlayerId);

      emit(
        state.copyWith(
          userTeam: newUserTeam,
          userTeamCopy: userTeam,
          isLoading: false,
          transfersMade: true,
          transfersMadeCount: state.transfersMadeCount + 1,
          transferredInPlayerIds: newTransferredInPlayersId,
        ),
      );

      // backup player
    });

    on<_saveUserPlayers>((event, emit) {
      // TODO: implement event handler
    });
  }
}
