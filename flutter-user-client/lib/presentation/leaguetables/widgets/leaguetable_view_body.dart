import 'package:efpl/application/leagueTable/leaguetable_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:efpl/presentation/core/widgets/bouncing_ball_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../colors.dart';

class LeagueTableViewBody extends StatelessWidget {
  const LeagueTableViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LeagueTableBloc, LeagueTableState>(
      listener: (_, __) => {},
      builder: (context, state) => state.map(
        initial: (_) => const Text("Initial"),
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
            appBar: AppBar(
              title: Text(
                "EPL Table",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.blue[50],
              ),
              backgroundColor: Colors.blue[50],
              foregroundColor: ConstantColors.primary_900,
              elevation: 0,
            ),
            body: Column(children: [
              const TableHeader(),
              Expanded(
                child: ListView.builder(
                  itemCount: state.leagueTable.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: 40,
                      decoration: BoxDecoration(
                        color: index % 2 != 0 ? Colors.blue[50] : Colors.white,
                        border: Border(
                          bottom:
                              BorderSide(width: 1, color: Colors.grey.shade300),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Flexible(
                                  child: Image.asset(
                                    "assets/images${state.leagueTable[index].teamLogo.getOrCrash()}",
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                                Text(
                                  "${state.leagueTable[index].teamName.getOrCrash().split(" ")[0][0]}${state.leagueTable[index].teamName.getOrCrash().split(" ")[1][0]}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              '0',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${state.leagueTable[index].won.getOrCrash()}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${state.leagueTable[index].Draw.getOrCrash()}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${state.leagueTable[index].lost.getOrCrash()}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${state.leagueTable[index].goalDifferential.getOrCrash()}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${state.leagueTable[index].teamPoint.getOrCrash()}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}

class TableHeader extends StatelessWidget {
  const TableHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.bodyText2!.copyWith(
          letterSpacing: 0.5,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        );
    return Container(
      height: 30,
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Expanded(
              child: Text(
            "Pos",
            style: style,
          )),
          Expanded(
              flex: 2,
              child: Text(
                "Club",
                style: style,
              )),
          Expanded(
            child: Text(
              "P",
              style: style,
            ),
          ),
          Expanded(
            child: Text(
              "W",
              style: style,
            ),
          ),
          Expanded(
            child: Text(
              "D",
              style: style,
            ),
          ),
          Expanded(
            child: Text(
              "L",
              style: style,
            ),
          ),
          Expanded(
            child: Text(
              "GD",
              style: style,
            ),
          ),
          Expanded(
            child: Text(
              "Pts",
              style: style,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.blue[50],
      ),
    );
  }
}
