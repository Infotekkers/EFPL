import 'package:efpl/application/efpl_stats/efpl_stats_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/core/player_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EFPLStatsDreamTeam extends StatelessWidget {
  const EFPLStatsDreamTeam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<EfplStatsBloc>()),
      ],
      child: BlocConsumer<EfplStatsBloc, EfplStatsState>(
        listener: (context, state) {},
        builder: (context, state) {
          List allFormattedPlayers =
              formatAllDreamTeamPlayers(dreamTeam: state.dreamTeam);

          List bestPerformer = getBestPerformer(dreamTeam: state.dreamTeam);

          return Scaffold(
            appBar: _buildAppBar(context: context),
            body: _buildBody(
              context: context,
              allFormattedPlayers: allFormattedPlayers,
              bestPerformer: bestPerformer,
            ),
          );
        },
      ),
    );
  }
}

PreferredSizeWidget _buildAppBar({required BuildContext context}) {
  return AppBar(
    elevation: 0,
    toolbarHeight: 60,
    backgroundColor: Colors.blue[50],
    foregroundColor: ConstantColors.primary_900,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.blue[50],
    ),
    title: Container(
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
      child: Text(
        AppLocalizations.of(context)!.dreamTeam,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.25,
            ),
      ),
    ),
  );
}

Widget _buildBody({
  required BuildContext context,
  required List allFormattedPlayers,
  required List bestPerformer,
}) {
  return SingleChildScrollView(
    child: allFormattedPlayers[0].isEmpty
        ? Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.blue[50],
            child: Center(
              child: Text(
                "No Dream Team",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
          )
        : Container(
            color: Colors.blue[50],
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                // GK
                _buildPlayerView(
                    context: context,
                    count: 1,
                    playerList: allFormattedPlayers[0]),
                const SizedBox(
                  height: 12,
                ),
                // DEF
                _buildPlayerView(
                    context: context,
                    count: allFormattedPlayers[1].length,
                    playerList: allFormattedPlayers[1]),
                const SizedBox(
                  height: 12,
                ),
                // MID
                _buildPlayerView(
                    context: context,
                    count: allFormattedPlayers[2].length,
                    playerList: allFormattedPlayers[2]),
                const SizedBox(
                  height: 12,
                ),
                // ATT
                _buildPlayerView(
                  context: context,
                  count: allFormattedPlayers[3].length,
                  playerList: allFormattedPlayers[3],
                ),
                const SizedBox(
                  height: 16,
                ),
                bestPerformer[0].isNotEmpty
                    ? _buildInfoView(
                        context: context, bestPerformer: bestPerformer)
                    : Container(),
              ],
            ),
          ),
  );
}

Widget _buildPlayerView({
  required BuildContext context,
  required int count,
  required List playerList,
}) {
  return SizedBox(
    height: 130,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: count,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  // final currentPlayerId = allFormattedPlayers[1][index].playerId;
                  // showCustomModal(
                  //   showContext: context,
                  //   playerId: currentPlayerId,
                  // );
                },
                child: PlayerWidget(
                  playerName: playerList[index]['playerName'],
                  description: playerList[index]['score'].toString(),
                  teamName: playerList[index]['eplTeamId'],
                  isCaptain: false,
                  isViceCaptain: false,
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}

Widget _buildInfoView(
    {required BuildContext context, required List bestPerformer}) {
  return Container(
    height: 130,
    color: ConstantColors.primary_900.withOpacity(0.25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // PLayer Info
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Row(
            children: [
              // Player Shirt
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: SvgPicture.asset(
                  "assets/icons/shirt.svg",
                  width: 50,
                  height: 60,
                ),
              ),
              // Player Info
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                padding: const EdgeInsets.fromLTRB(8, 5, 0, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      bestPerformer[0]['eplTeamId'].split(" ")[0],
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.05,
                          ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      bestPerformer[0]['score'].toString(),
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.25,
                          ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      bestPerformer[0]['playerName'].split(" ")[0],
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.25,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

        // Score Sum
        Container(
          width: MediaQuery.of(context).size.width * 0.25,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Total Pts",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                bestPerformer.isNotEmpty ? bestPerformer[1].toString() : "",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.55,
                    ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

List formatAllDreamTeamPlayers({required Map dreamTeam}) {
  return [
    dreamTeam['goalKeeper'],
    dreamTeam['defenders'],
    dreamTeam['midfielders'],
    dreamTeam['attackers'],
  ];
}

List getBestPerformer({required Map dreamTeam}) {
  List allPlayers = [];
  int score = 0;
  for (var position in dreamTeam.keys) {
    if (position != "_id") {
      List player = dreamTeam[position];
      for (var p in player) {
        allPlayers.add(p);
      }
    }
  }
  allPlayers.sort((a, b) => (b['score']).compareTo(a['score']));

  for (var element in allPlayers) {
    score = score + int.parse(element['score'].toString());
  }
  return [allPlayers.isNotEmpty ? allPlayers[0] : [], score];
}
