import 'package:efpl/domain/fixture/fixture.dart';
import 'package:flutter/material.dart';

class FixtureWidget extends StatelessWidget {
  final Fixture fixture;
  const FixtureWidget({
    Key? key,
    required this.fixture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var schedule = fixture.schedule.value.fold((l) => 0, (r) => r);
    String formattedDateTime = formatTime(schedule.toString());
    String matchStatus = fixture.status.value.fold((l) => '', (r) => r);
    String matchId = fixture.matchId.value.fold((l) => '', (r) => r);

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
        // margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        height: 55,
        // color: Colors.amber,
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
                  Text(
                    fixture.homeTeam.value.fold((l) => '', (r) => r),
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
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
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
                  Text(fixture.awayTeam.value.fold((l) => '', (r) => r)),
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
