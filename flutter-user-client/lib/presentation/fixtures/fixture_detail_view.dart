import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:efpl/domain/fixture/fixture.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/fixtures/widgets/fixture_detail_event.dart';
import 'package:efpl/presentation/fixtures/widgets/fixture_detail_lineup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:tab_container/tab_container.dart';

class FixtureDetailView extends StatelessWidget {
  const FixtureDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, Fixture> fixture =
        ModalRoute.of(context)?.settings.arguments as Map<String, Fixture>;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          getMatchAcronym(fixture: fixture),
          style: const TextStyle(
            letterSpacing: 0.5,
            fontFamily: "Architect",
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: ConstantColors.primary_800,
        foregroundColor: ConstantColors.neutral_200,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER
            Container(
              height: 205,
              color: ConstantColors.neutral_200,
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
                            imageUrl: getImageUrl(fixture: fixture, isHome: 1),
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          getShortName(fixture: fixture, isHome: 1),
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
                        getShortStatus(fixture: fixture) != "Not Live"
                            ? Text(
                                getShortStatus(fixture: fixture),
                              )
                            : const Text(""),
                        //
                        const SizedBox(
                          height: 8,
                        ),

                        getShortStatus(fixture: fixture) != "Not Live"
                            ? Text(
                                fixture['fixture']!.score.value.fold(
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
                                getFormattedTime(fixture: fixture),
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          fixture['fixture']!.homeTeamCity.value.fold(
                                (l) => '',
                                (r) => r.toString(),
                              ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          fixture['fixture']!.homeTeamStadium.value.fold(
                                (l) => '',
                                (r) => r.toString(),
                              ),
                          textAlign: TextAlign.center,
                        ),

                        Text(
                          "( " +
                              fixture['fixture']!.homeTeamCapacity.value.fold(
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
                            imageUrl: getImageUrl(fixture: fixture, isHome: 0),
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          getShortName(fixture: fixture, isHome: 0),
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
              height: 80,
              decoration: const BoxDecoration(
                color: ConstantColors.neutral_200,
                border: Border(
                  bottom: BorderSide(
                    width: 0.5,
                    color: ConstantColors.primary_800,
                  ),
                  top: BorderSide(
                    width: 0.5,
                    color: ConstantColors.primary_800,
                  ),
                ),
              ),
            ),

            // Tab View

            ConstrainedBox(
              // height: 1060,
              constraints: const BoxConstraints(
                minHeight: 40,
                maxHeight: 1060,
              ),
              child: TabContainer(
                radius: 0,
                color: ConstantColors.primary_200,
                children: [
                  FixtureDetailLineUp(fixture: fixture),
                  FixtureDetailEvent(fixture: fixture),
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
    );
  }
}

String getMatchAcronym({required Map<String, Fixture> fixture}) {
  if (fixture.isNotEmpty) {
    Fixture? fixtureO = fixture['fixture'];
    List? homeTeamLong = fixtureO!.homeTeam.value
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
    List? awayTeamLong = fixtureO.awayTeam.value
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
  } else {
    return "";
  }
}

String getShortName(
    {required Map<String, Fixture> fixture, required int isHome}) {
  if (isHome == 1) {
    List nameLong = fixture['fixture']!
        .homeTeam
        .value
        .fold(
          (l) => '',
          (r) => r.toString(),
        )
        .split(" ");

    nameLong.removeLast();
    return nameLong.join(" ");
  } else {
    List nameLong = fixture['fixture']!
        .awayTeam
        .value
        .fold(
          (l) => '',
          (r) => r.toString(),
        )
        .split(" ");
    nameLong.removeLast();
    return nameLong.join(" ");
  }
}

String getImageUrl(
    {required Map<String, Fixture> fixture, required int isHome}) {
  String finalPath = dotenv.env["BASE_URL"].toString();
  if (isHome == 1) {
    String path = fixture['fixture']!.homeTeamLogo.value.fold(
          (l) => '',
          (r) => r.toString(),
        );

    finalPath = finalPath + path;
  } else {
    String path = fixture['fixture']!.awayTeamLogo.value.fold(
          (l) => '',
          (r) => r.toString(),
        );
    finalPath = finalPath + path;
  }
  return finalPath;
}

String getShortStatus({required Map<String, Fixture> fixture}) {
  String status = fixture['fixture']!.status.value.fold((l) => '', (r) => r);

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

String getFormattedTime({required Map<dynamic, Fixture> fixture}) {
  String scheduleString = fixture['fixture']!.schedule.value.fold(
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
