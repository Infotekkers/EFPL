import 'package:efpl/application/fixture/fixture_bloc.dart';
import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/application/util/util_bloc.dart';
import 'package:efpl/domain/fixture/value_objects.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/user_team.dart';
import 'package:efpl/domain/transfer/value_objects.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/transfers/widgets/user_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
              : SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Column(
                      children: [
                        // Goal Keepers
                        Container(
                          height: maxHeight / 6,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.amber,
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
                          color: Colors.pink,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 20,
                          ),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: allFormattedPlayers[1].length > 0
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
                          color: Colors.teal,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 20,
                          ),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: allFormattedPlayers[2].length > 0
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
                          color: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 85,
                            vertical: 20,
                          ),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: allFormattedPlayers[3].length > 0
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
                          color: Colors.green,
                        ),
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

  return [allGoalKeepers, allDefender, allMidfielders, allAttackers];
}
