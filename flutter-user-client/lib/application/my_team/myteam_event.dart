part of 'myteam_bloc.dart';

@freezed
abstract class MyTeamEvent with _$MyTeamEvent {
  const factory MyTeamEvent.loadMyTeam(String userId, String gameweekId) =
      _LoadMyTeam;
  const factory MyTeamEvent.transferOptionsRequested(
      MyTeamPlayer player, MyTeam myTeam) = _TransferOptionsRequested;
  const factory MyTeamEvent.transferConfirmed(
      String playerOne, String playerTwo, MyTeam myTeam) = _TransferConfirmed;
  const factory MyTeamEvent.saveMyTeam(MyTeam myTeam, String userId) =
      _SaveMyTeam;
}
