import 'package:cached_network_image/cached_network_image.dart';
import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/transfers/widgets/transfer_player_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TransferPlayerView extends StatelessWidget {
  const TransferPlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _baseURL = dotenv.env["BASE_URL"].toString();
    final TransferBloc _transferBloc = getIt<TransferBloc>();
    return BlocConsumer<TransferBloc, TransferState>(
      listener: (context, state) {
        // TODO: implement listener
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

        List allTeams = args['allTeams'];
        List<String> allTeamsNames = ["Select a Team"];

        for (var team in allTeams) {
          allTeamsNames.add(team['teamName']);
        }

        RangeValues _currentRangeValues = const RangeValues(4.5, 15);

        return Scaffold(
          appBar: AppBar(
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
                        state.remainingInBank.toStringAsFixed(1),
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
                                              color: ConstantColors.primary_900,
                                              width: 1.0,
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: state
                                                  .selectedDropDownTeamValue,
                                              style: const TextStyle(
                                                fontFamily: "Architect",
                                                color: Colors.black,
                                              ),
                                              onChanged: (String? newTeamName) {
                                                _transferBloc.add(
                                                  TransferEvent.setFilter(
                                                    filterBy: "team",
                                                    filterValue: newTeamName!,
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

                                                if (teamLogoList.isNotEmpty) {
                                                  finalURL = finalURL +
                                                      teamLogoList[0]
                                                          ['teamLogo'];
                                                }

                                                return DropdownMenuItem<String>(
                                                  value: teamName,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        height: 25,
                                                        width: 25,
                                                        margin: const EdgeInsets
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
                                                        style: const TextStyle(
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
                                              color: ConstantColors.primary_900,
                                              width: 1.0,
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          child: DropdownButtonHideUnderline(
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
                                                    filterBy: "injury status",
                                                    filterValue: injuryStatus!,
                                                  ),
                                                );
                                              },
                                              items: <String>[
                                                "All",
                                                "Available",
                                                "Unavailable"
                                              ].map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
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
                              color: Colors.pink,
                              child: Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.12,
                                    color: Colors.grey,
                                    child: Column(
                                      children: const [
                                        Text("Min"),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.76,
                                    child: RangeSlider(
                                      values: _currentRangeValues,
                                      max: 15,
                                      divisions: 1,
                                      labels: RangeLabels(
                                        _currentRangeValues.start
                                            .round()
                                            .toString(),
                                        _currentRangeValues.end
                                            .round()
                                            .toString(),
                                      ),
                                      onChanged: (RangeValues values) {},
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.12,
                                    color: Colors.grey,
                                    child: Column(
                                      children: const [Text("Max")],
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
                          margin: const EdgeInsets.fromLTRB(0, 12, 0, 15),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          color: Colors.grey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  child: const Text(
                                    "Player",
                                    style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: 0.5,
                                      fontFamily: "Architect",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
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
                                  child: const Text(
                                    "Price",
                                    style: TextStyle(
                                      fontSize: 16,
                                      // letterSpacing: 0.,
                                      fontFamily: "Architect",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
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
                                  child: const Text(
                                    "Points",
                                    style: TextStyle(
                                      fontSize: 18,
                                      letterSpacing: 0.5,
                                      fontFamily: "Architect",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
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
                                currentPlayer: allPositionPlayerFiltered[index],
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
