import 'package:efpl/domain/fixture/fixture.dart';
import 'package:flutter/cupertino.dart';
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
            minHeight: 56.0,
            maxHeight: 380,
            minWidth: MediaQuery.of(context).size.width * 0.5,
          ),
          child: DecoratedBox(
            decoration: const BoxDecoration(color: Colors.red),
            child: Column(
              children: [
                // Assists
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  height: 20,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ListView.builder(
                      itemCount: commonEvents[0]['assists'].length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 20,
                          color: Colors.blue,
                          child: Text(commonEvents[0]['assists'][index]),
                        );
                      }),
                ),

                // penalitiesMissed
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 20,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ListView.builder(
                      itemCount: commonEvents[0]['penalitiesMissed'].length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 20,
                          color: Colors.blue,
                          child:
                              Text(commonEvents[0]['penalitiesMissed'][index]),
                        );
                      }),
                ),

                // Yellow Cards
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 20,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ListView.builder(
                      itemCount: commonEvents[0]['yellows'].length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 20,
                          color: Colors.blue,
                          child: Text(commonEvents[0]['yellows'][index]),
                        );
                      }),
                ),

                // Yellow Cards
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 20,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ListView.builder(
                      itemCount: commonEvents[0]['reds'].length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 20,
                          color: Colors.blue,
                          child: Text(commonEvents[0]['reds'][index]),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 30,
          width: MediaQuery.of(context).size.width * 0.5,
          color: Colors.yellow,
        )
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
