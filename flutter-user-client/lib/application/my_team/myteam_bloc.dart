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
    on<_CaptainChanged>(_onCaptainChanged);
    on<_ViceCaptainChanged>(_onViceCaptainChanged);
    on<_ChipPlayed>(_onChipPlayed);
    on<_SaveMyTeam>(_onSaveMyTeam);
  }

  void _onLoadMyTeam(_LoadMyTeam e, Emitter<MyTeamState> emit) async {
    emit(const MyTeamState.loadInProgress());

    final failureOrSuccess = await iMyTeamRepository.getUserTeam(e.gameweekId);

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
    final myTeam = _getMyTeam(state);

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
          'att': 3,
        };

        const minLimitPerPosition = {
          'def': 3,
          'mid': 3,
          'att': 1,
        };

        if (myTeam.players[e.position].getOrCrash().keys.toList().length <
            maxLimitPerPosition[e.position]) {
          for (String position in ['def', 'mid', 'att']) {
            if (myTeam.players[position].getOrCrash().keys.toList().length >
                minLimitPerPosition[position]) {
              for (String playerId
                  in myTeam.players[position].getOrCrash().keys) {
                if (int.parse(playerId) != e.playerId) {
                  validOptions.add(int.parse(playerId));
                }
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
        const maxLimitPerPosition = {
          'def': 5,
          'mid': 5,
          'att': 3,
        };

        const minLimitPerPosition = {
          'def': 3,
          'mid': 3,
          'att': 1,
        };

        if (myTeam.players[e.position].getOrCrash().keys.toList().length >
            minLimitPerPosition[e.position]) {
          // Every player on sub except goalkeeper
          for (String playerId in myTeam.players['sub'].getOrCrash().keys) {
            var subPosition =
                myTeam.players['sub'].getOrCrash()[playerId]['position'];
            if (subPosition != 'gk' &&
                myTeam.players[subPosition].getOrCrash().keys.toList().length <
                    maxLimitPerPosition[subPosition]) {
              validOptions.add(int.parse(playerId));
            }
          }
        } else {
          for (String playerId in myTeam.players['sub'].getOrCrash().keys) {
            var subPosition =
                myTeam.players['sub'].getOrCrash()[playerId]['position'];
            if (subPosition != 'gk' && subPosition == e.position) {
              validOptions.add(int.parse(playerId));
            }
          }
        }
      }

      emit(MyTeamState.transferOptionsLoaded(
          validOptions, myTeam, e.playerId, e.position, e.isSub));
    }
  }

  void _onTransferConfirmed(_TransferConfirmed e, Emitter<MyTeamState> emit) {
    final myTeam = _getMyTeam(state);

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

      if (playerTwo['multiplier'] > 1 || playerTwo['isViceCaptain']) {
        playerOne['isCaptain'] = playerTwo['isCaptain'];
        playerOne['isViceCaptain'] = playerTwo['isViceCaptain'];
        playerTwo['isCaptain'] = false;
        playerTwo['isViceCaptain'] = false;
      }
      playerOne['multiplier'] = playerTwo['multiplier'];
      playerTwo['multiplier'] = 0;

      userPlayersOneOut[playerTwoId.toString()] = playerTwo;
      userPlayerIn[playerOneId.toString()] = playerOne;

      myTeam.players[playerOneActualPosition] =
          PositionalContainer(userPlayerIn, playerOneActualPosition);
    } else {
      final userPlayerIn = myTeam.players[playerTwoActualPosition].getOrCrash();

      if (playerOne['multiplier'] > 1 || playerOne['isViceCaptain']) {
        playerTwo['isCaptain'] = playerOne['isCaptain'];
        playerTwo['isViceCaptain'] = playerOne['isViceCaptain'];
        playerOne['isCaptain'] = false;
        playerOne['isViceCaptain'] = false;
      }
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

  void _onCaptainChanged(_CaptainChanged e, Emitter<MyTeamState> emit) {
    final myTeam = _getMyTeam(state);
    Map<String, String> oldCaptain = {
      'position': "",
      "id": "",
    };
    bool isCaptainElectViceCaptain = false;

    for (String position in myTeam.players.keys) {
      for (String playerId in myTeam.players[position].getOrCrash().keys) {
        final isCaptain =
            myTeam.players[position].getOrCrash()[playerId]['isCaptain'];
        final isViceCaptain =
            myTeam.players[position].getOrCrash()[playerId]['isViceCaptain'];

        if (isCaptain) {
          myTeam.players[position].getOrCrash()[playerId]['isCaptain'] = false;
          myTeam.players[position].getOrCrash()[playerId]['multiplier'] -= 1;
          oldCaptain['position'] = position;
          oldCaptain['id'] = playerId;
        }

        if (playerId == e.playerId.toString()) {
          myTeam.players[position].getOrCrash()[playerId]['isCaptain'] = true;
          myTeam.players[position].getOrCrash()[playerId]['multiplier'] += 1;
        }
        if (playerId == e.playerId.toString() && isViceCaptain) {
          myTeam.players[position].getOrCrash()[playerId]['isViceCaptain'] =
              false;
          isCaptainElectViceCaptain = true;
        }
      }
    }

    // If Vice captain is gonna be captain
    if (isCaptainElectViceCaptain) {
      // Make Old captain vice captain
      myTeam.players[oldCaptain['position']].getOrCrash()[oldCaptain['id']]
          ['isViceCaptain'] = true;
    }

    emit(MyTeamState.captainChangeSuccess(myTeam));
  }

  void _onViceCaptainChanged(_ViceCaptainChanged e, Emitter<MyTeamState> emit) {
    final myTeam = _getMyTeam(state);
    Map<String, String> oldViceCaptain = {
      'position': "",
      "id": "",
    };
    bool isViceCaptainElectCaptain = false;

    for (String position in myTeam.players.keys) {
      for (String playerId in myTeam.players[position].getOrCrash().keys) {
        final isCaptain =
            myTeam.players[position].getOrCrash()[playerId]['isCaptain'];
        final isViceCaptain =
            myTeam.players[position].getOrCrash()[playerId]['isViceCaptain'];

        if (isViceCaptain) {
          myTeam.players[position].getOrCrash()[playerId]['isViceCaptain'] =
              false;
          oldViceCaptain['position'] = position;
          oldViceCaptain['id'] = playerId;
        }

        if (playerId == e.playerId.toString()) {
          myTeam.players[position].getOrCrash()[playerId]['isViceCaptain'] =
              true;
        }
        if (playerId == e.playerId.toString() && isCaptain) {
          myTeam.players[position].getOrCrash()[playerId]['isCaptain'] = false;
          myTeam.players[position].getOrCrash()[playerId]['multiplier'] -= 1;
          isViceCaptainElectCaptain = true;
        }
      }
    }

    // If Vice captain is gonna be captain
    if (isViceCaptainElectCaptain) {
      // Make Old captain vice captain
      myTeam.players[oldViceCaptain['position']]
          .getOrCrash()[oldViceCaptain['id']]['isCaptain'] = true;
      myTeam.players[oldViceCaptain['position']]
          .getOrCrash()[oldViceCaptain['id']]['multiplier'] += 1;
    }

    emit(MyTeamState.viceCaptainChangeSuccess(myTeam));
  }

  void _onChipPlayed(_ChipPlayed e, Emitter<MyTeamState> emit) {
    var myTeam = _getMyTeam(state);

    if (myTeam.activeChip.getOrCrash() == '' &&
        myTeam.availableChips.getOrCrash().contains(e.chip)) {
      myTeam = myTeam.copyWith(activeChip: e.chip);
      myTeam.availableChips.getOrCrash().remove(e.chip);

      if (e.chip.getOrCrash() == 'BB') {
        for (String playerId in myTeam.players['sub'].getOrCrash().keys) {
          myTeam.players['sub'].getOrCrash()[playerId]['multiplier'] = 1;
        }
      } else if (e.chip.getOrCrash() == 'TC') {
        for (String position in myTeam.players.keys) {
          for (String playerId in myTeam.players[position].getOrCrash().keys) {
            final isCaptain =
                myTeam.players[position].getOrCrash()[playerId]['isCaptain'];

            if (isCaptain) {
              myTeam.players[position].getOrCrash()[playerId]['multiplier'] = 3;
            }
          }
        }
      }

      emit(MyTeamState.chipPlayedSuccess(myTeam));
    } else {
      emit(MyTeamState.chipPlayedFailure(myTeam));
    }
  }

  void _onSaveMyTeam(_SaveMyTeam e, Emitter<MyTeamState> emit) async {
    emit(const MyTeamState.loadInProgress());
    final failureOrSuccess = await iMyTeamRepository.saveUserTeam(e.myTeam);

    if (failureOrSuccess.fold(
      (failure) => false,
      (success) => true,
    )) {
      emit(MyTeamState.saved(e.myTeam));
    } else {
      emit(MyTeamState.loadFailure(failureOrSuccess.foldLeft(
          const MyTeamFailure.localDBError(), (failure, r) => failure)));
    }
  }

  _getMyTeam(state) {
    return state.maybeMap(
      loadSuccess: (s) => s.myTeam,
      transferOptionsLoaded: (s) => s.myTeam,
      transferApproved: (s) => s.myTeam,
      captainChangeSuccess: (s) => s.myTeam,
      viceCaptainChangeSuccess: (s) => s.myTeam,
      chipPlayedSuccess: (s) => s.myTeam,
      chipPlayedFailure: (s) => s.myTeam,
      orElse: () => null,
    )!;
  }
}
