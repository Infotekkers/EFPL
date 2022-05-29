import 'package:cached_network_image/cached_network_image.dart';
import 'package:efpl/application/fixture/fixture_bloc.dart';
import 'package:efpl/domain/fixture/fixture.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/fixtures/widgets/fixture_detail_event.dart';
import 'package:efpl/presentation/fixtures/widgets/fixture_detail_lineup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:tab_container/tab_container.dart';

class FixtureDetailView extends StatelessWidget {
  const FixtureDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FixtureBloc, FixtureState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        // get match id from args
        final args =
            ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
        final String matchId = args['matchId'];

        // get current fixture
        Fixture currentFixture = state.allFixtures
            .where((fixture) =>
                fixture.matchId.value.fold(
                  (l) => '',
                  (r) => r,
                ) ==
                matchId)
            .toList()[0];

        // away players who scored
        Map awayTeamPlayersScoreInfo = currentFixture.awayTeamLineUp.value.fold(
          (l) => {},
          (r) => r,
        );
        List allAwayPlayersWhoScored =
            getPlayersWhoScored(teamScoreInfo: awayTeamPlayersScoreInfo);

        // home players who scored
        Map homeTeamPlayersScoreInfo = currentFixture.homeTeamLineUp.value.fold(
          (l) => {},
          (r) => r,
        );
        List allHomePlayersWhoScored =
            getPlayersWhoScored(teamScoreInfo: homeTeamPlayersScoreInfo);

