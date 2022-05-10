part of 'transfer_bloc.dart';

@freezed
class TransferState with _$TransferState {
  const factory TransferState({
    required UserTeam userTeam,
    required bool isLoading,
    required bool transfersMade,
    required List transferredInPlayerIds,
    required String transferPlayerId,
    required List transferredOutPlayerIds,
    required List<UserPlayer> selectedPlayerReplacements,
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
        isLoading: false,
        transferPlayerId: "",
        transfersMade: false,
        transferredInPlayerIds: [],
        transferredOutPlayerIds: [],
        selectedPlayerReplacements: [],
        userTeamFailureOrSuccess: none(),
        replacementPlayersFailureOrSuccess: none(),
        valueFailureOrSuccess: none(),
      );
}
