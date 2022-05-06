import 'package:cached_network_image/cached_network_image.dart';
import 'package:efpl/domain/fixture/fixture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FixtureDetailView extends StatelessWidget {
  const FixtureDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, Fixture> fixture =
        ModalRoute.of(context)?.settings.arguments as Map<String, Fixture>;

    String matchStatus = fixture['fixture']!.status.value.fold(
          (l) => '',
          (r) => r.toString(),
        );

    String matchScore = fixture['fixture']!.score.value.fold(
          (l) => '',
          (r) => r.toString(),
        );

    String city = fixture['fixture']!.homeTeamCity.value.fold(
          (l) => '',
          (r) => r.toString(),
        );

    String stadium = fixture['fixture']!.homeTeamStadium.value.fold(
          (l) => '',
          (r) => r.toString(),
        );

    String capacity = fixture['fixture']!.homeTeamCapacity.value.fold(
          (l) => '',
          (r) => r.toString(),
        );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          getMatchAcronym(fixture: fixture),
        ),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              height: 200,
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Home Team
                  SizedBox(
                    height: 175,
                    width: MediaQuery.of(context).size.width * 0.30,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
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
                    height: 150,
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        matchStatus == "scheduled"
                            ? const Text("SCH")
                            : Text(matchStatus),
                        //
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          matchScore.split("v").join(" - "),
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(city),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          stadium,
                          textAlign: TextAlign.center,
                        ),

                        Text(
                          "( " + capacity + " )",
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
            // Score info
            // TODO:MAke Stat
            Container(
              height: 80,
              color: Colors.red,
            ),
            // LineUps
            Container(
              child: Column(
                children: [
                  // GKS
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12),
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.green,
                    child: Column(
                      children: [
                        const Text(
                          "GOALKEEPERS",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("data"), Text("data")],
                        )
                      ],
                    ),
                  ),

                  // DEFENDERs
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12),
                    height: 170,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.purple,
                    child: Column(
                      children: [
                        const Text(
                          "DEFENDERS",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("data"), Text("data")],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("data"), Text("data")],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("data"), Text("data")],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("data"), Text("data")],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("data"), Text("data")],
                        )
                      ],
                    ),
                  ),
                  // MIDFIELDER
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12),
                    height: 170,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blue,
                    child: Column(
                      children: [
                        const Text(
                          "MIDFIELDERS",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("data"), Text("data")],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("data"), Text("data")],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("data"), Text("data")],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("data"), Text("data")],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("data"), Text("data")],
                        )
                      ],
                    ),
                  ),
                  // Attackers
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12),
                    height: 170,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.limeAccent,
                    child: Column(
                      children: [
                        const Text(
                          "DEFENDERS",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("data"), Text("data")],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("data"), Text("data")],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("data"), Text("data")],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("data"), Text("data")],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("data"), Text("data")],
                        )
                      ],
                    ),
                  ),

                  // SUBSTITUTES
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blueGrey,
                    child: Column(
                      children: [
                        const Text(
                          "SUBSTITUTES",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("data"), Text("data")],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("data"), Text("data")],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("data"), Text("data")],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("data"), Text("data")],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("data"), Text("data")],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
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
      if (homeTeamLong.length == 3) {
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
