import 'package:efpl/application/leagueTable/leaguetable_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:efpl/presentation/core/widgets/bouncing_ball_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeagueTableViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LeagueTableBloc, LeagueTableState>(
      listener: (_, __) => {},
      builder: (context, state) => state.map(
          initial: (_) => Container(
                child: const Text("Initial"),
              ),
          loadFailure: (_) => Scaffold(
                appBar: AppBar(
                  title: const Text("EPL Table"),
                ),
                body: const Center(
                  child: Text("Failure"),
                ),
              ),
          loadInProgress: (_) => const BouncingBallLoadingIndicator(),
          loadSuccess: (state) {
            return Scaffold(
              backgroundColor: Colors.green.shade800,
              appBar: AppBar(
                title: const Text("EPL Table"),
              ),
              body: Container(
                // padding: const EdgeInsets.symmetric(horizontal: 10),
                color: Colors.black87,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(children: [
                  Container(
                    height: 20,
                    margin: const EdgeInsets.all(5),
                    child: Row(
                      children: const [
                        Expanded(child: Text("Pos")),
                        Expanded(flex: 2, child: Text("Club")),
                        Expanded(
                          child: Text("P"),
                        ),
                        Expanded(
                          child: Text("W"),
                        ),
                        Expanded(
                          child: Text("D"),
                        ),
                        Expanded(
                          child: Text("L"),
                        ),
                        Expanded(
                          child: Text("GD"),
                        ),
                        Expanded(
                          child: Text("Pts"),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.leagueTable.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey.shade300),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images${state.leagueTable[index].teamLogo.getOrCrash()}",
                                      width: 20,
                                      height: 20,
                                    ),
                                    Text(
                                      "${state.leagueTable[index].teamName.getOrCrash().split(" ")[0][0]}${state.leagueTable[index].teamName.getOrCrash().split(" ")[1][0]}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              const Expanded(
                                child: Text(
                                  '0',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '${state.leagueTable[index].won.getOrCrash()}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '${state.leagueTable[index].Draw.getOrCrash()}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '${state.leagueTable[index].lost.getOrCrash()}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '${state.leagueTable[index].goalDifferential.getOrCrash()}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '${state.leagueTable[index].teamPoint.getOrCrash()}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ]),
              ),
            );
          }),
    );
  }
}
