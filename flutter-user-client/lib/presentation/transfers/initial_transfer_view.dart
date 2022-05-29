import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/user_team.dart';
import 'package:efpl/domain/transfer/value_objects.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/core/player_card.dart';
import 'package:efpl/services/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class InitialTransferPage extends StatelessWidget {
  const InitialTransferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransferBloc, TransferState>(
      listener: (context, state) {
        state.valueFailureOrSuccess.fold(
          () {},
          (either) {
            either.fold(
              (failure) {
                failure[1].maybeMap(
                  exceededPrice: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "Price Limit Exceeded!",
                      message:
                          "The team you have selected exceeds the limit by ${state.priceExceededBy.toStringAsFixed(1)}. Please select a team again.",
                      snackBarType: "warning",
                    );
                  },
                  exceededTeamCount: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "Players from Team!",
                      message:
                          "You have selected more than 3 players from ${state.countExceededTeam}. Please select a team again.",
                      snackBarType: "warning",
                    );
                  },
                  incompleteTeam: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "Incomplete Team!",
                      message:
                          "The Team you have selected is incomplete. Try again!",
                      snackBarType: "error",
                    );
                  },
                  deadlinePassed: (_) {
                    print("deadlinePassed");
                  },

                  // Connection issues
                  noConnection: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "No Connection!",
                      message:
                          "Could not contact the server. Please check your connection!",
                      snackBarType: "warning",
                    );
                  },
                  socketError: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "No Connection!",
                      message:
                          "Could not contact the server. Please check your connection!",
                      snackBarType: "warning",
                    );
                  },
                  handShakeError: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "No Connection!",
                      message:
                          "Could not contact the server. Please check your connection!",
                      snackBarType: "warning",
                    );
                  },

                  // token issues
                  unauthorized: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "Please Login!",
                      message: "Could not verify. Please login and try again!",
                      snackBarType: "warning",
                    );
                  },
                  unauthenticated: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "Please Login!",
                      message: "Could not verify. Please login and try again!",
                      snackBarType: "warning",
                    );
                  },
                  unexpectedError: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "Something went wrong!",
                      message: "Something went wrong. Please try again!",
                      snackBarType: "warning",
                    );
                  },

                  hiveError: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "Caching Disabled!",
                      message: "Something went wrong. Please try again!",
                      snackBarType: "warning",
                    );
                  },

                  orElse: () {},
                );
              },
              (_) {},
            );
          },
        );
      },
      builder: (context, state) {
        List allFormattedPlayers =
            getAllFormattedPlayers(userTeam: state.userTeam);

        final _transferBloc = getIt<TransferBloc>();
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  // Main Area
                  Container(
                    color: Colors.blue[50],
                    child: Column(
                      children: [
                        // TEAM TITLE
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 5,
                          ),
                          child: Center(
                            child: Text(
                              state.userTeam.teamName,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.05,
                              ),
                            ),
                          ),
                        ),

                        // BUDGET
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: Center(
                            child: Text(
                              state.remainingInBank.toStringAsFixed(1),
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.05,
                                color: state.remainingInBank < 0
                                    ? Colors.red
                                    : Colors.green,
                              ),
                            ),
                          ),
                        ),

                        // SPACER
                        const SizedBox(
                          height: 16,
                        ),

                        /*
                          =================================================
                          GOALKEEPERS
                          =================================================
                        */
                        Stack(
                          children: [
                            // SELECTION
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: allFormattedPlayers[0].length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    double playerPrice = allFormattedPlayers[0]
                                            [index]
                                        .currentPrice
                                        .value
                                        .fold(
                                          (l) => 0.0,
                                          (r) => r,
                                        );
                                    return InkWell(
                                      onTap: () async {
                                        _transferBloc.add(
                                          TransferEvent.setTransferOutPlayer(
                                            transferOutPlayerId: "",
                                            playerPosition:
                                                PlayerPosition(value: "GK"),
                                          ),
                                        );

                                        _transferBloc.add(
                                          const TransferEvent
                                              .getPlayersInSelectedPosition(),
                                        );

                                        var efplCache =
                                            await Hive.openBox('transferCache');
                                        List? allTeams =
                                            efplCache.get("allTeams");

                                        Navigator.pushNamed(
                                          context,
                                          "/transfer",
                                          arguments: {
                                            "allTeams": allTeams,
                                            "currentPlayerId": '',
                                            "isInitial": true,
                                          },
                                        );
                                      },
                                      child: PlayerWidget(
                                        playerName: allFormattedPlayers[0]
                                                [index]
                                            .playerName
                                            .value
                                            .fold(
                                              (l) => '',
                                              (r) => r,
                                            ),
                                        description: playerPrice == 0
                                            ? ' '
                                            : playerPrice.toStringAsFixed(1),
                                        teamName: allFormattedPlayers[0][index]
                                            .eplTeamId
                                            .value
                                            .fold(
                                              (l) => '  ',
                                              (r) => r.toString().split(" ")[0],
                                            ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            // TITLE
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Center(
                                child: Text(
                                  "GOALKEEPERS",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    color: ConstantColors.primary_900
                                        .withOpacity(0.55),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),

                        /*
                          =================================================
                          DEFENDERS
                          =================================================
                        */
                        Stack(
                          children: [
                            // SELECTION
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: allFormattedPlayers[1].length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    double playerPrice = allFormattedPlayers[1]
                                            [index]
                                        .currentPrice
                                        .value
                                        .fold(
                                          (l) => 0.0,
                                          (r) => r,
                                        );
                                    return InkWell(
                                      onTap: () async {
                                        _transferBloc.add(
                                          TransferEvent.setTransferOutPlayer(
                                            transferOutPlayerId: "",
                                            playerPosition:
                                                PlayerPosition(value: "DEF"),
                                          ),
                                        );

                                        _transferBloc.add(
                                          const TransferEvent
                                              .getPlayersInSelectedPosition(),
                                        );

                                        var efplCache =
                                            await Hive.openBox('transferCache');
                                        List? allTeams =
                                            efplCache.get("allTeams");

                                        Navigator.pushNamed(
                                          context,
                                          "/transfer",
                                          arguments: {
                                            "allTeams": allTeams,
                                            "currentPlayerId": '',
                                            "isInitial": true,
                                          },
                                        );
                                      },
                                      child: PlayerWidget(
                                        playerName: allFormattedPlayers[1]
                                                [index]
                                            .playerName
                                            .value
                                            .fold(
                                              (l) => '',
                                              (r) => r,
                                            ),
                                        description: playerPrice == 0
                                            ? ' '
                                            : playerPrice.toStringAsFixed(1),
                                        teamName: allFormattedPlayers[1][index]
                                            .eplTeamId
                                            .value
                                            .fold(
                                              (l) => '   ',
                                              (r) => r.toString().split(" ")[0],
                                            ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            // TITLE
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Center(
                                child: Text(
                                  "DEFENDERS",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    color: ConstantColors.primary_900
                                        .withOpacity(0.55),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),

                        /*
                          =================================================
                          MIDFIELDERS
                          =================================================
                        */
                        Stack(
                          children: [
                            // SELECTION
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: allFormattedPlayers[2].length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    double playerPrice = allFormattedPlayers[2]
                                            [index]
                                        .currentPrice
                                        .value
                                        .fold(
                                          (l) => 0.0,
                                          (r) => r,
                                        );
                                    return InkWell(
                                      onTap: () async {
                                        _transferBloc.add(
                                          TransferEvent.setTransferOutPlayer(
                                            transferOutPlayerId: "",
                                            playerPosition:
                                                PlayerPosition(value: "MID"),
                                          ),
                                        );

                                        _transferBloc.add(
                                          const TransferEvent
                                              .getPlayersInSelectedPosition(),
                                        );

                                        var efplCache =
                                            await Hive.openBox('transferCache');
                                        List? allTeams =
                                            efplCache.get("allTeams");

                                        Navigator.pushNamed(
                                          context,
                                          "/transfer",
                                          arguments: {
                                            "allTeams": allTeams,
                                            "currentPlayerId": '',
                                            "isInitial": true,
                                          },
                                        );
                                      },
                                      child: PlayerWidget(
                                        playerName: allFormattedPlayers[2]
                                                [index]
                                            .playerName
                                            .value
                                            .fold(
                                              (l) => '',
                                              (r) => r,
                                            ),
                                        description: playerPrice == 0
                                            ? ' '
                                            : playerPrice.toStringAsFixed(1),
                                        teamName: allFormattedPlayers[2][index]
                                            .eplTeamId
                                            .value
                                            .fold(
                                              (l) => '   ',
                                              (r) => r.toString().split(" ")[0],
                                            ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            // TITLE
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Center(
                                child: Text(
                                  "MIDFIELDERS",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    color: ConstantColors.primary_900
                                        .withOpacity(0.55),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),

                        /*
                          =================================================
                          ATTACKERS
                          =================================================
                        */
                        Stack(
                          children: [
                            // SELECTION
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: allFormattedPlayers[3].length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    double playerPrice = allFormattedPlayers[3]
                                            [index]
                                        .currentPrice
                                        .value
                                        .fold(
                                          (l) => 0.0,
                                          (r) => r,
                                        );
                                    return InkWell(
                                      onTap: () async {
                                        _transferBloc.add(
                                          TransferEvent.setTransferOutPlayer(
                                            transferOutPlayerId: "",
                                            playerPosition:
                                                PlayerPosition(value: "ATT"),
                                          ),
                                        );

                                        _transferBloc.add(
                                          const TransferEvent
                                              .getPlayersInSelectedPosition(),
                                        );

                                        var efplCache =
                                            await Hive.openBox('transferCache');
                                        List? allTeams =
                                            efplCache.get("allTeams");

                                        Navigator.pushNamed(
                                          context,
                                          "/transfer",
                                          arguments: {
                                            "allTeams": allTeams,
                                            "currentPlayerId": '',
                                            "isInitial": true,
                                          },
                                        );
                                      },
                                      child: PlayerWidget(
                                        playerName: allFormattedPlayers[3]
                                                [index]
                                            .playerName
                                            .value
                                            .fold(
                                              (l) => '',
                                              (r) => r,
                                            ),
                                        description: playerPrice == 0
                                            ? ' '
                                            : playerPrice.toStringAsFixed(1),
                                        teamName: allFormattedPlayers[3][index]
                                            .eplTeamId
                                            .value
                                            .fold(
                                              (l) => '   ',
                                              (r) => r.toString().split(" ")[0],
                                            ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            // TITLE
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Center(
                                child: Text(
                                  "ATTACKERS",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    color: ConstantColors.primary_900
                                        .withOpacity(0.55),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  state.transfersMadeCount < 15
                      ? Container()
                      : Positioned(
                          child: InkWell(
                            onTap: () async {
                              _transferBloc.add(
                                TransferEvent.validateTeam(
                                  context: context,
                                ),
                              );
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: ConstantColors.primary_900,
                                border: Border.all(
                                  color: ConstantColors.primary_900,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: ConstantColors.primary_900
                                        .withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                      0,
                                      3,
                                    ), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.save,
                                color: ConstantColors.neutral_200,
                              ),
                            ),
                          ),
                          bottom: 15.0,
                          right: 15.0,
                        )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

List getAllFormattedPlayers({required UserTeam userTeam}) {
  List<UserPlayer> allUserPlayers = userTeam.allUserPlayers;

  //
  List<UserPlayer> allGoalKeepers = [];
  List<UserPlayer> allDefender = [];
  List<UserPlayer> allMidfielders = [];
  List<UserPlayer> allAttackers = [];

  for (var userPlayer in allUserPlayers) {
    String position = userPlayer.playerPosition.value.fold(
      (l) => '',
      (r) => r,
    );

    if (position == "GK") {
      allGoalKeepers.add(userPlayer);
    } else if (position == "DEF") {
      allDefender.add(userPlayer);
    } else if (position == "MID") {
      allMidfielders.add(userPlayer);
    } else if (position == "ATT") {
      allAttackers.add(userPlayer);
    }
  }

  while (allGoalKeepers.length < 2) {
    allGoalKeepers.add(
      UserPlayer(
        playerId: '',
        playerName: PlayerName(value: '         '),
        currentPrice: PlayerPrice(value: 0),
        playerPosition: PlayerPosition(value: "GK"),
        eplTeamId: PlayerEplTeam(value: '         '),
        eplTeamLogo: '',
        multiplier: 0,
        isCaptain: false,
        isViceCaptain: false,
        availability: PlayerAvailability(
          value: const {"injuryStatus": "", "injuryMessage": ""},
        ),
        score: 0,
        upComingFixtures: [],
      ),
    );
  }

  while (allDefender.length < 5) {
    allDefender.add(
      UserPlayer(
        playerId: '',
        playerName: PlayerName(value: '         '),
        currentPrice: PlayerPrice(value: 0),
        playerPosition: PlayerPosition(value: "DEF"),
        eplTeamId: PlayerEplTeam(value: '         '),
        eplTeamLogo: '',
        multiplier: 0,
        isCaptain: false,
        isViceCaptain: false,
        availability: PlayerAvailability(
          value: const {"injuryStatus": "", "injuryMessage": ""},
        ),
        score: 0,
        upComingFixtures: [],
      ),
    );
  }

  while (allMidfielders.length < 5) {
    allMidfielders.add(
      UserPlayer(
        playerId: '',
        playerName: PlayerName(value: '         '),
        currentPrice: PlayerPrice(value: 0),
        playerPosition: PlayerPosition(value: "MID"),
        eplTeamId: PlayerEplTeam(value: ''),
        eplTeamLogo: '',
        multiplier: 0,
        isCaptain: false,
        isViceCaptain: false,
        availability: PlayerAvailability(
          value: {"injuryStatus": "", "injuryMessage": ""},
        ),
        score: 0,
        upComingFixtures: [],
      ),
    );
  }

  while (allAttackers.length < 3) {
    allAttackers.add(
      UserPlayer(
        playerId: '',
        playerName: PlayerName(value: '         '),
        currentPrice: PlayerPrice(value: 0),
        playerPosition: PlayerPosition(value: "ATT"),
        eplTeamId: PlayerEplTeam(value: ''),
        eplTeamLogo: '',
        multiplier: 0,
        isCaptain: false,
        isViceCaptain: false,
        availability: PlayerAvailability(
          value: {"injuryStatus": "", "injuryMessage": ""},
        ),
        score: 0,
        upComingFixtures: [],
      ),
    );
  }

  return [allGoalKeepers, allDefender, allMidfielders, allAttackers];
}