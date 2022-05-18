import 'package:cached_network_image/cached_network_image.dart';
import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/transfers/widgets/transfer_player_card_widget.dart';
import 'package:efpl/services/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class TransferPlayerView extends StatelessWidget {
  const TransferPlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _baseURL = dotenv.env["BASE_URL"].toString();
    final TransferBloc _transferBloc = getIt<TransferBloc>();
    return BlocConsumer<TransferBloc, TransferState>(
      listener: (context, state) {
        state.valueFailureOrSuccess.fold(
          () {},
          (either) {
            either.fold(
              (failure) {
                failure[1].maybeMap(
                  // Connection issues
                  noConnection: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "No Connection!",
                      message:
                          "Could not contact server. Showing cached team data.",
                      snackBarType: "warning",
                    );
                  },
                  socketError: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "No Connection!",
                      message:
                          "Could not contact server. Showing cached team data.",
                      snackBarType: "warning",
                    );
                  },
                  handShakeError: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "No Connection!",
                      message:
                          "Could not contact server. Showing cached team data.",
                      snackBarType: "warning",
                    );
                  },

                  // token issues
                  unauthorized: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "Login to EFPL!",
                      message: "Please login to use EFPL.",
                      snackBarType: "error",
                    );
                    Navigator.pushNamed(context, "/");
                  },
                  unauthenticated: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "Login to EFPL!",
                      message: "Please login to use EFPL.",
                      snackBarType: "error",
                    );
                    Navigator.pushNamed(context, "/");
                  },

                  // Value failures

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
        List<UserPlayer> allPositionPlayers =
            state.filteredSelectedPlayerReplacements;
        List<UserPlayer> userPlayers = state.userTeam.allUserPlayers;

        // remove players in user team from list
        List<UserPlayer> allPositionPlayerFiltered = [];
        for (var i = 0; i < allPositionPlayers.length; i++) {
          List checkPlayer = userPlayers
              .where((element) =>
                  element.playerId == allPositionPlayers[i].playerId)
              .toList();

          if (checkPlayer.isEmpty) {
            allPositionPlayerFiltered.add(allPositionPlayers[i]);
          }
        }

        // get args

        final args = ModalRoute.of(context)!.settings.arguments as Map;

        print(args['currentPlayerId']);

        String currentTransferredPlayerId = args['currentPlayerId'];
        List currentPlayerFilter = state.selectedPlayerReplacements
            .where((player) =>
                player.playerId.toString() == currentTransferredPlayerId)
            .toList();
        double currentPlayerPrice = 0.0;

        if (currentPlayerFilter.isNotEmpty) {
          UserPlayer currentPlayer = currentPlayerFilter[0];
          currentPlayerPrice = currentPlayerPrice +
              currentPlayer.currentPrice.value.fold((l) => 0.0, (r) => r);
        }

        List allTeams = args['allTeams'];
        List<String> allTeamsNames = ["Select a Team"];

        for (var team in allTeams) {
          allTeamsNames.add(team['teamName']);
        }

        SfRangeValues _values =
            SfRangeValues(state.minPriceSet, state.maxPriceSet);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: ConstantColors.primary_900,
            title: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Transfer List",
                    style: TextStyle(
                      fontFamily: "Architect",
                      fontSize: 18,
                    ),
                  ),
                  Column(
                    children: [
                      const Text(
                        "Bank",
                        style: TextStyle(fontFamily: "Architect", fontSize: 14),
                      ),
                      const SizedBox(height: 0.25),
                      Text(
                        (state.remainingInBank + currentPlayerPrice)
                            .toStringAsFixed(1),
                        style: TextStyle(
                          color: state.remainingInBank > 0
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : allPositionPlayerFiltered.isEmpty
                  ? const Center(
                      child: const Text(
                        "No Players",
                      ),
                    )
                  : SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: [
                            // Filter Section
                            Column(
                              children: [
                                // Top Filters
                                Container(
                                  height: 100,
                                  color: ConstantColors.neutral_200,
                                  child: Row(
                                    children: [
                                      // Filter One (Team)
                                      Container(
                                        margin: const EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "View :",
                                              style: TextStyle(
                                                fontFamily: "Architect",
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.58) -
                                                  20,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: ConstantColors
                                                      .primary_900,
                                                  width: 1.0,
                                                ),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                              ),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  value: state
                                                      .selectedDropDownTeamValue,
                                                  style: const TextStyle(
                                                    fontFamily: "Architect",
                                                    color: Colors.black,
                                                  ),
                                                  onChanged:
                                                      (String? newTeamName) {
                                                    _transferBloc.add(
                                                      TransferEvent.setFilter(
                                                        filterBy: "team",
                                                        filterValue:
                                                            newTeamName!,
                                                      ),
                                                    );
                                                  },
                                                  items: allTeamsNames
                                                      .map((String teamName) {
                                                    String finalURL = _baseURL;

                                                    List teamLogoList = allTeams
                                                        .where((team) =>
                                                            team['teamName'] ==
                                                            teamName)
                                                        .toList();

                                                    if (teamLogoList
                                                        .isNotEmpty) {
                                                      finalURL = finalURL +
                                                          teamLogoList[0]
                                                              ['teamLogo'];
                                                    }

                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: teamName,
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            height: 25,
                                                            width: 25,
                                                            margin:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    0, 0, 8, 0),
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl: finalURL ==
                                                                      _baseURL
                                                                  ? '$_baseURL/uploads/teams/placeholder_team.png'
                                                                  : finalURL,
                                                            ),
                                                          ),
                                                          Text(
                                                            teamName,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 13,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // Filter Two (Injury)
                                      Container(
                                        margin: const EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "View :",
                                              style: TextStyle(
                                                fontFamily: "Architect",
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.42) -
                                                  20,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: ConstantColors
                                                      .primary_900,
                                                  width: 1.0,
                                                ),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                              ),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  value: state
                                                      .selectedDropDownInjuryStatusValue,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Architect",
                                                  ),
                                                  onChanged:
                                                      (String? injuryStatus) {
                                                    _transferBloc.add(
                                                      TransferEvent.setFilter(
                                                        filterBy:
                                                            "injury status",
                                                        filterValue:
                                                            injuryStatus!,
                                                      ),
                                                    );
                                                  },
                                                  items: <String>[
                                                    "All",
                                                    "Available",
                                                    "Unavailable"
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Bottom Filter
                                Container(
                                  height: 50,
                                  color: ConstantColors.neutral_200,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.12,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "Min",
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(
                                              state.minPriceSet
                                                  .toStringAsFixed(1),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.76,
                                        child: SfRangeSlider(
                                          min: 3.5,
                                          max: 17.0,
                                          values: _values,
                                          interval: 0.1,
                                          activeColor:
                                              ConstantColors.primary_900,
                                          inactiveColor:
                                              ConstantColors.primary_400,
                                          onChangeEnd: (SfRangeValues value) {
                                            _transferBloc.add(
                                              const TransferEvent
                                                  .filterByPrice(),
                                            );
                                          },
                                          onChanged: (SfRangeValues value) {
                                            _transferBloc.add(
                                              TransferEvent.setPriceFilter(
                                                minValue: value.start,
                                                maxValue: value.end,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.12,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "Max",
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(
                                              state.maxPriceSet
                                                  .toStringAsFixed(1),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),

                            // Header
                            Container(
                              height: 45,
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              color: ConstantColors.primary_900,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Player Name
                                  InkWell(
                                    onTap: () {
                                      _transferBloc.add(
                                        const TransferEvent.setSortFilter(
                                          sortBy: 'name',
                                        ),
                                      );
                                    },
                                    child: SizedBox(
                                      child: Row(
                                        children: [
                                          const Text(
                                            "Player",
                                            style: TextStyle(
                                              fontSize: 16,
                                              letterSpacing: 0.5,
                                              fontFamily: "Architect",
                                              fontWeight: FontWeight.bold,
                                              color: ConstantColors.neutral_200,
                                            ),
                                          ),
                                          state.playerNameCurrentSortOrder == ""
                                              ? const SizedBox(
                                                  height: 0,
                                                  width: 0,
                                                )
                                              : state.playerNameCurrentSortOrder ==
                                                      "a"
                                                  ? const Icon(
                                                      Icons.arrow_drop_up,
                                                      size: 25,
                                                      color: ConstantColors
                                                          .success_300,
                                                    )
                                                  : const Icon(
                                                      Icons.arrow_drop_down,
                                                      size: 25,
                                                      color: ConstantColors
                                                          .error_300,
                                                    ),
                                        ],
                                      ),
                                      width: MediaQuery.of(context).size.width *
                                          0.55,
                                    ),
                                  ),

                                  // Price
                                  InkWell(
                                    onTap: () {
                                      _transferBloc.add(
                                        const TransferEvent.setSortFilter(
                                          sortBy: 'price',
                                        ),
                                      );
                                    },
                                    child: SizedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Price",
                                            style: TextStyle(
                                              fontSize: 16,
                                              // letterSpacing: 0.,
                                              fontFamily: "Architect",
                                              fontWeight: FontWeight.bold,
                                              color: ConstantColors.neutral_200,
                                            ),
                                          ),
                                          state.playerPriceCurrentSortOrder ==
                                                  ""
                                              ? const SizedBox(
                                                  height: 0,
                                                  width: 0,
                                                )
                                              : state.playerPriceCurrentSortOrder ==
                                                      "a"
                                                  ? const Icon(
                                                      Icons.arrow_drop_up,
                                                      size: 25,
                                                      color: ConstantColors
                                                          .success_300,
                                                    )
                                                  : const Icon(
                                                      Icons.arrow_drop_down,
                                                      size: 25,
                                                      color: ConstantColors
                                                          .error_300,
                                                    ),
                                        ],
                                      ),
                                      width: MediaQuery.of(context).size.width *
                                          0.17,
                                    ),
                                  ),

                                  // Point Sum
                                  InkWell(
                                    onTap: () {
                                      _transferBloc.add(
                                        const TransferEvent.setSortFilter(
                                          sortBy: 'point',
                                        ),
                                      );
                                    },
                                    child: SizedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Points",
                                            style: TextStyle(
                                              fontSize: 18,
                                              letterSpacing: 0.5,
                                              fontFamily: "Architect",
                                              fontWeight: FontWeight.bold,
                                              color: ConstantColors.neutral_200,
                                            ),
                                          ),
                                          state.playerScoreCurrentSortOrder ==
                                                  ""
                                              ? const SizedBox(
                                                  height: 0,
                                                  width: 0,
                                                )
                                              : state.playerScoreCurrentSortOrder ==
                                                      "a"
                                                  ? const Icon(
                                                      Icons.arrow_drop_up,
                                                      size: 25,
                                                      color: ConstantColors
                                                          .success_300,
                                                    )
                                                  : const Icon(
                                                      Icons.arrow_drop_down,
                                                      size: 25,
                                                      color: ConstantColors
                                                          .error_300,
                                                    ),
                                        ],
                                      ),
                                      width: MediaQuery.of(context).size.width *
                                          0.19,
                                    ),
                                  )
                                ],
                              ),
                            ),

                            // Players,
                            ListView.builder(
                                itemCount: allPositionPlayerFiltered.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return UserPlayerCard(
                                    currentPlayer:
                                        allPositionPlayerFiltered[index],
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
        );
      },
    );
  }
}
