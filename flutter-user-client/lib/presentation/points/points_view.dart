import 'package:efpl/application/points/points_bloc.dart';
import 'package:efpl/domain/points/point_user_player.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/points/widgets/points_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PointsView extends StatelessWidget {
  const PointsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pointsBloc = getIt<PointsBloc>();
    return BlocConsumer<PointsBloc, PointsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        List<List<PointUserPlayer>> allFormattedPlayers =
            formatPlayersByPosition(allPlayers: state.pointsInfo.allPlayers);

        double maxHeight = MediaQuery.of(context).size.height;
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(5, 18, 5, 30),
            child: Column(
              children: [
                // Team name & Gw
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      state.pointsInfo.teamName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ConstantColors.neutral_700,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "GW " + state.pointsInfo.gameWeekId.toString(),
                    )
                  ],
                ),

                // / Game Week Controller
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                  // margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: ConstantColors.neutral_200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () async {
                          _pointsBloc.add(
                            const PointsEvent.decreaseGameWeek(),
                          );
                        },
                        child: const Icon(Icons.arrow_back_ios),
                      ),
                      Text("GameWeek  " +
                          state.pointsInfo.gameWeekId.toString()),
                      InkWell(
                        onTap: () async {
                          _pointsBloc.add(
                            const PointsEvent.increaseGameWeek(),
                          );
                        },
                        child: const Icon(Icons.arrow_forward_ios),
                      )
                    ],
                  ),
                ),

                //  GK
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  color: ConstantColors.neutral_300,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: ListView.builder(
                    // shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: allFormattedPlayers[0].length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Text(
                          allFormattedPlayers[0][index].playerName.value.fold(
                                (l) => '',
                                (r) => r,
                              ),
                        ),
                      );
                    },
                  ),
                ),
                //  DEF
                Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.purple,
                  child: ListView.builder(
                    // shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: allFormattedPlayers[1].length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Text(
                          allFormattedPlayers[1][index].playerName.value.fold(
                                (l) => '',
                                (r) => r,
                              ),
                        ),
                      );
                    },
                  ),
                ),

                //  MID
                Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.teal,
                  child: ListView.builder(
                    // shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: allFormattedPlayers[2].length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Text(
                          allFormattedPlayers[2][index].playerName.value.fold(
                                (l) => '',
                                (r) => r,
                              ),
                        ),
                      );
                    },
                  ),
                ),

                // ATT
                Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.amber,
                  child: ListView.builder(
                    // shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: allFormattedPlayers[3].length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Text(
                          allFormattedPlayers[3][index].playerName.value.fold(
                                (l) => '',
                                (r) => r,
                              ),
                        ),
                      );
                    },
                  ),
                ),

                // SUBS
                Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.pink,
                  child: ListView.builder(
                    // shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: allFormattedPlayers[4].length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Text(
                          allFormattedPlayers[4][index].playerName.value.fold(
                                (l) => '',
                                (r) => r,
                              ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

List<List<PointUserPlayer>> formatPlayersByPosition(
    {required List<PointUserPlayer> allPlayers}) {
  List<PointUserPlayer> allBench =
      allPlayers.where((player) => player.multiplier == 0).toList();

  List<PointUserPlayer> allGK = allPlayers
      .where((player) =>
          player.multiplier == 1 &&
          player.playerPosition.value.fold((l) => '', (r) => r) == 'GK')
      .toList();

  List<PointUserPlayer> allDEF = allPlayers
      .where((player) =>
          player.multiplier == 1 &&
          player.playerPosition.value.fold((l) => '', (r) => r) == 'DEF')
      .toList();

  List<PointUserPlayer> allMID = allPlayers
      .where((player) =>
          player.multiplier == 1 &&
          player.playerPosition.value.fold((l) => '', (r) => r) == 'MID')
      .toList();

  List<PointUserPlayer> allATT = allPlayers
      .where((player) =>
          player.multiplier == 1 &&
          player.playerPosition.value.fold((l) => '', (r) => r) == 'ATT')
      .toList();

  // print(
  //     '${allGK.length} , ${allDEF.length} , ${allMID.length} , ${allATT.length} , ${allBench.length}');

  return [allGK, allDEF, allMID, allATT, allBench];
}
