import 'package:efpl/application/fixture/fixture_bloc.dart';
import 'package:efpl/domain/fixture/fixture.dart';
import 'package:efpl/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FixtureDetailLineUp extends StatelessWidget {
  final Fixture fixture;
  const FixtureDetailLineUp({Key? key, required this.fixture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map homeTeamLineUpInfo =
        fixture.homeTeamLineUp.value.fold((l) => {}, (r) => r);

    Map awayTeamLineUpInfo =
        fixture.homeTeamLineUp.value.fold((l) => {}, (r) => r);

    bool isLineUpIn = false;

    if (homeTeamLineUpInfo.isNotEmpty &&
        homeTeamLineUpInfo['defenders'].isNotEmpty &&
        homeTeamLineUpInfo['midfielders'].isNotEmpty &&
        homeTeamLineUpInfo['strikers'].isNotEmpty &&
        homeTeamLineUpInfo['bench'].isNotEmpty &&
        awayTeamLineUpInfo.isNotEmpty &&
        awayTeamLineUpInfo['defenders'].isNotEmpty &&
        awayTeamLineUpInfo['midfielders'].isNotEmpty &&
        awayTeamLineUpInfo['strikers'].isNotEmpty &&
        awayTeamLineUpInfo['bench'].isNotEmpty) {
      isLineUpIn = true;
    }

    List<int> allPlayerCount = [0, 0, 0, 0, 0];

    if (isLineUpIn == true) {
      allPlayerCount = getPlayerCount(fixture: fixture);
    }
    Map<dynamic, dynamic> homeTeamLineUp =
        fixture.homeTeamLineUp.value.fold((l) => {}, (r) => r);

    Map<dynamic, dynamic> awayTeamLineUp =
        fixture.awayTeamLineUp.value.fold((l) => {}, (r) => r);

    return BlocProvider.value(
      value: getIt<FixtureBloc>(),
      child: BlocBuilder<FixtureBloc, FixtureState>(
        builder: (context, state) {
          return Container(
            child: isLineUpIn == false
                ? SizedBox(
                    height: 350,
                    child: Center(
                      child: Text(
                        "No Lineups yet",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        // GKS
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          height: 85,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 0.5, color: Colors.lightBlue.shade900),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Text(
                                "GOALKEEPERS",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              SizedBox(
                                height: 20,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: allPlayerCount[0],
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          homeTeamLineUp.isEmpty ||
                                                  homeTeamLineUp['defenders']
                                                      .isEmpty
                                              ? ""
                                              : homeTeamLineUp['goalkeepers']
                                                      [index]['playerName']
                                                  .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        Text(
                                          awayTeamLineUp.isEmpty ||
                                                  awayTeamLineUp['defenders']
                                                      .isEmpty
                                              ? ""
                                              : awayTeamLineUp['goalkeepers']
                                                      [index]['playerName']
                                                  .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        // DEFENDERs
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          height: 185,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 0.5, color: Colors.lightBlue.shade900),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Text(
                                "DEFENDERS",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                height: 120,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: allPlayerCount[1],
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      height: 16,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            homeTeamLineUp['defenders'].length -
                                                        1 >=
                                                    index
                                                ? homeTeamLineUp['defenders']
                                                        [index]['playerName']
                                                    .toString()
                                                : "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          Text(
                                            awayTeamLineUp['defenders'].length -
                                                        1 >=
                                                    index
                                                ? awayTeamLineUp['defenders']
                                                        [index]['playerName']
                                                    .toString()
                                                : "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),

                        // MIDFIELDER
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          height: 185,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 0.5,
                                color:
                                    Colors.lightBlue.shade900.withOpacity(0.35),
                              ),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Text(
                                "MIDFIELDERS",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                height: 120,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: allPlayerCount[2],
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      height: 16,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            homeTeamLineUp['midfielders']
                                                            .length -
                                                        1 >=
                                                    index
                                                ? homeTeamLineUp['midfielders']
                                                        [index]['playerName']
                                                    .toString()
                                                : "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          Text(
                                            awayTeamLineUp['midfielders']
                                                            .length -
                                                        1 >=
                                                    index
                                                ? awayTeamLineUp['midfielders']
                                                        [index]['playerName']
                                                    .toString()
                                                : "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),

                        // Attackers
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          height: 185,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 0.5, color: Colors.lightBlue.shade900),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Text(
                                "ATTACKERS",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                height: 120,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: allPlayerCount[3],
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      height: 16,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            homeTeamLineUp['strikers'].length -
                                                        1 >=
                                                    index
                                                ? homeTeamLineUp['strikers']
                                                        [index]['playerName']
                                                    .toString()
                                                : "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          Text(
                                            awayTeamLineUp['strikers'].length -
                                                        1 >=
                                                    index
                                                ? awayTeamLineUp['strikers']
                                                        [index]['playerName']
                                                    .toString()
                                                : "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),

                        // SUBSTITUTES
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          height: 265,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Text(
                                "SUBSTITUTES",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                height: 200,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: allPlayerCount[4],
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      height: 16,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            homeTeamLineUp['bench'].length -
                                                        1 >=
                                                    index
                                                ? homeTeamLineUp['bench'][index]
                                                        ['playerName']
                                                    .toString()
                                                : "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          Text(
                                            awayTeamLineUp['bench'].length -
                                                        1 >=
                                                    index
                                                ? awayTeamLineUp['bench'][index]
                                                        ['playerName']
                                                    .toString()
                                                : "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),

                        // COACHES
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          height: 70,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                width: 0.5,
                                color:
                                    Colors.lightBlue.shade900.withOpacity(0.35),
                              ),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Text(
                                "COACHES",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    fixture.homeTeamCoach.value
                                        .fold((l) => '', (r) => r),
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Text(
                                    fixture.awayTeamCoach.value.fold((l) => '',
                                        (r) => r.isEmpty ? "---" : r),
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}

List<int> getPlayerCount({required Fixture fixture}) {
  List<int> finalCount = [0, 0, 0, 0, 0];

  Map<dynamic, dynamic> homeTeamLineUp =
      fixture.homeTeamLineUp.value.fold((l) => {}, (r) => r);

  Map<dynamic, dynamic> awayTeamLineUp =
      fixture.awayTeamLineUp.value.fold((l) => {}, (r) => r);

  // no homeTeam
  if (homeTeamLineUp['defenders'].isEmpty) {
    finalCount = [
      1,
      awayTeamLineUp['defenders'].length,
      awayTeamLineUp['midfielders'].length,
      awayTeamLineUp['strikers'].length,
      awayTeamLineUp['bench'].length
    ];
  }
  // no away team
  else if (awayTeamLineUp['defenders'].isEmpty) {
    finalCount = [
      1,
      homeTeamLineUp['defenders'].length,
      homeTeamLineUp['midfielders'].length,
      homeTeamLineUp['strikers'].length,
      homeTeamLineUp['bench'].length
    ];
  }
  // both lineups
  else if (homeTeamLineUp.isNotEmpty &&
      awayTeamLineUp.isNotEmpty &&
      homeTeamLineUp['defenders'].isNotEmpty &&
      awayTeamLineUp['defenders'].isNotEmpty) {
    int maxDefCount =
        homeTeamLineUp['defenders'].length > awayTeamLineUp['defenders'].length
            ? homeTeamLineUp['defenders'].length
            : awayTeamLineUp['defenders'].length;

    int maxMidCount = homeTeamLineUp['midfielders'].length >
            awayTeamLineUp['midfielders'].length
        ? homeTeamLineUp['midfielders'].length
        : awayTeamLineUp['midfielders'].length;

    int maxAttCount =
        homeTeamLineUp['strikers'].length > awayTeamLineUp['strikers'].length
            ? homeTeamLineUp['strikers'].length
            : awayTeamLineUp['strikers'].length;

    int maxBenchCount =
        homeTeamLineUp['bench'].length > awayTeamLineUp['bench'].length
            ? homeTeamLineUp['bench'].length
            : awayTeamLineUp['bench'].length;

    finalCount = [1, maxDefCount, maxMidCount, maxAttCount, maxBenchCount];
  }

  return finalCount;
}
