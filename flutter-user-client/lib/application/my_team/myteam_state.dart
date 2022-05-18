part of 'myteam_bloc.dart';

@freezed
abstract class MyTeamState with _$MyTeamState {
  const factory MyTeamState.initial() = _Initial;
  const factory MyTeamState.loadInProgress() = _Loading;
  const factory MyTeamState.loadSuccess(MyTeam myTeam) = _LoadSuccess;
  const factory MyTeamState.loadFailure(MyTeamFailure myTeamFailure) =
      _LoadFailure;
  const factory MyTeamState.transferOptionsLoaded(
      List<String> validTransfers, MyTeam myTeam) = _TransferOptionsLoaded;
  const factory MyTeamState.transferApproved(MyTeam myTeam) = _TransferApproved;
  const factory MyTeamState.saved() = _Saved;
}
