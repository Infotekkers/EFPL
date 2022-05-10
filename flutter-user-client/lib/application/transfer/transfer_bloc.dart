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

    on<_setTransferPlayerId>((event, emit) {
      // emit(state.copyWith(
      //   transferredOutPlayerIds: event.transferPlayerId,
      // ));
    });

    on<_getPlayersInSelectedPosition>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));

      final Either<dynamic, List<UserPlayer>> failureOrSuccess =
          await _iTransferRepository.getAllPositionPlayers(
        playerPosition: event.playerPosition.value.fold((l) => "", (r) => r),
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

    on<_transferUserPlayer>((event, emit) {
      print(state.userTeam);

      // backup player
    });

    on<_saveUserPlayers>((event, emit) {
      // TODO: implement event handler
    });
  }
}
