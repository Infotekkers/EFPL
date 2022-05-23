import 'package:efpl/application/points/points_bloc.dart';
import 'package:efpl/domain/points/point_user_player.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/core/player_card.dart';
import 'package:efpl/presentation/points/widgets/player_stat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

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

        String activeChip = "";
        switch (state.pointsInfo.activeChip) {
          // empty
          case "":
            activeChip = "";
            break;

          // free hit
          case "FH":
            activeChip = "Free Hit";
            break;

          // Wild Card
          case "WC":
            activeChip = "Wild Card";
            break;

          // Triple Captain
          case "TC":
            activeChip = "Triple Captain";
            break;

          // Triple Captain
          case "BB":
            activeChip = "Bench Boost";
            break;

          default:
            activeChip = "";
        }

        return state.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : LiquidPullToRefresh(
                onRefresh: () async {
                  _pointsBloc.add(
                    const PointsEvent.getPointsInfo(),
                  );
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // TEAM INFO
                      SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // TEAM NAME
                            Text(
                              state.pointsInfo.teamName,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.25,
                              ),
                            ),

                            const SizedBox(
                              height: 5,
                            ),

                            // Game Week Number
                            Text(
                              "GW " + state.gameWeekId.toString(),
                            )
                          ],
                        ),
                      ),

                      // GAMEWEEK CONTROLLER
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 12),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                _pointsBloc.add(
                                  const PointsEvent.decreaseGameWeek(),
                                );
                              },
                              child: const Icon(Icons.arrow_back_ios),
                            ),
                            Text("GameWeek  " + state.gameWeekId.toString()),
                            InkWell(
                              onTap: () {
                                _pointsBloc.add(
                                  const PointsEvent.increaseGameWeek(),
                                );
                              },
                              child: const Icon(Icons.arrow_forward_ios),
                            )
                          ],
                        ),
                      ),

                      // TOP BOX
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        color: ConstantColors.neutral_200,
                        height: 170,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // POINTS BOARD
                            Container(
                              width: 110,
                              height: 70,
                              decoration: BoxDecoration(
                                color: ConstantColors.primary_900,
                                boxShadow: [
                                  BoxShadow(
                                    color: ConstantColors.primary_900
                                        .withOpacity(0.08),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    state.allPlayersPointSum.toString() +
                                        " Pts",
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  activeChip == ""
                                      ? Container()
                                      : Text(
                                          activeChip,
                                          style: const TextStyle(
                                            color: ConstantColors.neutral_200,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15.0,
                                            letterSpacing: 0.35,
                                          ),
                                        ),
                                ],
                              ),
                            ),

                            const SizedBox(
                              width: 45,
                            ),

                            // GOALKEEPER
                            ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: allFormattedPlayers[0].length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    showCustomModal(
                                      showContext: context,
                                      playerId: allFormattedPlayers[0][index]
                                          .playerId,
                                    );
                                  },
                                  child: PlayerWidget(
                                    playerName: allFormattedPlayers[0][index]
                                        .playerName
                                        .value
                                        .fold(
                                          (l) => '',
                                          (r) => r,
                                        ),
                                    description: allFormattedPlayers[0][index]
                                            .score
                                            .isNotEmpty
                                        ? (allFormattedPlayers[0][index]
                                            .score[0]['fantasyScore']
                                            .toString())
                                        : '0',
                                    teamName: "shirt.svg",
                                  ),
                                );
                              },
                            ),

                            const SizedBox(
                              width: 45,
                            ),

                            // DEDUCTION
                            Container(
                              width: 100,
                              height: 70,
                              decoration: BoxDecoration(
                                color: ConstantColors.primary_900,
                                boxShadow: [
                                  BoxShadow(
                                    color: ConstantColors.primary_900
                                        .withOpacity(0.08),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // DEDUCTION INFO
                                  state.pointsInfo.deduction == 0
                                      ? const Text(
                                          "0",
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : Text(
                                          (state.pointsInfo.deduction / 4)
                                                  .toStringAsFixed(0) +
                                              " ( -" +
                                              state.pointsInfo.deduction
                                                  .toString() +
                                              " )",
                                          style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.25,
                                          ),
                                        ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  const Text(
                                    "Transfers",
                                    style: TextStyle(
                                      color: ConstantColors.neutral_200,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                      letterSpacing: 0.35,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // DEFENDERS
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        height: 170,
                        child: Center(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: allFormattedPlayers[1].length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  final currentPlayerId =
                                      allFormattedPlayers[1][index].playerId;
                                  showCustomModal(
                                    showContext: context,
                                    playerId: currentPlayerId,
                                  );
                                },
                                child: PlayerWidget(
                                  playerName: allFormattedPlayers[1][index]
                                      .playerName
                                      .value
                                      .fold(
                                        (l) => '',
                                        (r) => r,
                                      ),
                                  description: allFormattedPlayers[1][index]
                                          .score
                                          .isNotEmpty
                                      ? (allFormattedPlayers[1][index]
                                          .score[0]['fantasyScore']
                                          .toString())
                                      : '0',
                                  teamName: "shirt.svg",
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      // MIDFIELDERS
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        color: ConstantColors.neutral_200,
                        height: 170,
                        child: Center(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: allFormattedPlayers[2].length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  showCustomModal(
                                      showContext: context,
                                      playerId: allFormattedPlayers[2][index]
                                          .playerId);
                                },
                                child: PlayerWidget(
                                  playerName: allFormattedPlayers[2][index]
                                      .playerName
                                      .value
                                      .fold(
                                        (l) => '',
                                        (r) => r,
                                      ),
                                  description: allFormattedPlayers[2][index]
                                          .score
                                          .isNotEmpty
                                      ? (allFormattedPlayers[2][index]
                                          .score[0]['fantasyScore']
                                          .toString())
                                      : '0',
                                  teamName: "shirt.svg",
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      // ATTACKERS
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        height: 170,
                        child: Center(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: allFormattedPlayers[3].length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  showCustomModal(
                                      showContext: context,
                                      playerId: allFormattedPlayers[3][index]
                                          .playerId);
                                },
                                child: PlayerWidget(
                                  playerName: allFormattedPlayers[3][index]
                                      .playerName
                                      .value
                                      .fold(
                                        (l) => '',
                                        (r) => r,
                                      ),
                                  description: allFormattedPlayers[3][index]
                                          .score
                                          .isNotEmpty
                                      ? (allFormattedPlayers[3][index]
                                          .score[0]['fantasyScore']
                                          .toString())
                                      : '0',
                                  teamName: "shirt.svg",
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      // SUBS
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        color: ConstantColors.neutral_200,
                        height: 170,
                        child: Center(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: allFormattedPlayers[4].length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  showCustomModal(
                                      showContext: context,
                                      playerId: allFormattedPlayers[4][index]
                                          .playerId);
                                },
                                child: PlayerWidget(
                                  playerName: allFormattedPlayers[4][index]
                                      .playerName
                                      .value
                                      .fold(
                                        (l) => '',
                                        (r) => r,
                                      ),
                                  description: allFormattedPlayers[4][index]
                                          .score
                                          .isNotEmpty
                                      ? (allFormattedPlayers[4][index]
                                          .score[0]['fantasyScore']
                                          .toString())
                                      : '0',
                                  teamName: "shirt.svg",
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}

// Function to classify players by position
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

  return [allGK, allDEF, allMID, allATT, allBench];
}

// Function to show modal
void showCustomModal(
    {required BuildContext showContext, required String playerId}) {
  final scoreMap = {
    "GK": {
      "goal": 5,
      "assist": 4,
    },
    "DEF": {
      "goal": 5,
      "assist": 4,
    },
    "MID": {
      "goal": 5,
      "assist": 4,
    },
    "ATT": {
      "goal": 5,
      "assist": 4,
    }
  };

  showModalBottomSheet(
      context: showContext,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      builder: (builder) {
        return BlocProvider.value(
          value: getIt<PointsBloc>(),
          child: BlocConsumer<PointsBloc, PointsState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              PointUserPlayer currentPlayer = state.pointsInfo.allPlayers
                  .where((player) =>
                      player.playerId.toString() == playerId.toString())
                  .toList()[0];

              String currentPlayerPosition =
                  currentPlayer.playerPosition.value.fold(
                (l) => '',
                (r) => r,
              );
              return Container(
                height: 300,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 8,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      // Fixture Info
                      Text(
                        currentPlayer.playerName.value.fold(
                          (l) => '',
                          (r) => r,
                        ),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Architect",
                          letterSpacing: 0.25,
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      // Score Info
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Home Team
                          Text(
                            currentPlayer.fixtureTeams.split("v")[0],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Architect",
                            ),
                          ),

                          const SizedBox(
                            width: 5,
                          ),

                          // Score Board
                          Container(
                            width: 50,
                            height: 30,
                            color: ConstantColors.primary_900.withOpacity(0.1),
                            child: Center(
                              child: Text(
                                currentPlayer.fixtureScore.split("v").join("-"),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.45,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            width: 5,
                          ),

                          // Away Team
                          Text(
                            currentPlayer.fixtureTeams.split("v")[1],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Architect",
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      // HEADER
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                        color: ConstantColors.neutral_300,
                        child: Row(
                          children: [
                            // STATISTICS
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 0.5 - 10,
                              child: const Text(
                                "Statistic",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ),

                            // VALUE
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 0.25 - 10,
                              child: const Text(
                                "Value",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ),

                            // POINTS
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 0.25 - 10,
                              child: const Text(
                                "Pts",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      // SCORE
                      SingleChildScrollView(
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            /* 
                              =======================================================================
                              COMMON SCORES
                              =======================================================================
                            */
                            // MINUTES PLAYED
                            PlayerStatDisplay(
                              statisticName: "Minutes Played",
                              statisticValue: currentPlayer.score.isNotEmpty
                                  ? currentPlayer.score[0]['minutesPlayed']
                                  : 0,
                              statisticPoint: currentPlayer.score.isNotEmpty
                                  ? currentPlayer.score[0]['minutesPlayed'] > 45
                                      ? 2
                                      : 1
                                  : 0,
                            ),

                            // GOALS SCORED
                            currentPlayer.score.isNotEmpty &&
                                    currentPlayer.score[0]['minutesPlayed'] > 0
                                ? PlayerStatDisplay(
                                    statisticName: "Goals",
                                    statisticValue: currentPlayer.score[0]
                                        ['goals'],
                                    statisticPoint: scoreMap[
                                        currentPlayerPosition]!['goals']!,
                                  )
                                : Container(),

                            // ASSISTS
                            currentPlayer.score.isNotEmpty &&
                                    currentPlayer.score[0]['minutesPlayed'] > 0
                                ? PlayerStatDisplay(
                                    statisticName: "Assists",
                                    statisticValue: currentPlayer.score[0]
                                        ['assists'],
                                    statisticPoint: scoreMap[
                                        currentPlayerPosition]!['assists']!,
                                  )
                                : Container(),

                            // YELLOW CARD
                            currentPlayer.score.isNotEmpty &&
                                    currentPlayer.score[0]['minutesPlayed'] > 0
                                ? PlayerStatDisplay(
                                    statisticName: "Yellows",
                                    statisticValue: currentPlayer.score[0]
                                        ['yellows'],
                                    statisticPoint: scoreMap[
                                        currentPlayerPosition]!['yellows']!,
                                  )
                                : Container(),

                            // RED CARDS
                            currentPlayer.score.isNotEmpty &&
                                    currentPlayer.score[0]['minutesPlayed'] > 0
                                ? PlayerStatDisplay(
                                    statisticName: "Reds",
                                    statisticValue: currentPlayer.score[0]
                                        ['reds'],
                                    statisticPoint: scoreMap[
                                        currentPlayerPosition]!['reds']!,
                                  )
                                : Container(),

                            /* 
                              =======================================================================
                              GOALKEEPERS SCORES
                              =======================================================================
                            */
                            // Saves
                            currentPlayer.score.isNotEmpty &&
                                    currentPlayer.score[0]['minutesPlayed'] >
                                        0 &&
                                    currentPlayerPosition == "GK"
                                ? PlayerStatDisplay(
                                    statisticName: "Saves",
                                    statisticValue: currentPlayer.score[0]
                                        ['saves'],
                                    statisticPoint:
                                        currentPlayer.score[0]['saves'] * 1,
                                  )
                                : Container(),

                            // penalitiesSaved
                            currentPlayer.score.isNotEmpty &&
                                    currentPlayer.score[0]['minutesPlayed'] >
                                        0 &&
                                    currentPlayerPosition == "GK"
                                ? PlayerStatDisplay(
                                    statisticName: "Penalty Saved",
                                    statisticValue: currentPlayer.score[0]
                                        ['penalitiesSaved'],
                                    statisticPoint: currentPlayer.score[0]
                                            ['penalitiesSaved'] *
                                        3,
                                  )
                                : Container(),

                            /* 
                              =======================================================================
                              CLEAN SHEET
                              =======================================================================
                            */
                            currentPlayer.score.isNotEmpty &&
                                    currentPlayer.score[0]['minutesPlayed'] >
                                        0 &&
                                    (currentPlayerPosition == "GK" ||
                                        currentPlayerPosition == "DEF" ||
                                        currentPlayerPosition == "MID")
                                ? PlayerStatDisplay(
                                    statisticName: "Clean Sheet",
                                    statisticValue: currentPlayer.score[0]
                                        ['cleanSheet'],
                                    statisticPoint: currentPlayer.score[0]
                                            ['cleanSheet'] *
                                        3,
                                  )
                                : Container(),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 32,
                      ),

                      InkWell(
                        // TODO:ADD
                        onTap: () {},
                        child: Container(
                          width: 150,
                          height: 30,
                          color: ConstantColors.primary_900,
                          child: const Center(
                            child: Text(
                              "Player Information",
                              style: TextStyle(
                                color: ConstantColors.neutral_200,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      });
}
