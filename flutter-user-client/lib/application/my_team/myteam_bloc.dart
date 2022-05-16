import 'package:bloc/bloc.dart';
import 'package:efpl/domain/my_team/i_my_team_repository.dart';
import 'package:efpl/domain/my_team/my_team.dart';
import 'package:efpl/domain/my_team/my_team_failures.dart';
import 'package:efpl/domain/my_team/value_objects.dart';
import 'package:efpl/domain/player/player.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'myteam_event.dart';
part 'myteam_state.dart';

part 'myteam_bloc.freezed.dart';

@injectable
class MyTeamBloc extends Bloc<MyTeamEvent, MyTeamState> {
  final IMyTeamRepository iMyTeamRepository;

  MyTeamBloc(this.iMyTeamRepository) : super(const MyTeamState.initial()) {
    on<_LoadMyTeam>(_onLoadMyTeam);
    on<_TransferOptionsRequested>(_onTransferOptionsRequested);
    on<_TransferConfirmed>(_onTransferConfirmed);
    on<_SaveMyTeam>(_onSaveMyTeam);
  }

  void _onLoadMyTeam(_LoadMyTeam e, Emitter<MyTeamState> emit) async {
    emit(const MyTeamState.loadInProgress());

    final failureOrSuccess =
        await iMyTeamRepository.getUserTeam(e.userId, e.gameweekId);

    failureOrSuccess.fold(
      (failure) => emit(
        MyTeamState.loadFailure(failure),
      ),
      (myTeam) => emit(
        MyTeamState.loadSuccess(myTeam),
      ),
    );
  }

  void _onTransferOptionsRequested(
      _TransferOptionsRequested e, Emitter<MyTeamState> emit) {}

  void _onTransferConfirmed(_TransferConfirmed e, Emitter<MyTeamState> emit) {}

  void _onSaveMyTeam(_SaveMyTeam e, Emitter<MyTeamState> emit) async {
    emit(const MyTeamState.loadInProgress());

    final failureOrSuccess =
        await iMyTeamRepository.saveUserTeam(e.myTeam, e.userId);

    failureOrSuccess.fold(
      (failure) => emit(
        MyTeamState.loadFailure(failure),
      ),
      (myTeam) => emit(const MyTeamState.saved()),
    );
  }
}
