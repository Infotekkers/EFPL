import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

class UserPlayerWidget extends StatelessWidget {
  final UserPlayer currentUserPlayer;
  const UserPlayerWidget({
    Key? key,
    required this.currentUserPlayer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String injuryStatus = currentUserPlayer.availability.value.fold(
      (l) => '',
      (r) => r['injuryStatus'].toString(),
    );

    return BlocConsumer<TransferBloc, TransferState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        TransferBloc _transferBloc = getIt<TransferBloc>();

        return InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              builder: (builder) {
                return BlocProvider.value(
                  value: getIt<TransferBloc>(),
                  child: BlocConsumer<TransferBloc, TransferState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return Container(
                        height: 235,
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 8,
                        ),
                        child: Column(
                          children: [
                            // Player Name
                            Text(
                              currentUserPlayer.playerName.value
                                  .fold((l) => '', (r) => r),
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

                            // Player Information Button
                            InkWell(
                              onTap: () {
                                print("Player Information");
                              },
                              child: Row(
                                children: [
                                  Container(
                                    child: const Icon(Icons.info),
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 3, 0),
                                  ),
                                  const Text("Player Information"),
                                ],
                              ),
                            ),

                            const SizedBox(
                              height: 10,
                            ),

                            // Transfer
                            InkWell(
                              onTap: () {
                                state.transferredInPlayerIdList
                                        .contains(currentUserPlayer.playerId)
                                    ? cancelOnePlayerTransfer(_transferBloc,
                                        currentUserPlayer, context)
                                    : transferPlayer(_transferBloc,
                                        currentUserPlayer, context);
                              },
                              child: Row(
                                children: [
                                  Container(
                                    child: const Icon(Boxicons.bx_transfer),
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 3, 0),
                                  ),
                                  state.transferredInPlayerIdList
                                          .contains(currentUserPlayer.playerId)
                                      ? const Text("Cancel Transfer")
                                      : const Text("Transfer")
                                ],
                              ),
                            ),

                            const SizedBox(
                              height: 15,
                            ),

                            const Text(
                              "Upcoming Fixtures",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Architect",
                                letterSpacing: 0.25,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 6,
                                  childAspectRatio: 2.8,
                                ),
                                itemCount: 6,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 40,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: ConstantColors.primary_900,
                                        width: 0.55,
                                      ),
                                      color: isHomeTeam(
                                                currentUserPlayer
                                                    .upComingFixtures[index],
                                              ) ==
                                              1
                                          ? ConstantColors.success_300
                                          : ConstantColors.error_300,
                                    ),
                                    child: Center(
                                      child: Text(
                                        getFixtureTeamAcronym(
                                          currentUserPlayer
                                              .upComingFixtures[index],
                                        ),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
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
                      injuryStatus.isEmpty
                          ? Container()
                          : Positioned(
                              bottom: 0,
                              left: 2,
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: int.parse(injuryStatus) < 50
                                      ? ConstantColors.error_200
                                      : ConstantColors.warning_200,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                    child: Text(
                                  injuryStatus + "%",
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                )),
                              ),
                            )
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
                        currentUserPlayer.currentPrice.value.fold(
                          (l) => '',
                          (r) => r.toString(),
                        ),
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