        return Scaffold(
          // APP BAR
          appBar: AppBar(
            title: Text(
              getMatchAcronym(fixture: currentFixture),
              style: const TextStyle(
                letterSpacing: 0.5,
                fontFamily: "Architect",
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.blue[50],
            foregroundColor: ConstantColors.primary_900,
            elevation: 0,
          ),

          // BODY
          body: LiquidPullToRefresh(
            onRefresh: () async {
              getIt<FixtureBloc>().add(
                const FixtureEvent.loadFixtures(),
              );
            },
            height: 60,
            showChildOpacityTransition: false,
            animSpeedFactor: 2,
            color: ConstantColors.primary_900,
            child: Container(
              color: Colors.blue[50],
              child: Column(
                children: [
                  // HEADER
                  Container(
                    height: 200,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Home Team
                        SizedBox(
                          height: 180,
                          width: MediaQuery.of(context).size.width * 0.30,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 105,
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: getImageUrl(
                                      fixture: currentFixture, isHome: 1),
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                getShortName(
                                    fixture: currentFixture, isHome: 1),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        // match Info
                        SizedBox(
                          height: 165,
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              getShortStatus(fixture: currentFixture) !=
                                      "Not Live"
                                  ? Text(
                                      getShortStatus(fixture: currentFixture),
                                    )
                                  : const Text(""),
                              //
                              const SizedBox(
                                height: 8,
                              ),

                              getShortStatus(fixture: currentFixture) !=
                                      "Not Live"
                                  ? Text(
                                      currentFixture.score.value.fold(
                                        (l) => '',
                                        (r) =>
                                            r.toString().split("v").join(" - "),
                                      ),
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : Text(
                                      getFormattedTime(fixture: currentFixture),
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                currentFixture.homeTeamCity.value.fold(
                                  (l) => '',
                                  (r) => r.toString(),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                currentFixture.homeTeamStadium.value.fold(
                                  (l) => '',
                                  (r) => r.toString(),
                                ),
                                textAlign: TextAlign.center,
                              ),

                              Text(
                                "( " +
                                    currentFixture.homeTeamCapacity.value.fold(
                                      (l) => '',
                                      (r) => r.toString(),
                                    ) +
                                    " )",
                                style: const TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 175,
                          width: MediaQuery.of(context).size.width * 0.30,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 100,
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: getImageUrl(
                                      fixture: currentFixture, isHome: 0),
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                getShortName(
                                    fixture: currentFixture, isHome: 0),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // SCORE INFO
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 0.5,
                          color: ConstantColors.primary_800.withOpacity(0.25),
                        ),
                        top: BorderSide(
                          width: 0.5,
                          color: ConstantColors.primary_800.withOpacity(0.25),
                        ),
                      ),
                    ),
                    child: allHomePlayersWhoScored.isEmpty &&
                            allAwayPlayersWhoScored.isEmpty
                        ? const Center(
                            child: Icon(
                              FontAwesome.soccer_ball,
                              size: 30,
                            ),
                          )
                        : Row(
                            children: [
                              // Home Scorers
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: ListView.builder(
                                  itemCount: allHomePlayersWhoScored.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    List<int> _items = List.generate(
                                      allHomePlayersWhoScored[index]
                                          ['playerStat'][0]['goals'],
                                      (i) => i,
                                    );
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 5),
                                      child: Wrap(
                                        children: [
                                          Text(
                                            allHomePlayersWhoScored[index]
                                                ['playerName'],
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Wrap(
                                            direction: Axis.horizontal,
                                            children: _items
                                                .map(
                                                  (i) => const Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            3, 0, 0, 0),
                                                    child: Icon(
                                                      FontAwesome.soccer_ball,
                                                      size: 15,
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              // Away Scorers
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: ListView.builder(
                                  itemCount: allAwayPlayersWhoScored.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    List<int> _items = List.generate(
                                      allAwayPlayersWhoScored[index]
                                          ['playerStat'][0]['goals'],
                                      (i) => i,
                                    );
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 0, 0, 0),
                                        child: Wrap(
                                          children: [
                                            Text(
                                              allAwayPlayersWhoScored[index]
                                                  ['playerName'],
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Wrap(
                                              direction: Axis.horizontal,
                                              children: _items
                                                  .map(
                                                    (i) => const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              3, 0, 0, 0),
                                                      child: Icon(
                                                        FontAwesome.soccer_ball,
                                                        size: 15,
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                  ),

                  // Tab View

                  SizedBox(
                    height: MediaQuery.of(context).size.height - 410,
                    child: TabContainer(
                      radius: 0,
                      color: Colors.blue[100],
                      children: [
                        SingleChildScrollView(
                            child:
                                FixtureDetailLineUp(fixture: currentFixture)),
                        FixtureDetailEvent(fixture: currentFixture),
                      ],
                      tabs: const [
                        'Line Ups',
                        'Events',
                      ],
                    ),
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

String getMatchAcronym({required Fixture fixture}) {
  List homeTeamLong = fixture.homeTeam.value
      .fold(
        (l) => null,
        (r) => r,
      )!
      .split(" ");

  homeTeamLong.removeLast();

  String homeTeamShort = "";
  for (var homeTeam in homeTeamLong) {
    if (homeTeamLong.length == 3) {
      homeTeamShort = homeTeamShort + homeTeam.split("")[0];
    } else if (homeTeamLong.length < 3) {
      if (homeTeamShort.length < 2) {
        homeTeamShort = homeTeamShort +
            homeTeam.split("")[0].toString().toUpperCase() +
            homeTeam.split("")[1].toString().toUpperCase();
      } else {
        homeTeamShort =
            homeTeamShort + homeTeam.split("")[0].toString().toUpperCase();
      }
    }
  }

  //
  List? awayTeamLong = fixture.awayTeam.value
      .fold(
        (l) => null,
        (r) => r,
      )!
      .split(" ");

  String awayTeamShort = "";
  awayTeamLong.removeLast();
  for (var awayTeam in awayTeamLong) {
    if (awayTeamLong.length == 3) {
      awayTeamShort = awayTeamShort + awayTeam.split("")[0];
    } else if (awayTeamLong.length < 3) {
      if (awayTeamShort.length < 2) {
        awayTeamShort = awayTeamShort +
            awayTeam.split("")[0].toString().toUpperCase() +
            awayTeam.split("")[1].toString().toUpperCase();
      } else {
        awayTeamShort =
            awayTeamShort + awayTeam.split("")[0].toString().toUpperCase();
      }
    }
  }

  return (homeTeamShort + " v " + awayTeamShort);
}

String getShortName({required Fixture fixture, required int isHome}) {
  if (isHome == 1) {
    List nameLong = fixture.homeTeam.value
        .fold(
          (l) => '',
          (r) => r.toString(),
        )
        .split(" ");

    nameLong.removeLast();
    return nameLong.join(" ");
  } else {
    List nameLong = fixture.awayTeam.value
        .fold(
          (l) => '',
          (r) => r.toString(),
        )
        .split(" ");
    nameLong.removeLast();
    return nameLong.join(" ");
  }
}

String getImageUrl({required Fixture fixture, required int isHome}) {
  String finalPath = dotenv.env["BASE_URL"].toString();
  if (isHome == 1) {
    String path = fixture.homeTeamLogo.value.fold(
      (l) => '',
      (r) => r.toString(),
    );

    finalPath = finalPath + path;
  } else {
    String path = fixture.awayTeamLogo.value.fold(
      (l) => '',
      (r) => r.toString(),
    );
    finalPath = finalPath + path;
  }
  return finalPath;
}

String getShortStatus({required Fixture fixture}) {
  String status = fixture.status.value.fold((l) => '', (r) => r);

  String finalStatus = "Not Live";

  if (status == "liveFH") {
    finalStatus = "FH";
  } else if (status == "HT") {
    finalStatus = "HT";
  } else if (status == "liveSH") {
    finalStatus = "SH";
  } else if (status == "FT") {
    finalStatus = "FT";
  }

  return finalStatus;
}

String getFormattedTime({required Fixture fixture}) {
  String scheduleString = fixture.schedule.value.fold(
    (l) => '',
    (r) => r,
  );

  final dateTime = DateTime.parse(scheduleString);
  String hour = dateTime.hour < 10
      ? "0" + dateTime.hour.toString()
      : dateTime.hour.toString();
  String minute = dateTime.minute < 10
      ? "0" + dateTime.minute.toString()
      : dateTime.minute.toString();
  return hour + ":" + minute;
}

List getPlayersWhoScored({required Map teamScoreInfo}) {
  // empty list to track players who scored
  List allPlayersWhoScored = [];

  for (var position in teamScoreInfo.keys) {
    List currentPositionList = teamScoreInfo[position];

    List playersWhoScored = currentPositionList
        .where((currentPlayer) => currentPlayer['playerStat'][0]['goals'] > 0)
        .toList();

    if (playersWhoScored.isNotEmpty) {
      for (var scoredPlayer in playersWhoScored) {
        allPlayersWhoScored.add(scoredPlayer);
      }
    }
  }

  return allPlayersWhoScored;
}
