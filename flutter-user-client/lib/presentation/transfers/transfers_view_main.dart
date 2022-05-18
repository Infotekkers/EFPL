import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/application/util/util_bloc.dart';
import 'package:efpl/domain/fixture/value_objects.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/user_team.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/transfers/widgets/user_player_widget.dart';
import 'package:efpl/services/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class TransfersView extends StatelessWidget {
  const TransfersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UtilBloc _utilBloc = getIt<UtilBloc>();
    _utilBloc.add(
      const UtilEvent.setDefaultLocale(),
    );

    final TransferBloc _transferBloc = BlocProvider.of<TransferBloc>(context);

    return BlocConsumer<TransferBloc, TransferState>(
      listener: (context, state) {
        state.valueFailureOrSuccess.fold(
          () {},
          (either) {
            either.fold(
              (failure) {
                failure[1].maybeMap(
                  // Value failures
                  noTeamSelected: (_) {
                    print("NO Team Selected");
                  },
                  exceededPrice: (_) {
                    print("exceededPrice");
                  },
                  exceededTeamCount: (_) {
                    print("exceededTeamCount");
                  },
                  incompleteTeam: (_) {
                    print("incompleteTeam");
                  },
                  deadlinePassed: (_) {
                    print("deadlinePassed");
                  },

                  // Connection issues
                  noConnection: (_) {
                    print("No Connection");
                  },
                  socketError: (_) {
                    print("Socket Error");
                  },
                  handShakeError: (_) {
                    print("Handshake Error");
                  },

                  // token issues
                  unauthorized: (_) {
                    print("Unauthorized");
                  },
                  unauthenticated: (_) {
                    print("UnAuthenticated");
                  },
                  unexpectedError: (_) {
                    print("UnExpected Error");
                  },

                  hiveError: (_) {
                    print("Hive Error");
                  },

                  orElse: () {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "Something went wrong.",
                      message: "Something went wrong. Try again!",
                      snackBarType: "error",
                    );
                  },
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

        bool isTeamComplete = allFormattedPlayers[0].length != 0 &&
            allFormattedPlayers[1].length != 0 &&
            allFormattedPlayers[2].length != 0 &&
            allFormattedPlayers[3].length != 0;

        double maxHeight = MediaQuery.of(context).size.height;

        return LiquidPullToRefresh(
          onRefresh: () async {
            _transferBloc.add(
              const TransferEvent.getUserPlayers(),
            );
          },
          height: 60,
          showChildOpacityTransition: false,
          animSpeedFactor: 2,
          child: state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  children: [
                    isTeamComplete == false
                        ? const Center(
                            child: Text("No Team"),
                          )
                        :
                        // Main View
                        SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      state.userTeam.teamName,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: ConstantColors.neutral_700,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      state.userTeam.gameWeekId.value.fold(
                                        (l) => 'GW 1',
                                        (r) => "GW " + r.toString(),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                // Goal Keepers
                                Container(
                                  height: maxHeight / 5,
                                  width: MediaQuery.of(context).size.width,
                                  color: ConstantColors.neutral_300,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 120,
                                    vertical: 10,
                                  ),
                                  child: Stack(
                                    children: [
                                      GridView.builder(
                                        // shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.75,
                                        ),
                                        itemCount:
                                            allFormattedPlayers[0].length,
                                        itemBuilder: (context, index) {
                                          return UserPlayerWidget(
                                            currentUserPlayer:
                                                allFormattedPlayers[0][index],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),

                                // Defenders
                                Container(
                                  height: maxHeight / 5,
                                  width: MediaQuery.of(context).size.width,
                                  color: ConstantColors.neutral_100,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 10,
                                  ),
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          allFormattedPlayers[1].length > 0
                                              ? allFormattedPlayers[1].length
                                              : 1,
                                      childAspectRatio: 0.75,
                                    ),
                                    itemCount: allFormattedPlayers[1].length,
                                    itemBuilder: (context, index) {
                                      return UserPlayerWidget(
                                        currentUserPlayer:
                                            allFormattedPlayers[1][index],
                                      );
                                    },
                                  ),
                                ),

                                // Midfielders
                                Container(
                                  height: maxHeight / 5,
                                  width: MediaQuery.of(context).size.width,
                                  color: ConstantColors.neutral_300,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 10,
                                  ),
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          allFormattedPlayers[2].length > 0
                                              ? allFormattedPlayers[2].length
                                              : 1,
                                      childAspectRatio: 0.75,
                                    ),
                                    itemCount: allFormattedPlayers[2].length,
                                    itemBuilder: (context, index) {
                                      return UserPlayerWidget(
                                        currentUserPlayer:
                                            allFormattedPlayers[2][index],
                                      );
                                    },
                                  ),
                                ),

                                // Attackers
                                Container(
                                  height: maxHeight / 5,
                                  width: MediaQuery.of(context).size.width,
                                  color: ConstantColors.neutral_100,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 85,
                                    vertical: 10,
                                  ),
                                  child: Center(
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount:
                                            allFormattedPlayers[3].length > 0
                                                ? allFormattedPlayers[3].length
                                                : 1,
                                        childAspectRatio: 0.75,
                                      ),
                                      itemCount: allFormattedPlayers[3].length,
                                      itemBuilder: (context, index) {
                                        return UserPlayerWidget(
                                          currentUserPlayer:
                                              allFormattedPlayers[3][index],
                                        );
                                      },
                                    ),
                                  ),
                                ),

                                // Info
                                Container(
                                  height: maxHeight / 5,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 5,
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  color: ConstantColors.neutral_300,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // Bank
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 5),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              width: 0.45,
                                              color: ConstantColors.primary_900,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            // Label
                                            const Text(
                                              "Bank : ",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              state.remainingInBank
                                                  .toStringAsFixed(1),
                                              style: TextStyle(
                                                color: state.remainingInBank <
                                                        0.0
                                                    ? ConstantColors.error_300
                                                    : Colors.green,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // Deduction
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 5, 0, 5),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              width: 0.45,
                                              color: ConstantColors.primary_900,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            // Label
                                            const Text(
                                              "Deduction : ",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              state.userTeam.deduction
                                                  .toString(),
                                              style: TextStyle(
                                                color: state.userTeam
                                                            .deduction <
                                                        0.0
                                                    ? ConstantColors.error_300
                                                    : Colors.green,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),

                                      // Free Transfers
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 5, 0, 5),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              width: 0.45,
                                              color: ConstantColors.primary_900,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            const Text(
                                              "Free Transfers : ",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              state.userTeam.freeTransfers
                                                  .toString(),
                                              style: TextStyle(
                                                color: state.userTeam
                                                            .freeTransfers <
                                                        1
                                                    ? ConstantColors.error_300
                                                    : Colors.green,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),

                                      // Deadline
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 5, 0, 5),
                                        child: Row(
                                          children: [
                                            const Text(
                                              "Deadline : ",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              formatDeadline(state
                                                  .userTeam.gameWeekDeadline),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                    state.transfersMade == true
                        ? Positioned(
                            width: 120,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Save Button
                                InkWell(
                                  onTap: () async {
                                    // get all players
                                    var efplCache =
                                        await Hive.openBox('efplCache');
                                    List allPlayers =
                                        efplCache.get("allPlayers");

                                    // navigate
                                    Navigator.pushNamed(
                                      context,
                                      "/transfer/confirm",
                                      arguments: {
                                        "allPlayers": allPlayers,
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: ConstantColors.primary_900,
                                      border: Border.all(
                                          color: ConstantColors.primary_900),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ConstantColors.primary_900
                                              .withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.save,
                                      color: ConstantColors.neutral_200,
                                    ),
                                  ),
                                ),

                                // Cancel Button
                                InkWell(
                                  onTap: () {
                                    _transferBloc.add(
                                      const TransferEvent.cancelTransfer(),
                                    );
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: ConstantColors.error_200,
                                      border: Border.all(
                                          color: ConstantColors.error_200),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ConstantColors.error_200
                                              .withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      color: ConstantColors.neutral_200,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            bottom: 15.0,
                            right: 15.0,
                          )
                        : Container(),
                  ],
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

  return [allGoalKeepers, allDefender, allMidfielders, allAttackers];
}

String formatDeadline(String deadline) {
  DateTime dt = DateTime.fromMillisecondsSinceEpoch(int.parse(deadline));

  const weekDays = ['Mon', "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  const months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  final String formattedDate = weekDays[dt.weekday].toString() +
      " " +
      months[dt.month - 1] +
      ", " +
      dt.day.toString() +
      " " +
      dt.year.toString();

  // const
  return formattedDate;
  // return "";
}
