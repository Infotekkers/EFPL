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
      _TransferOptionsRequested e, Emitter<MyTeamState> emit) {
    final myTeam =
        state.maybeMap(loadSuccess: (s) => s.myTeam, orElse: () => null)!;

    List<int> validOptions = [];

    if (e.position.toLowerCase() == 'gk') {
      for (String position in ['gk', 'sub']) {
        for (String playerId in myTeam.players[position].getOrCrash().keys) {
          if (myTeam.players[position].getOrCrash()[playerId]['position'] ==
                  'gk' &&
              int.parse(playerId) != e.playerId) {
            validOptions.add(int.parse(playerId));
          }
        }
      }

      emit(MyTeamState.transferOptionsLoaded(validOptions, myTeam));
    } else {
      if (e.isSub) {
        const maxLimitPerPosition = {
          'def': 5,
          'mid': 5,
          '3': 5,
        };

        if (myTeam.players[e.position].getOrCrash().keys.toList().length <
            maxLimitPerPosition[e.position]) {
          for (String position in ['def', 'mid', 'att']) {
            for (String playerId
                in myTeam.players[position].getOrCrash().keys) {
              if (int.parse(playerId) != e.playerId) {
                validOptions.add(int.parse(playerId));
              }
            }
          }
        } else {
          // Every player in player's position not on sub
          for (String playerId
              in myTeam.players[e.position].getOrCrash().keys) {
            validOptions.add(int.parse(playerId));
          }
        }
      } else {
        // Every player on sub except goalkeeper
        for (String playerId in myTeam.players['sub'].getOrCrash().keys) {
          if (myTeam.players['sub'].getOrCrash()[playerId]['position'] !=
              'gk') {
            validOptions.add(int.parse(playerId));
          }
        }
      }

      emit(MyTeamState.transferOptionsLoaded(validOptions, myTeam));
    }
  }

  void _onTransferConfirmed(_TransferConfirmed e, Emitter<MyTeamState> emit) {
    final playerOne =
        e.myTeam.players[e.playerOneFieldPos].userPlayers.remove(e.playerOne);
    final playerTwo =
        e.myTeam.players[e.playerTwoFieldPos].userPlayers.remove(e.playerTwo);

    e.myTeam.players[e.playerOneFieldPos].userPlayers[e.playerTwo] = playerTwo;
    e.myTeam.players[e.playerTwoFieldPos].userPlayers[e.playerOne] = playerOne;

    emit(MyTeamState.transferApproved(e.myTeam));
  }

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
