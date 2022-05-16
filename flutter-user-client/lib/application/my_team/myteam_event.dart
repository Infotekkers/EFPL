part of 'myteam_bloc.dart';

@freezed
abstract class MyTeamEvent with _$MyTeamEvent {
  const factory MyTeamEvent.loadMyTeam(String userId) = _LoadMyTeam;
  const factory MyTeamEvent.transferOptionsRequested(PlayerId playerId) =
      _TransferOptionsRequested;
  const factory MyTeamEvent.transferConfirmed(
          PlayerId playerOne, PlayerId playerTwo, MyTeam myTeam) =
      _TransferConfirmed;
  const factory MyTeamEvent.saveMyTeam(MyTeam myTeam) = _SaveMyTeam;
}
