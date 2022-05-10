part of 'transfer_bloc.dart';

@freezed
class TransferState with _$TransferState {
  const factory TransferState({
    required UserTeam userTeam,
    required UserTeam userTeamCopy,
    //
    required bool isLoading,
    //
    required bool transfersMade,
    required int transfersMadeCount,

    //
    required String transferOutPlayerId,
    required PlayerPosition selectedPlayerPosition,

    //
    required List transferredInPlayerIds,

    //
    required List<UserPlayer> selectedPlayerReplacements,

    //
    required Option<Either<dynamic, UserTeam>> userTeamFailureOrSuccess,
    required Option<Either<dynamic, List<UserPlayer>>>
        replacementPlayersFailureOrSuccess,
    required Option<Either<ValueFailure, dynamic>> valueFailureOrSuccess,
  }) = _TransferState;

  factory TransferState.initial() => TransferState(
        userTeam: UserTeam(
          gameWeekId: GameWeekId(value: 1),
          allUserPlayers: [],
          freeTransfers: 0,
          deduction: 0,
          activeChip: "",
        ),
        userTeamCopy: UserTeam(
          gameWeekId: GameWeekId(value: 1),
          allUserPlayers: [],
          freeTransfers: 0,
          deduction: 0,
          activeChip: "",
        ),
        isLoading: false,
        transferOutPlayerId: "",
        selectedPlayerPosition: PlayerPosition(value: ""),
        transfersMade: false,
        transfersMadeCount: 0,
        transferredInPlayerIds: [],
        selectedPlayerReplacements: [],
        userTeamFailureOrSuccess: none(),
        replacementPlayersFailureOrSuccess: none(),
        valueFailureOrSuccess: none(),
      );
}
