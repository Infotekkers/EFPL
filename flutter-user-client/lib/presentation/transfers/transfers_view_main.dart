import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/application/util/util_bloc.dart';
import 'package:efpl/domain/fixture/value_objects.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/user_team.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/transfers/widgets/user_player_widget.dart';
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
        // TODO: implement listener
      },
      builder: (context, state) {
        List allFormattedPlayers =
            getAllFormattedPlayers(userTeam: state.userTeam);

        double maxHeight = MediaQuery.of(context).size.height;

        return LiquidPullToRefresh(
          onRefresh: () async {
            _transferBloc.add(
              TransferEvent.getUserPlayers(
                gameWeekId: GameWeekId(value: 1),
              ),
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
                    // Main Voew
                    SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Column(
                          children: [
                            // Goal Keepers
                            Container(
                              height: maxHeight / 6,
                              width: MediaQuery.of(context).size.width,
                              color: ConstantColors.neutral_300,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 120,
                                vertical: 20,
                              ),
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemCount: allFormattedPlayers[0].length,
                                itemBuilder: (context, index) {
                                  return UserPlayerWidget(
                                    currentUserPlayer: allFormattedPlayers[0]
                                        [index],
                                  );
                                },
                              ),
                            ),

                            // Defenders
                            Container(
                              height: maxHeight / 6,
                              width: MediaQuery.of(context).size.width,
                              color: ConstantColors.neutral_100,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 20,
                              ),
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      allFormattedPlayers[1].length > 0
                                          ? allFormattedPlayers[1].length
                                          : 1,
                                ),
                                itemCount: allFormattedPlayers[1].length,
                                itemBuilder: (context, index) {
                                  return UserPlayerWidget(
                                    currentUserPlayer: allFormattedPlayers[1]
                                        [index],
                                  );
                                },
                              ),
                            ),

                            // Midfielders
                            Container(
                              height: maxHeight / 6,
                              width: MediaQuery.of(context).size.width,
                              color: ConstantColors.neutral_300,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 20,
                              ),
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      allFormattedPlayers[2].length > 0
                                          ? allFormattedPlayers[2].length
                                          : 1,
                                ),
                                itemCount: allFormattedPlayers[2].length,
                                itemBuilder: (context, index) {
                                  return UserPlayerWidget(
                                    currentUserPlayer: allFormattedPlayers[2]
                                        [index],
                                  );
                                },
                              ),
                            ),

                            // Attackers
                            Container(
                              height: maxHeight / 6,
                              width: MediaQuery.of(context).size.width,
                              color: ConstantColors.neutral_100,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 85,
                                vertical: 20,
                              ),
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      allFormattedPlayers[3].length > 0
                                          ? allFormattedPlayers[3].length
                                          : 1,
                                ),
                                itemCount: allFormattedPlayers[3].length,
                                itemBuilder: (context, index) {
                                  return UserPlayerWidget(
                                    currentUserPlayer: allFormattedPlayers[3]
                                        [index],
                                  );
                                },
                              ),
                            ),

                            // Info
                            Container(
                              height: maxHeight / 6,
                              width: MediaQuery.of(context).size.width,
                              color: ConstantColors.neutral_300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.remainingInBank.toStringAsFixed(1),
                                  ),
                                  Text(
                                    "Deduction : " +
                                        state.userTeam.deduction.toString(),
                                  ),
                                  Text(
                                    "Free Transfers : " +
                                        state.userTeam.freeTransfers.toString(),
                                  ),
                                  const Text("Bank : "),
                                  const Text("Deadline : "),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                                      border: Border.all(),
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
