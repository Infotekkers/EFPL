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
    List<int> allPlayerCount = getPlayerCount(fixture: fixture);
    Map<dynamic, dynamic> homeTeamLineUp =
        fixture.homeTeamLineUp.value.fold((l) => {}, (r) => r);

    Map<dynamic, dynamic> awayTeamLineUp =
        fixture.awayTeamLineUp.value.fold((l) => {}, (r) => r);

    return BlocProvider.value(
      value: getIt<FixtureBloc>(),
      child: BlocConsumer<FixtureBloc, FixtureState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(
            child: homeTeamLineUp.isEmpty && awayTeamLineUp.isEmpty
                ? const SizedBox(
                    height: 350,
                    child: Center(
                      child: Text(
                        "No Lineups yet",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Architect",
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
                              SizedBox(
                                height: 16,
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
                                          homeTeamLineUp['goalkeepers'][index]
                                                  ['playerName']
                                              .toString(),
                                        ),
                                        Text(
                                          awayTeamLineUp['goalkeepers'][index]
                                                  ['playerName']
                                              .toString(),
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
                              const Text(
                                "DEFENDERS",
                                style: TextStyle(
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
                                          ),
                                          Text(
                                            awayTeamLineUp['defenders'].length -
                                                        1 >=
                                                    index
                                                ? awayTeamLineUp['defenders']
                                                        [index]['playerName']
                                                    .toString()
                                                : "",
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
                                  width: 0.5, color: Colors.lightBlue.shade900),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
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
                              const Text(
                                "ATTACKERS",
                                style: TextStyle(
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
                                          ),
                                          Text(
                                            awayTeamLineUp['strikers'].length -
                                                        1 >=
                                                    index
                                                ? awayTeamLineUp['strikers']
                                                        [index]['playerName']
                                                    .toString()
                                                : "",
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
                              const Text(
                                "SUBSTITUTES",
                                style: TextStyle(
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
                                          ),
                                          Text(
                                            awayTeamLineUp['bench'].length -
                                                        1 >=
                                                    index
                                                ? awayTeamLineUp['bench'][index]
                                                        ['playerName']
                                                    .toString()
                                                : "",
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
                                color: Colors.lightBlue.shade900,
                              ),
                              bottom: BorderSide(
                                width: 0.5,
                                color: Colors.lightBlue.shade900,
                              ),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              const Text(
                                "COACHES",
                                style: TextStyle(
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
                                  ),
                                  Text(
                                    fixture.awayTeamCoach.value.fold((l) => '',
                                        (r) => r.isEmpty ? "---" : r),
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

  if (homeTeamLineUp.isNotEmpty && awayTeamLineUp.isNotEmpty) {
    int maxGkCount = homeTeamLineUp['goalkeepers'].length >
            awayTeamLineUp['goalkeepers'].length
        ? homeTeamLineUp['goalkeepers'].length
        : awayTeamLineUp['goalkeepers'].length;

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

    finalCount = [
      maxGkCount,
      maxDefCount,
      maxMidCount,
      maxAttCount,
      maxBenchCount
    ];
  }

  return finalCount;
}
