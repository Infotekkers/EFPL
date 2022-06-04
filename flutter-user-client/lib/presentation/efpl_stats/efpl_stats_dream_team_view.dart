import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/core/player_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EFPLStatsDreamTeam extends StatelessWidget {
  const EFPLStatsDreamTeam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context: context),
      body: _buildBody(context: context),
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
        AppLocalizations.of(context)!.transferList,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.25,
            ),
      ),
    ),
  );
}

Widget _buildBody({required BuildContext context}) {
  return SingleChildScrollView(
    child: Container(
      color: Colors.blue[50],
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          // GK
          _buildPlayerView(context: context, count: 1),
          const SizedBox(
            height: 12,
          ),
          // DEF
          _buildPlayerView(context: context, count: 5),
          const SizedBox(
            height: 12,
          ),
          // MID
          _buildPlayerView(context: context, count: 3),
          const SizedBox(
            height: 12,
          ),
          // ATT
          _buildPlayerView(context: context, count: 2),
          const SizedBox(
            height: 16,
          ),
          _buildInfoView(context: context)
        ],
      ),
    ),
  );
}

Widget _buildPlayerView({required BuildContext context, required int count}) {
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
                child: const PlayerWidget(
                  // playerName: allFormattedPlayers[1][index].playerName.value.fold(
                  //       (l) => '',
                  //       (r) => r,
                  //     ),

                  // description: allFormattedPlayers[1][index].score.isNotEmpty
                  //     ? (allFormattedPlayers[1][index]
                  //         .score[0]['fantasyScore']
                  //         .toString())
                  //     : '0',
                  // teamName: allFormattedPlayers[1][index].eplTeamId.value.fold(
                  //       (l) => "",
                  //       (r) => r,
                  //     ),
                  // isCaptain: allFormattedPlayers[1][index].isCaptain,
                  // isViceCaptain: allFormattedPlayers[1][index].isViceCaptain,
                  playerName: "Name",
                  description: "38",
                  teamName: "teamName",
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

Widget _buildInfoView({required BuildContext context}) {
  return Container(
    height: 130,
    color: ConstantColors.primary_900.withOpacity(0.25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // PLayer Info
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Row(
            children: [
              // Player Shirt
              Container(
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
                      "Man Utd",
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
                      "36 Pts",
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
                      "Sancho",
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
                "190",
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
