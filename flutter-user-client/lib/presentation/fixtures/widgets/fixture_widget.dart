import 'package:efpl/application/fixture/fixture_bloc.dart';
import 'package:efpl/domain/fixture/fixture.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FixtureWidget extends StatelessWidget {
  final Fixture fixture;
  const FixtureWidget({
    Key? key,
    required this.fixture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // prep
    var schedule = fixture.schedule.value.fold((l) => 0, (r) => r);
    String formattedDateTime = formatTime(schedule.toString());
    String matchStatus = fixture.status.value.fold((l) => '', (r) => r);

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          "/fixtureDetails",
          arguments: {"fixture": fixture},
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
          ),
          color: Colors.amber,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Home Team
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.37,
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        getShortName(fixture: fixture, isHome: 1),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        width: 40,
                        height: 40,
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
                      )
                    ],
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                  color: Colors.black,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    matchStatus == 'scheduled'
                        ? formattedDateTime
                        : fixture.score.value.fold(
                            (l) => '',
                            (r) => r.split("v").join(" - "),
                          ),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              height: 30,
              width: MediaQuery.of(context).size.width * 0.15,
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        width: 40,
                        height: 40,
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
                      Text(
                        getShortName(fixture: fixture, isHome: 0),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              height: 50,
              width: MediaQuery.of(context).size.width * 0.37,
            ),
          ],
        ),
      ),
    );
  }
}

String formatTime(String schedule) {
  var date = DateTime.parse(schedule.toString());
  String hour =
      date.hour > 9 ? date.hour.toString() : "0" + date.hour.toString();
  String minute =
      date.minute > 9 ? date.minute.toString() : "0" + date.minute.toString();

  return hour + " : " + minute;
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
