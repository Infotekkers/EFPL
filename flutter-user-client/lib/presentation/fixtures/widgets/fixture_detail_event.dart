import 'package:efpl/application/fixture/fixture_bloc.dart';
import 'package:efpl/domain/fixture/fixture.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/fixtures/widgets/fixture_event_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FixtureDetailEvent extends StatelessWidget {
  final Fixture fixture;
  const FixtureDetailEvent({Key? key, required this.fixture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List commonEvents = getAllEvents(fixture: fixture);
    bool isEvent = checkEvent(commonEvents: commonEvents);

    return BlocProvider.value(
      value: getIt<FixtureBloc>(),
      child: BlocBuilder<FixtureBloc, FixtureState>(
        builder: (context, state) {
          return isEvent == false
              ? SizedBox(
                  height: 350,
                  child: Center(
                    child: Text(
                      "No Events yet",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Home Team
                    FixtureEventDisplay(commonEvents: commonEvents[0]),

                    // Away Team
                    FixtureEventDisplay(commonEvents: commonEvents[1]),
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
