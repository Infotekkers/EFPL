import 'package:efpl/domain/fixture/fixture.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:flutter/material.dart';

class FixtureDetailEvent extends StatelessWidget {
  final Map<String, Fixture> fixture;
  const FixtureDetailEvent({Key? key, required this.fixture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List commonEvents = getAllEvents(fixture: fixture);
    return Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 0,
            // maxHeight: 380,
            minWidth: MediaQuery.of(context).size.width * 0.5,
          ),
          child: DecoratedBox(
            decoration: const BoxDecoration(),
            child: Column(
              children: [
                // Assists
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 0,
                      // maxHeight: 100,
                      minWidth: MediaQuery.of(context).size.width * 0.5,
                    ),
                    child: DecoratedBox(
                      decoration: const BoxDecoration(),
                      child: ListView.builder(
                        itemCount: commonEvents[0]['assists'].length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 25,
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            color: ConstantColors.neutral_200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  commonEvents[0]['assists'][index].toString(),
                                ),
                                const Text(
                                  "A",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    backgroundColor: Colors.black,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // penalitiesMissed
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 0,
                      // maxHeight: 100,
                      minWidth: MediaQuery.of(context).size.width * 0.5,
                    ),
                    child: DecoratedBox(
                      decoration: const BoxDecoration(),
                      child: ListView.builder(
                        itemCount: commonEvents[0]['penalitiesMissed'].length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 25,
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            color: ConstantColors.neutral_200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  commonEvents[0]['penalitiesMissed'][index]
                                      .toString(),
                                ),
                                const Text(
                                  "X",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    backgroundColor: Colors.red,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // Yellow Cards
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 0,
                      // maxHeight: 100,
                      minWidth: MediaQuery.of(context).size.width * 0.5,
                    ),
                    child: DecoratedBox(
                      decoration: const BoxDecoration(),
                      child: ListView.builder(
                        itemCount: commonEvents[0]['yellows'].length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 25,
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            color: ConstantColors.neutral_200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  commonEvents[0]['yellows'][index].toString(),
                                ),
                                Container(
                                  height: 20,
                                  width: 12,
                                  color: Colors.amber,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // Red Cards
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 0,
                      // maxHeight: 100,
                      minWidth: MediaQuery.of(context).size.width * 0.5,
                    ),
                    child: DecoratedBox(
                      decoration: const BoxDecoration(),
                      child: ListView.builder(
                        itemCount: commonEvents[0]['reds'].length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 25,
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            color: ConstantColors.neutral_200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  commonEvents[0]['reds'][index].toString(),
                                ),
                                Container(
                                  height: 20,
                                  width: 12,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Away Team
        ConstrainedBox(
          constraints: BoxConstraints(
            // minHeight: 0,
            // maxHeight: 380,
            minWidth: MediaQuery.of(context).size.width * 0.5,
          ),
          child: DecoratedBox(
            decoration: const BoxDecoration(),
            child: Column(
              children: [
                // Assists
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 0,
                      // maxHeight: 100,
                      minWidth: MediaQuery.of(context).size.width * 0.5,
                    ),
                    child: DecoratedBox(
                      decoration: const BoxDecoration(),
                      child: ListView.builder(
                        itemCount: commonEvents[1]['assists'].length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 25,
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            color: ConstantColors.neutral_200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  commonEvents[1]['assists'][index].toString(),
                                ),
                                const Text(
                                  "A",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    backgroundColor: Colors.black,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // penalitiesMissed
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 0,
                      // maxHeight: 100,
                      minWidth: MediaQuery.of(context).size.width * 0.5,
                    ),
                    child: DecoratedBox(
                      decoration: const BoxDecoration(),
                      child: ListView.builder(
                        itemCount: commonEvents[1]['penalitiesMissed'].length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 25,
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            color: ConstantColors.neutral_200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  commonEvents[1]['penalitiesMissed'][index]
                                      .toString(),
                                ),
                                const Text(
                                  "X",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    backgroundColor: Colors.red,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // Yellow Cards
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 0,
                      // maxHeight: 100,
                      minWidth: MediaQuery.of(context).size.width * 0.5,
                    ),
                    child: DecoratedBox(
                      decoration: const BoxDecoration(),
                      child: ListView.builder(
                        itemCount: commonEvents[1]['yellows'].length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 25,
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            color: ConstantColors.neutral_200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  commonEvents[1]['yellows'][index].toString(),
                                ),
                                Container(
                                  height: 20,
                                  width: 12,
                                  color: Colors.amber,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // Red Cards
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 0,
                      // maxHeight: 100,
                      minWidth: MediaQuery.of(context).size.width * 0.5,
                    ),
                    child: DecoratedBox(
                      decoration: const BoxDecoration(),
                      child: ListView.builder(
                        itemCount: commonEvents[1]['reds'].length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 25,
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            color: ConstantColors.neutral_200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  commonEvents[1]['reds'][index].toString(),
                                ),
                                Container(
                                  height: 20,
                                  width: 12,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

List getAllEvents({required Map<String, Fixture> fixture}) {
  Map<String, dynamic> allHomeEvents = {
    "ownGoals": [],
    "assists": [],
    "yellows": [],
    "reds": [],
    "penalitiesMissed": [],
  };
  Map<String, dynamic> allAwayEvents = {
    "ownGoals": [],
    "assists": [],
    "yellows": [],
    "reds": [],
    "penalitiesMissed": [],
  };
  Map<dynamic, dynamic> homeEvents =
      fixture['fixture']!.homeTeamLineUp.value.fold(
            (l) => {},
            (r) => r,
          );
  Map<dynamic, dynamic> awayEvents =
      fixture['fixture']!.awayTeamLineUp.value.fold(
            (l) => {},
            (r) => r,
          );

  homeEvents.forEach(
    (key, value) {
      for (var homeEvent in value) {
        String currentPlayerName = homeEvent['playerName'];
        if (homeEvent['playerStat'].length > 0) {
          List allPlayerStat = homeEvent['playerStat'];
          for (var player in allPlayerStat) {
            if (player['assists'] != 0) {
              allHomeEvents['assists'].add(currentPlayerName);
            }

            if (player['yellows'] != 0) {
              allHomeEvents['yellows'].add(currentPlayerName);
            }

            if (player['reds'] != 0) {
              allHomeEvents['reds'].add(currentPlayerName);
            }

            if (player['penalitiesMissed'] != 0) {
              allHomeEvents['penalitiesMissed'].add(currentPlayerName);
            }

            if (player['ownGoal'] != 0) {
              allAwayEvents['ownGoal'].add(currentPlayerName);
            }
          }
        }
      }
    },
  );

  awayEvents.forEach(
    (key, value) {
      for (var awayEvent in value) {
        String currentPlayerName = awayEvent['playerName'];
        if (awayEvent['playerStat'].length > 0) {
          List allPlayerStat = awayEvent['playerStat'];
          for (var player in allPlayerStat) {
            if (player['assists'] != 0) {
              allAwayEvents['assists'].add(currentPlayerName);
            }

            if (player['yellows'] != 0) {
              allAwayEvents['yellows'].add(currentPlayerName);
            }

            if (player['reds'] != 0) {
              allAwayEvents['reds'].add(currentPlayerName);
            }

            if (player['penalitiesMissed'] != 0) {
              allAwayEvents['penalitiesMissed'].add(currentPlayerName);
            }

            if (player['ownGoals'] != 0) {
              allAwayEvents['ownGoals'].add(currentPlayerName);
            }
          }
        }
      }
    },
  );

  return [allHomeEvents, allAwayEvents];
}
