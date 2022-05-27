import 'package:efpl/application/fixture/fixture_bloc.dart';
import 'package:efpl/domain/fixture/fixture.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FixtureDetailEvent extends StatelessWidget {
  final Fixture fixture;
  const FixtureDetailEvent({Key? key, required this.fixture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List commonEvents = getAllEvents(fixture: fixture);
    bool isEvent = checkEvent(commonEvents: commonEvents);

    // print(commonEvents);

    return BlocProvider.value(
      value: getIt<FixtureBloc>(),
      child: BlocConsumer<FixtureBloc, FixtureState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return isEvent == false
              ? const SizedBox(
                  height: 350,
                  child: Center(
                    child: Text(
                      "No Events yet",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Architect",
                      ),
                    ),
                  ),
                )
              : Row(
                  children: [
                    // Home Team
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 0,
                        minWidth: MediaQuery.of(context).size.width * 0.5,
                      ),
                      child: DecoratedBox(
                        decoration: const BoxDecoration(),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              // Assists
                              Container(
                                color: Colors.amber,
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: 0,
                                    minWidth:
                                        MediaQuery.of(context).size.width * 0.5,
                                  ),
                                  child: DecoratedBox(
                                    decoration: const BoxDecoration(),
                                    child: ListView.builder(
                                      itemCount:
                                          commonEvents[0]['assists'].length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        List<int> _items = List.generate(
                                          commonEvents[0]['assists'][index]
                                              ['count'],
                                          (i) => i,
                                        );
                                        return Container(
                                          height: 25,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6),
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 6,
                                          ),
                                          child: Wrap(
                                            children: [
                                              Text(
                                                commonEvents[0]['assists']
                                                        [index]['playerName']
                                                    .toString(),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Wrap(
                                                direction: Axis.horizontal,
                                                children: _items
                                                    .map(
                                                      (i) => Container(
                                                        margin: const EdgeInsets
                                                                .fromLTRB(
                                                            4, 3, 0, 0),
                                                        color: Colors.black,
                                                        child: const Text(
                                                          "A",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                    .toList(),
                                              ),
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
                                margin:
                                    const EdgeInsets.symmetric(vertical: 15),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: 0,
                                    // maxHeight: 100,
                                    minWidth:
                                        MediaQuery.of(context).size.width * 0.5,
                                  ),
                                  child: DecoratedBox(
                                    decoration: const BoxDecoration(),
                                    child: ListView.builder(
                                      itemCount: commonEvents[0]
                                              ['penalitiesMissed']
                                          .length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        List<int> _items = List.generate(
                                          commonEvents[0]['penalitiesMissed']
                                              [index]['count'],
                                          (i) => i,
                                        );
                                        return Container(
                                          height: 25,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6),
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 6),
                                          color: ConstantColors.neutral_200,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                commonEvents[0]
                                                            ['penalitiesMissed']
                                                        [index]['playerName']
                                                    .toString(),
                                              ),
                                              Wrap(
                                                direction: Axis.horizontal,
                                                children: _items
                                                    .map(
                                                      (i) => Container(
                                                        margin: const EdgeInsets
                                                                .fromLTRB(
                                                            4, 3, 0, 0),
                                                        color: Colors.black,
                                                        child: const Text(
                                                          "X",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            backgroundColor:
                                                                Colors.red,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                    .toList(),
                                              ),
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
                                margin:
                                    const EdgeInsets.symmetric(vertical: 15),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: 0,
                                    // maxHeight: 100,
                                    minWidth:
                                        MediaQuery.of(context).size.width * 0.5,
                                  ),
                                  child: DecoratedBox(
                                    decoration: const BoxDecoration(),
                                    child: ListView.builder(
                                      itemCount:
                                          commonEvents[0]['yellows'].length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        List<int> _items = List.generate(
                                          commonEvents[0]['yellows'][index]
                                              ['count'],
                                          (i) => i,
                                        );
                                        return Container(
                                          height: 25,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6),
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 6),
                                          color: ConstantColors.neutral_200,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                commonEvents[0]['yellows']
                                                        [index]['playerName']
                                                    .toString(),
                                              ),

                                              // RED Card from 2 yellows
                                              commonEvents[0]['yellows'][index]
                                                          ['count'] >
                                                      1
                                                  ? Container(
                                                      height: 20,
                                                      width: 12,
                                                      color: Colors.red,
                                                    )
                                                  : Container(),
                                              Wrap(
                                                direction: Axis.horizontal,
                                                children: _items
                                                    .map(
                                                      (i) => Container(
                                                        margin: const EdgeInsets
                                                                .fromLTRB(
                                                            2, 3, 0, 0),
                                                        color: Colors.black,
                                                        child: Container(
                                                          height: 20,
                                                          width: 12,
                                                          color: Colors.amber,
                                                        ),
                                                      ),
                                                    )
                                                    .toList(),
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
                                margin:
                                    const EdgeInsets.symmetric(vertical: 15),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: 0,
                                    // maxHeight: 100,
                                    minWidth:
                                        MediaQuery.of(context).size.width * 0.5,
                                  ),
                                  child: DecoratedBox(
                                    decoration: const BoxDecoration(),
                                    child: ListView.builder(
                                      itemCount: commonEvents[0]['reds'].length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          height: 25,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6),
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 6),
                                          color: ConstantColors.neutral_200,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                commonEvents[0]['reds'][index]
                                                        ['playerName']
                                                    .toString(),
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
                    ),

                    // Away Team
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 0,
                        minWidth: MediaQuery.of(context).size.width * 0.5,
                      ),
                      child: DecoratedBox(
                        decoration: const BoxDecoration(),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              // Assists
                              Container(
                                color: Colors.amber,
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: 0,
                                    minWidth:
                                        MediaQuery.of(context).size.width * 0.5,
                                  ),
                                  child: DecoratedBox(
                                    decoration: const BoxDecoration(),
                                    child: ListView.builder(
                                      itemCount:
                                          commonEvents[1]['assists'].length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        List<int> _items = List.generate(
                                          commonEvents[1]['assists'][index]
                                              ['count'],
                                          (i) => i,
                                        );
                                        return Container(
                                          height: 25,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6),
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 6),
                                          color: ConstantColors.neutral_200,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                commonEvents[1]['assists']
                                                        [index]['playerName']
                                                    .toString(),
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
                                margin:
                                    const EdgeInsets.symmetric(vertical: 15),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: 0,
                                    // maxHeight: 100,
                                    minWidth:
                                        MediaQuery.of(context).size.width * 0.5,
                                  ),
                                  child: DecoratedBox(
                                    decoration: const BoxDecoration(),
                                    child: ListView.builder(
                                      itemCount: commonEvents[1]
                                              ['penalitiesMissed']
                                          .length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          height: 25,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6),
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 6),
                                          color: ConstantColors.neutral_200,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                commonEvents[1]
                                                            ['penalitiesMissed']
                                                        [index]['playerName']
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
                                margin:
                                    const EdgeInsets.symmetric(vertical: 15),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: 0,
                                    // maxHeight: 100,
                                    minWidth:
                                        MediaQuery.of(context).size.width * 0.5,
                                  ),
                                  child: DecoratedBox(
                                    decoration: const BoxDecoration(),
                                    child: ListView.builder(
                                      itemCount:
                                          commonEvents[1]['yellows'].length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          height: 25,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6),
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 6),
                                          color: ConstantColors.neutral_200,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                commonEvents[1]['yellows']
                                                        [index]['playerName']
                                                    .toString(),
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
                                margin:
                                    const EdgeInsets.symmetric(vertical: 15),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: 0,
                                    // maxHeight: 100,
                                    minWidth:
                                        MediaQuery.of(context).size.width * 0.5,
                                  ),
                                  child: DecoratedBox(
                                    decoration: const BoxDecoration(),
                                    child: ListView.builder(
                                      itemCount: commonEvents[1]['reds'].length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          height: 25,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6),
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 6),
                                          color: ConstantColors.neutral_200,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                commonEvents[1]['reds'][index]
                                                        ['playerName']
                                                    .toString(),
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
                    ),
                  ],
                );
        },
      ),
    );
  }
}

List getAllEvents({required Fixture fixture}) {
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
  Map<dynamic, dynamic> homeEvents = fixture.homeTeamLineUp.value.fold(
    (l) => {},
    (r) => r,
  );
  Map<dynamic, dynamic> awayEvents = fixture.awayTeamLineUp.value.fold(
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
              allHomeEvents['assists'].add({
                "playerName": currentPlayerName,
                "count": player['assists']
              });
            }

            if (player['yellows'] != 0) {
              allHomeEvents['yellows'].add({
                "playerName": currentPlayerName,
                "count": player['yellows']
              });
            }

            if (player['reds'] != 0) {
              allHomeEvents['reds'].add(
                {
                  "playerName": currentPlayerName,
                  "count": player['reds'],
                },
              );
            }

            if (player['penalitiesMissed'] != 0) {
              allHomeEvents['penalitiesMissed'].add({
                "playerName": currentPlayerName,
                "count": player['penalitiesMissed']
              });
            }

            if (player['ownGoal'] != 0) {
              allAwayEvents['ownGoal'].add({
                "playerName": currentPlayerName,
                "count": player['ownGoal']
              });
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
              allAwayEvents['assists'].add({
                "playerName": currentPlayerName,
                "count": player['assists']
              });
            }

            if (player['yellows'] != 0) {
              allAwayEvents['yellows'].add({
                "playerName": currentPlayerName,
                "count": player['yellows']
              });
            }

            if (player['reds'] != 0) {
              allAwayEvents['reds'].add(
                  {"playerName": currentPlayerName, "count": player['reds']});
            }

            if (player['penalitiesMissed'] != 0) {
              allAwayEvents['penalitiesMissed'].add({
                "playerName": currentPlayerName,
                "count": player['penalitiesMissed']
              });
            }

            if (player['ownGoals'] != 0) {
              allAwayEvents['ownGoals'].add({
                "playerName": currentPlayerName,
                "count": player['ownGoals']
              });
            }
          }
        }
      }
    },
  );

  return [allHomeEvents, allAwayEvents];
}

bool checkEvent({required List commonEvents}) {
  bool isEventLive = false;

  for (var i = 0; i < commonEvents.length; i++) {
    if (commonEvents[i]['ownGoals'].isNotEmpty ||
        commonEvents[i]['assists'].isNotEmpty ||
        commonEvents[i]['yellows'].isNotEmpty ||
        commonEvents[i]['reds'].isNotEmpty ||
        commonEvents[i]['penalitiesMissed'].isNotEmpty) {
      isEventLive = true;
    }
  }

  return isEventLive;
}
