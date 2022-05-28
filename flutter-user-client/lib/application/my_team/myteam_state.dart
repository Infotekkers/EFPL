part of 'myteam_bloc.dart';

@freezed
abstract class MyTeamState with _$MyTeamState {
  const factory MyTeamState.initial() = _Initial;
  const factory MyTeamState.loadInProgress() = _Loading;
  const factory MyTeamState.loadSuccess(MyTeam myTeam) = _LoadSuccess;
  const factory MyTeamState.loadFailure(MyTeamFailure myTeamFailure) =
      _LoadFailure;
  const factory MyTeamState.transferOptionsLoaded(
    List<int> validOptions,
    MyTeam myTeam,
    int playerId,
    String position,
    bool isSub,
  ) = _TransferOptionsLoaded;
  const factory MyTeamState.transferApproved(MyTeam myTeam) = _TransferApproved;
  const factory MyTeamState.captainChangeSuccess(MyTeam myTeam) =
      _CaptainChangeSuccess;
  const factory MyTeamState.viceCaptainChangeSuccess(MyTeam myTeam) =
      _ViceCaptainSuccess;
  const factory MyTeamState.chipPlayedSuccess(MyTeam myTeam) =
      _ChipPlayedSuccess;
  const factory MyTeamState.chipPlayedFailure(MyTeam myTeam) =
      _ChipPlayedFailure;
  const factory MyTeamState.saved(MyTeam myTeam) = _Saved;
}
