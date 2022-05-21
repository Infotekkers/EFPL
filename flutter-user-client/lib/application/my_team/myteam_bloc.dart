import 'package:bloc/bloc.dart';
import 'package:efpl/domain/my_team/i_my_team_repository.dart';
import 'package:efpl/domain/my_team/my_team.dart';
import 'package:efpl/domain/my_team/my_team_failures.dart';
import 'package:efpl/domain/my_team/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'myteam_event.dart';
part 'myteam_state.dart';

part 'myteam_bloc.freezed.dart';

@lazySingleton
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
    final myTeam = state.maybeMap(
      loadSuccess: (s) => s.myTeam,
      transferOptionsLoaded: (s) => s.myTeam,
      transferApproved: (s) => s.myTeam,
      orElse: () => null,
    )!;

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

      emit(MyTeamState.transferOptionsLoaded(
          validOptions, myTeam, e.playerId, e.position, e.isSub));
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

      emit(MyTeamState.transferOptionsLoaded(
          validOptions, myTeam, e.playerId, e.position, e.isSub));
    }
  }

  void _onTransferConfirmed(_TransferConfirmed e, Emitter<MyTeamState> emit) {
    final myTeam = state.maybeMap(
      loadSuccess: (s) => s.myTeam,
      transferOptionsLoaded: (s) => s.myTeam,
      transferApproved: (s) => s.myTeam,
      orElse: () => null,
    )!;

    // FIRST SELECTED PLAYER AND FIELD POSITION
    final playerOneId = state.maybeMap(
        transferOptionsLoaded: (s) => s.playerId, orElse: () => null)!;

    final playerOneFieldPosition = state.maybeMap(
        transferOptionsLoaded: (s) => s.isSub ? 'sub' : s.position,
        orElse: () => null)!;

    final playerOneActualPosition = state.maybeMap(
        transferOptionsLoaded: (s) => s.position, orElse: () => null)!;

    // SECOND SELECTED PLAYER AND FIELD POSITION
    final playerTwoId = e.toBeTransferredIn;

    final playerTwoFieldPosition = e.isSub ? 'sub' : e.position;

    final playerTwoActualPosition = e.position;

    // POSITIONAL CONTAINER CONTAINING PLAYER 1 & 2
    final userPlayersOneOut =
        myTeam.players[playerOneFieldPosition].getOrCrash();

    final userPlayersTwoOut =
        myTeam.players[playerTwoFieldPosition].getOrCrash();

    // REMOVE PLAYERS FROM POSITIONAL CONTAINER
    final playerOne = userPlayersOneOut.remove(playerOneId.toString());
    final playerTwo = userPlayersTwoOut.remove(playerTwoId.toString());

    //
    if (playerOneFieldPosition == 'sub') {
      final userPlayerIn = myTeam.players[playerOneActualPosition].getOrCrash();

      playerOne['multiplier'] = playerTwo['multiplier'];
      playerTwo['multiplier'] = 0;

      userPlayersOneOut[playerTwoId.toString()] = playerTwo;
      userPlayerIn[playerOneId.toString()] = playerOne;

      myTeam.players[playerOneActualPosition] =
          PositionalContainer(userPlayerIn, playerOneActualPosition);
    } else {
      final userPlayerIn = myTeam.players[playerTwoActualPosition].getOrCrash();

      playerTwo['multiplier'] = playerOne['multiplier'];
      playerOne['multiplier'] = 0;

      userPlayersTwoOut[playerOneId.toString()] = playerOne;
      userPlayerIn[playerTwoId.toString()] = playerTwo;

      myTeam.players[playerTwoActualPosition] =
          PositionalContainer(userPlayerIn, playerTwoActualPosition);
    }

    myTeam.players[playerOneFieldPosition] =
        PositionalContainer(userPlayersOneOut, playerOneFieldPosition);
    myTeam.players[playerTwoFieldPosition] =
        PositionalContainer(userPlayersTwoOut, playerTwoFieldPosition);

    emit(MyTeamState.transferApproved(myTeam));
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
