import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
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

    return BlocBuilder<TransferBloc, TransferState>(
      builder: (context, state) {
        TransferBloc _transferBloc = getIt<TransferBloc>();

        return InkWell(
          onTap: () {
            _buildModalSheet(
                context: context,
                currentUserPlayer: currentUserPlayer,
                transferBloc: _transferBloc);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: state.transferredInPlayerIdList
                      .contains(currentUserPlayer.playerId)
                  ? Colors.amber[800]
                  : Colors.white,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      // SHIRT
                      _buildShirtView(),

                      // INJURY STATUS
                      _buildInjuryView(
                        context: context,
                        injuryStatus: injuryStatus,
                      ),

                      //CAPTAIN & VICE STATUS
                      _buildCaptainView(
                        context: context,
                        isCaptain: currentUserPlayer.isCaptain,
                        isViceCaptain: currentUserPlayer.isViceCaptain,
                      )
                    ],
                  ),

                  // PLAYER NAME
                  _buildPlayerNameView(
                    context: context,
                    currentUserPlayer: currentUserPlayer,
                  ),

                  // PLAYER PRICE
                  _buildPlayerPriceView(
                    currentUserPlayer: currentUserPlayer,
                    context: context,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

void _buildModalSheet(
    {required BuildContext context,
    required UserPlayer currentUserPlayer,
    required TransferBloc transferBloc}) {
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
        child: BlocBuilder<TransferBloc, TransferState>(
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
                      Navigator.of(context).pushNamed("/player",
                          arguments: int.parse(currentUserPlayer.playerId));
                    },
                    child: Row(
                      children: [
                        Container(
                          child: const Icon(Icons.info),
                          margin: const EdgeInsets.fromLTRB(0, 0, 3, 0),
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
                          ? cancelOnePlayerTransfer(
                              transferBloc, currentUserPlayer, context)
                          : transferPlayer(
                              transferBloc, currentUserPlayer, context);
                    },
                    child: Row(
                      children: [
                        Container(
                          child: const Icon(Boxicons.bx_transfer),
                          margin: const EdgeInsets.fromLTRB(0, 0, 3, 0),
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
                                      currentUserPlayer.upComingFixtures[index],
                                    ) ==
                                    1
                                ? ConstantColors.success_300
                                : ConstantColors.error_300,
                          ),
                          child: Center(
                            child: Text(
                              getFixtureTeamAcronym(
                                currentUserPlayer.upComingFixtures[index],
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
}

Widget _buildShirtView() {
  return Center(
    child: Container(
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
  );
}

Widget _buildInjuryView(
    {required String injuryStatus, required BuildContext context}) {
  return injuryStatus == '' || injuryStatus == 'none'
      ? Container()
      : Positioned(
          top: 5,
          left: 10,
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: int.parse(injuryStatus.toString()) >= 50
                  ? Colors.amber
                  : Colors.red,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                injuryStatus,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: int.parse(injuryStatus.toString()) >= 50
                          ? Colors.black
                          : Colors.white,
                    ),
              ),
            ),
          ),
        );
}

Widget _buildCaptainView(
    {required bool isCaptain,
    required bool isViceCaptain,
    required BuildContext context}) {
  return isCaptain == false && isViceCaptain == false
      ? Container()
      : Positioned(
          bottom: 5,
          right: 10,
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.blue[400],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                isCaptain ? "C" : "V",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        );
}

Widget _buildPlayerPriceView(
    {required UserPlayer currentUserPlayer, required BuildContext context}) {
  return SizedBox(
    height: 15,
    width: 70,
    child: Center(
      child: Text(
        // currentUserPlayer.currentPrice.value.fold(
        //   (l) => '',
        //   (r) => r.toString(),
        currentUserPlayer.multiplier.toString(),
        // ),
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: ConstantColors.primary_900,
            ),
      ),
    ),
  );
}

Widget _buildPlayerNameView(
    {required UserPlayer currentUserPlayer, required BuildContext context}) {
  return Container(
    width: 70,
    height: 16,
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: Center(
      child: Text(
        currentUserPlayer.playerName.value.fold(
          (l) => '',
          (r) => r.split(" ")[0],
        ),
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: ConstantColors.primary_900,
            ),
      ),
    ),
  );
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

  var efplCache = await Hive.openBox('transferCache');
  List? allTeams = efplCache.get("allTeams");

  Navigator.pop(context);

  Navigator.pushNamed(
    context,
    "/transfer",
    arguments: {
      "allTeams": allTeams,
      "currentPlayerId": currentUserPlayer.playerId,
      "isInitial": false,
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
