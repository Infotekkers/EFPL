import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/domain/points/point_user_player.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

class PointsPlayerWidget extends StatelessWidget {
  final PointUserPlayer currentUserPlayer;
  const PointsPlayerWidget({
    Key? key,
    required this.currentUserPlayer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransferBloc, TransferState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return InkWell(
          child: Container(
            height: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            color: state.transferredInPlayerIdList
                    .contains(currentUserPlayer.playerId)
                ? ConstantColors.primary_400
                : ConstantColors.neutral_200.withOpacity(0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          // width: double.infinity,
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/shirt.svg",
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Player Name
                  Container(
                    color: ConstantColors.primary_900,
                    width: double.infinity,
                    height: 30,
                    child: Center(
                      child: Text(
                        currentUserPlayer.playerName.value.fold(
                          (l) => '',
                          (r) => r.split(" ")[0],
                        ),
                        style: const TextStyle(
                          color: ConstantColors.neutral_200,
                        ),
                      ),
                    ),
                  ),

                  // Player Price
                  Container(
                    height: 25,
                    width: double.infinity,
                    color: ConstantColors.primary_900.withOpacity(0.8),
                    child: Center(
                      child: Text(
                        "Data",
                        style: const TextStyle(
                          color: ConstantColors.neutral_200,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Future<void> transferPlayer(_transferBloc, currentUserPlayer, context) async {
  // Set player position
  _transferBloc.add(
    TransferEvent.setTransferOutPlayer(
      transferOutPlayerId: currentUserPlayer.playerId,
      playerPosition: currentUserPlayer.playerPosition,
    ),
  );

  // get all players in position
  _transferBloc.add(
    const TransferEvent.getPlayersInSelectedPosition(),
  );

  var efplCache = await Hive.openBox('efplCache');
  List? allTeams = efplCache.get("allTeams");

  Navigator.pop(context);

  Navigator.pushNamed(
    context,
    "/transfer",
    arguments: {
      "allTeams": allTeams!,
      "currentPlayerId": currentUserPlayer.playerId
    },
  );
}

void cancelOnePlayerTransfer(_transferBloc, currentUserPlayer, context) {
  _transferBloc.add(
    TransferEvent.cancelOneTransfer(
        playerToCancelId: currentUserPlayer.playerId),
  );

  Navigator.pop(context);
}

String getFixtureTeamAcronym(String fixtureTeam) {
  List nameList = fixtureTeam.split(" ");
  String acronym = "";

  nameList.length == 1
      ? acronym = acronym +
          nameList[0].split("")[0] +
          nameList[0].split("")[1] +
          nameList[0].split("")[2] +
          " ( " +
          fixtureTeam.split("+-")[1] +
          " ) "
      : nameList.length == 2
          ? acronym = acronym +
              nameList[0].split("")[0] +
              nameList[0].split("")[1] +
              nameList[1].split("")[0] +
              " ( " +
              fixtureTeam.split("+-")[1] +
              " ) "
          : acronym = acronym +
              nameList[0].split("")[0] +
              nameList[1].split("")[0] +
              nameList[2].split("")[0] +
              " ( " +
              fixtureTeam.split("+-")[1] +
              " ) ";
  return acronym;
}

int isHomeTeam(String fixtureTeam) {
  int isHomeValue = 0;

  if (fixtureTeam.split("+-").last == "H") {
    isHomeValue = 1;
  }

  return isHomeValue;
}
